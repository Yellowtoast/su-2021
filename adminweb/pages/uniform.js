import React, { useEffect, useState } from "react";
import Head from "next/head";
import { useRouter } from "next/router";
import { Map, List, update } from "immutable";

import firebase from "firebase/app";
import "firebase/firestore";
import "firebase/storage";

import Nav from "components/nav";
import LoadingPage from "components/loading/page";

import BeforeStockTable from "components/table/uniform/beforeStock";
import StockTable from "components/table/uniform/stock";
import BeforeShopTable from "components/table/uniform/beforeShop";
import BeforeDelivery from "components/table/uniform/beforeDelivery";
import Shopped from "components/table/uniform/shopped";
import Dropdown, { getClothesTypes } from "components/dropdown";

import styles from  "styles/pages/uniform.module.scss";
import onlyNum from "utils/onlyNum";
import RejectModal from "components/modal/reject";

const Uniform = () => {
  const router = useRouter();
  const { id } = router.query;

  const [loading, setLoading] = useState(true);
  const [uniformInfo, setUniformInfo] = useState({});
  const [checkerGiverName, setCheckerGiverName] = useState("");
  const [checkerGiverBirth, setCheckerGiverBirth] = useState("");
  
  const [images, setImages] = useState(List([]));
  const [school, setSchool] = useState("");
  const [gender, setGender] = useState("");
  const [season, setSeason] = useState("");
  const [clothes, setClothes] = useState(List([]));

  const [logs, setLogs] = useState();

  const [rejectModalOpen, setRejectModalOpen] = useState(false);

  const req = async () => {
    try {
      const doc = await firebase.firestore().collection("daegu").doc("bukgu").collection("uniforms").doc(id).get();
      const data = doc.data();
      setUniformInfo(data);
      setImages(List(data.images.map((img) => ({ url: img, file: null }))));
      setSchool(data["filter-school"]);
      setGender(data["filter-gender"]);
      setSeason(data["filter-season"]);
      setClothes(List(data.uniforms.map(({ clothType, size }) => Map({ clothType, size }))));
      setLoading(false);

      if (data.status === "구매승인요청" && data.receiverCert.length === 0) {
        setCheckerGiverName(data.receiverName);
        setCheckerGiverBirth(data.receiverBirth);
      }
    } catch (err) {
      console.log(err);
    }
  };

  useEffect(() => {
    req();
  }, []);

  const addImages = ({ target: { files } }) => {
    let _files = [];
    for (let i = 0; i < files.length; i++) {
      _files.push({ file: files[i], url: URL.createObjectURL(files[i]) });
    }
  
    if (_files.length !== 0) {
      setImages(images.concat(_files));
    }
  };
  const removeImg = (index) => () => {
    let yes 
    if (uniformInfo.status === "기부승인요청") {
      yes = window.confirm("사진을 삭제하시겠습니까?\n하단에 교복등록까지 누르셔야 최종적용됩니다");
    } else {
      yes = window.confirm("사진을 삭제하시겠습니까?\n하단에 변경사항저장까지 누르셔야 최종적용됩니다");
    }

    if (yes) {
      setImages(images.remove(index));
    }
  };

  const handleSeason = (v) => {
    setSeason(v);
    const updater = () => getClothesTypes(v)[0];
    let c = clothes;
    for (let i = 0; i < clothes.size; i++)
      c = c.updateIn([i, "clothType"], updater);
    setClothes(c);
  };

  const handleClothChange = (index, value) => {
    setClothes(clothes.updateIn([index, "clothType"], () => value));
  };
  const handleSizeChange = (index, value) => {
    setClothes(clothes.updateIn([index, "size"], () => value));
  };
  const addCloth = () => {
    setClothes(clothes.push(Map({ clothType: getClothesTypes(season)[0], size: "" })));
  };
  const removeCloth = (index) => () => {
    const yes = window.confirm("옷을 삭제하시겠습니까?\n삭제하시고 최하단에 저장하기 까지 누르셔야 최종적용됩니다");
    if (yes) {
      setClothes(clothes.remove(index));
    }
  };

  const handleUniformDelete = async () => {
    if (window.confirm("정말로 교복정보를 삭제하시겠습니까?\n삭제후에는 복구하실 수 없습니다")) {
      let updateKey;
      if (uniformInfo.status === "기부승인요청") updateKey = "totalBeforeStock";
      if (uniformInfo.status === "교복보유중") updateKey = "totalStock";
      if (uniformInfo.status === "구매승인요청") updateKey = "totalBeforeShop";
      if (uniformInfo.status === "출고대기중") updateKey = "totalBeforeDelivery";
      if (uniformInfo.status === "최종완료") updateKey = "totalShopped";

      const updateData = {
        [updateKey]: firebase.firestore.FieldValue.increment(-1),
      };

      if (uniformInfo.status === "교복보유중") {
        updateData[
          uniformInfo["filter-school"].indexOf("고등") === -1
            ? `middleSchool.${uniformInfo["filter-school"]}.totalStock`
            : `highSchool.${uniformInfo["filter-school"]}.totalStock`] = firebase.firestore.FieldValue.increment(-1);
      }

      await Promise.all([
        firebase.firestore().collection("daegu").doc("bukgu").collection("uniforms").doc(id).delete(),
        firebase.firestore().collection("daegu").doc("bukgu").update(updateData),
      ]);
      router.back();
    }
  };

  const handleStockConfirm = async () => {
    if (window.confirm("정말로 등록하시겠습니까?\n등록하시면 바로 앱에 유저들에게 교복이 노출됩니다")) {
      const ref = firebase.storage().ref();
      const imgs = await Promise.all(images.toJS().map(async ({ file, url }) => {
        if (!file) {
          return url;
        } else {
          const p = `/daegu/bukgu/${uniformInfo.code}/${new Date().getTime()}.jpg`;
          await ref.child(p).put(file);
          const u = await ref.child(p).getDownloadURL();
          return u;
        }
      }));

      const fct = [];
      clothes.toJS().forEach(({ clothType }) => {
        if (fct.indexOf(clothType) === -1) fct.push(clothType);
      });

      const db = firebase.firestore().collection("daegu").doc("bukgu").collection("uniforms").doc(id);
      const userRef = firebase.firestore().collection("daegu").doc("bukgu").collection('users').doc(uniformInfo.giverUid);
      const userLogRef = userRef.collection("logsUniformDonate").doc("list");
      await Promise.all([
        db.update({
          status: "교복보유중",
          images: imgs,
          "filter-gender": gender,
          "filter-school": school,
          "filter-season": season,
          "filter-clothType": fct,
          "totalImages": imgs.length,
          uniforms: clothes.toJS().map((cloth) => ({ ...cloth, school, gender, season })),
          dateStock: new Date().getTime(),
        }),
        firebase.firestore().collection("daegu").doc("bukgu").update({
          totalBeforeStock: firebase.firestore.FieldValue.increment(-1),
          totalStock: firebase.firestore.FieldValue.increment(1),
          [school.indexOf("고등") === -1
              ? `middleSchool.${school}.totalStock`
              : `highSchool.${school}.totalStock`]: firebase.firestore.FieldValue.increment(1),
        }),
        userLogRef.update({
          [`${id}.showStatus`]: '기부완료',
        }),
        userRef.update({
          "totalAlarms": firebase.firestore.FieldValue.increment(1),
          "totalAlarmsDonate": firebase.firestore.FieldValue.increment(1),
        }),
      ]);
      router.back();
    }
  };

  const handleUpdate = async () => {
    const ref = firebase.storage().ref();
    const imgs = await Promise.all(images.toJS().map(async ({ file, url }) => {
      if (!file) {
        return url;
      } else {
        const p = `/daegu/bukgu/${uniformInfo.code}/${new Date().getTime()}.jpg`;
        await ref.child(p).put(file);
        const u = await ref.child(p).getDownloadURL();
        return u;
      }
    }));

    const fct = [];
    clothes.toJS().forEach(({ clothType }) => {
      if (fct.indexOf(clothType) === -1) fct.push(clothType);
    });

    const db = firebase.firestore().collection("daegu").doc("bukgu").collection("uniforms").doc(id);

    const proms = [db.update({
      images: imgs,
      "filter-gender": gender,
      "filter-school": school,
      "filter-season": season,
      "filter-clothType": fct,
      "totalImages": imgs.length,
      uniforms: clothes.toJS().map((cloth) => ({ ...cloth, school, gender, season })),
    })];

    if (uniformInfo.status === "교복보유중") {
      proms.push(
        firebase.firestore().collection("daegu").doc("bukgu").update({
          [school.indexOf("고등") === -1
              ? `middleSchool.${school}.totalStock`
              : `highSchool.${school}.totalStock`]: firebase.firestore.FieldValue.increment(1),
          [uniformInfo["filter-school"].indexOf("고등") === -1
              ? `middleSchool.${uniformInfo["filter-school"]}.totalStock`
              : `highSchool.${uniformInfo["filter-school"]}.totalStock`]: firebase.firestore.FieldValue.increment(-1),
        }),
      );
    }

    await Promise.all(proms);
    alert("수정사항이 반영되었습니다");
  };

  const searchLogs = async () => {
    const db = firebase.firestore().collection("daegu").doc("bukgu").collection("logs");
    const querySnapshot = await db.where("name", "==", checkerGiverName).where("birth", "==", checkerGiverBirth).get();
    setLogs(querySnapshot.docs.map((doc) => ({ ...doc.data(), id: doc.id })));
  };

  const rejectShop = async (r) => {
    if (checkerGiverName === "" || checkerGiverBirth === "") {
      return alert("구매자 이름과 생년월일을 입력해주세요");
    } else {
      if (window.confirm("정말로 거절하시겠습니까?\n거절된 교복은 다시 유저들에게 공개됩니다")) {
        const db = firebase.firestore().collection("daegu").doc("bukgu");
        const uniformRef = db.collection("uniforms").doc(id);
        const userRef = db.collection('users').doc(uniformInfo.receiverUid);
        const userLogRef = userRef.collection("logsUniformShop").doc("list");
        const logsRef = db.collection("logs").doc(new Date().getTime().toString());

        await Promise.all([
            uniformRef.update({
              status: "교복보유중",
            }),
            db.update({
              totalBeforeShop: firebase.firestore.FieldValue.increment(-1),
              totalStock: firebase.firestore.FieldValue.increment(1),
              [school.indexOf("고등") === -1
                  ? `middleSchool.${school}.totalStock`
                  : `highSchool.${school}.totalStock`]: firebase.firestore.FieldValue.increment(1),
            }),
            userLogRef.update({
              [`${id}.showStatus`]: "거절", 
              [`${id}.why`]: r,
            }),
            userRef.update({
              "totalAlarms": firebase.firestore.FieldValue.increment(1),
              "totalAlarmsShop": firebase.firestore.FieldValue.increment(1),
            }),
            logsRef.set({
              uniformId: id,
              uid: uniformInfo.receiverUid,
              name: checkerGiverName,
              birth: checkerGiverBirth,
              school: school,
              cert: uniformInfo.receiverCert,
              season: season,
              gender: gender,
              uniforms: clothes.toJS().map((cloth) => ({ ...cloth})),
              confirm: "거절",
            }),
          ]);
        router.back();
      }
    }
  };
  const confirmShop = async () => {
    if (checkerGiverName === "" || checkerGiverBirth === "") {
      return alert("구매자 이름과 생년월일을 입력해주세요");
    } else {
      if (window.confirm("구매승인을 하시겠습니까?")) {
        const db = firebase.firestore().collection("daegu").doc("bukgu");
        const uniformRef = db.collection("uniforms").doc(id);
        const userRef = db.collection('users').doc(uniformInfo.receiverUid);
        const userLogRef = userRef.collection("logsUniformShop").doc("list");
        const logsRef = db.collection("logs").doc(new Date().getTime().toString());

        await Promise.all([
            uniformRef.update({
              status: "출고대기중",
            }),
            db.update({
              totalBeforeShop: firebase.firestore.FieldValue.increment(-1),
              totalBeforeDelivery: firebase.firestore.FieldValue.increment(1),
              [school.indexOf("고등") === -1
                  ? `middleSchool.${school}.totalStock`
                  : `highSchool.${school}.totalStock`]: firebase.firestore.FieldValue.increment(-1),
            }),
            userLogRef.update({
              [`${id}.showStatus`]: `승인 - ${uniformInfo.receiverDeliveryType === "배송 요청" ? "배송예정" : "방문수령필요"}`,
            }),
            userRef.update({
              "totalAlarms": firebase.firestore.FieldValue.increment(1),
              "totalAlarmsShop": firebase.firestore.FieldValue.increment(1),
            }),
            logsRef.set({
              uniformId: id,
              uid: uniformInfo.receiverUid,
              name: checkerGiverName,
              birth: checkerGiverBirth,
              school: school,
              cert: uniformInfo.receiverCert,
              season: season,
              gender: gender,
              uniforms: clothes.toJS().map((cloth) => ({ ...cloth})),
              confirm: "승인",
            }),
          ]);
        router.back();
      }
    }
  };
  const confirmDelivery = async () => {
    if (window.confirm("교복전달을 완료하셨나요?")) {
      const db = firebase.firestore().collection("daegu").doc("bukgu");
      const uniformRef = db.collection("uniforms").doc(id);
      const userRef = db.collection('users').doc(uniformInfo.receiverUid);
      const userLogRef = userRef.collection("logsUniformShop").doc("list");

      await Promise.all([
          uniformRef.update({
            status: "최종완료",
            dateDelivery: new Date().getTime(),
          }),
          db.update({
            totalBeforeDelivery: firebase.firestore.FieldValue.increment(-1),
            totalShopped: firebase.firestore.FieldValue.increment(1),
          }),
          userLogRef.update({
            [`${id}.showStatus`]: '구매완료',
          }),
          userRef.update({
            "totalAlarms": firebase.firestore.FieldValue.increment(1),
            "totalAlarmsShop": firebase.firestore.FieldValue.increment(1),
          }),
        ]);
      router.back();
    }
  };

  if (loading) return <LoadingPage />;


  const d1 = new Date(uniformInfo.dateStock);
  const ds1 = `${d1.getFullYear()}. ${d1.getMonth() + 1 >= 10 ? d1.getMonth() + 1 : `0${d1.getMonth() + 1 }`}. ${d1.getDate() >= 10 ? d1.getDate() : `0${d1.getDate()}`}`;
  return (
    <div>
      {rejectModalOpen ? <RejectModal closeModal={() => setRejectModalOpen(false)} handleReject={rejectShop}/> : null}
      <Head>
        <title>대구 북구 교복 나누미 | 기부관리</title>
      </Head>
      <Nav />
      <div className={styles["uniform-wrapper"]}>
        <div className={styles["uniform-content-wrapper"]}>
          <div className={styles["uniform-heading-wrapper"]}>
            <div className={styles["uniform-heading"]}>{uniformInfo.code}</div>
            <button className={styles["uniform-delete"]} onClick={handleUniformDelete}>삭제</button>
          </div>
          <div className={styles["uniform-label"]}>상세정보</div>
          <div className={styles["uniform-giver-table-wrapper"]}>
            <div className={styles["uniform-giver-table"]}>
              <div className={styles["row"]}>
                <div className={styles["col1"]}>기부자</div>
                <div className={styles["col2"]}>{uniformInfo.giverName}</div>
              </div>
              <div className={styles["row"]}>
                <div className={styles["col1"]}>연락처</div>
                <div className={styles["col2"]}>{`${uniformInfo.giverPhone.substring(0, 3)}-${uniformInfo.giverPhone.substring(3, 7)}-${uniformInfo.giverPhone.substring(7, 11)}`}</div>
              </div>
              <div className={styles["row"]}>
                <div className={styles["col1"]}>수거 방법</div>
                <div className={styles["col2"]}>{uniformInfo.giverDeliveryType}</div>
              </div>
              <div className={styles["row"]}>
                <div className={styles["col1"]}>{uniformInfo.giverDeliveryType === "복지센터 방문" ? "방문 복지센터" : "주소"}</div>
                <div className={styles["col2"]}>{uniformInfo.giverAddress || "-"}</div>
              </div>
              <div className={styles["row"]}>
                <div className={styles["col1"]}>기부 신청일</div>
                <div className={styles["col2"]}>{`20${uniformInfo.code.substring(0, 2)}. ${uniformInfo.code.substring(2, 4)}. ${uniformInfo.code.substring(4, 6)}`}</div>
              </div>
              {
                uniformInfo.status !== "기부승인요청"
                  ? (
                    <div className={styles["row"]}>
                      <div className={styles["col1"]}>입고일</div>
                      <div className={styles["col2"]}>{ds1}</div>
                    </div>
                  )
                  : null
              }
              {
                uniformInfo.status === "기부승인요청" || uniformInfo.status === "교복보유중"
                  ? (
                    <div className={styles["row"]}>
                      <div className={styles["col1"]}>현재 상태</div>
                      <div className={styles["col2-status"]}>{uniformInfo.status}</div>
                    </div>
                  )
                  : null
              }
            </div>
            {
              uniformInfo.status === "기부승인요청" || uniformInfo.status === "교복보유중"
                ? null
                : (
                  <div className={styles.margin24}>
                    <div className={styles["uniform-giver-table"]}>
                      <div className={styles["row"]}>
                        <div className={styles["col1"]}>구매(희망)자</div>
                        <div className={styles["col2"]}>{uniformInfo.receiverName}</div>
                      </div>
                      <div className={styles["row"]}>
                        <div className={styles["col1"]}>연락처</div>
                        <div className={styles["col2"]}>{`${uniformInfo.receiverPhone.substring(0, 3)}-${uniformInfo.receiverPhone.substring(3, 7)}-${uniformInfo.receiverPhone.substring(7, 11)}`}</div>
                      </div>
                      <div className={styles["row"]}>
                        <div className={styles["col1"]}>주소</div>
                        <div className={styles["col2"]}>{uniformInfo.receiverAddress || "-"}</div>
                      </div>
                      <div className={styles["row"]}>
                        <div className={styles["col1"]}>수거 방법</div>
                        <div className={styles["col2"]}>{uniformInfo.receiverDeliveryType}</div>
                      </div>
                      <div className={styles["row"]}>
                        <div className={styles["col1"]}>구매 신청일</div>
                        <div className={styles["col2"]}>{uniformInfo.dateShop}</div>
                      </div>
                      <div className={styles["row"]}>
                        <div className={styles["col1"]}>현재 상태</div>
                        <div className={styles["col2-status"]}>{uniformInfo.status}</div>
                      </div>
                    </div>
                  </div>
                )
            }
          </div>
          <input type="file" id="imgs" accept="image/gif, image/jpeg, image/png" multiple onChange={addImages}/>
          <div className={styles["uniform-label"]}>교복사진</div>
          <label className={styles.add} htmlFor="imgs" >
            <img src="/icon/add.png"/>
            사진 추가
          </label>
          <div className={styles["uniform-photos-wrapper"]}>
            {
              images.map((image, i) => {
                return (
                  <div key={String(i)} className={i % 4 === 3 ? styles["thumbnail-wrapper"] : styles["thumbnail-wrapper-margin"]}>
                    <button className={styles["thumbnails-bg"]} onClick={removeImg(i)}>사진 삭제</button>
                    <div className={styles["thumbnails"]} style={{ backgroundImage: `url(${image.url})` }}/>
                  </div>
                );
              })
            }
          </div>
          <div className={styles["uniform-label"]}>품목</div>
          <button onClick={addCloth}>
            <label className={styles.add}>
              <img src="/icon/add.png"/>
              품목 추가
            </label>
          </button>
          <div className={styles["uniform-clothes-wrapper"]}>
            {
              clothes.map((cloth, i) => (
                <div className={styles["uniform-clothes-row"]} key={String(i)}>
                  <div>
                    <div className={styles.dropdowns}>
                      <Dropdown type="school" value={school} update={i === 0} handleValueChange={setSchool} />
                      <Dropdown type="gender" value={gender} update={i === 0} handleValueChange={setGender} />
                      <Dropdown type="season" value={season} update={i === 0} handleValueChange={handleSeason} />
                      <Dropdown type="cloth" parentType={season} value={cloth.get("clothType")} handleValueChange={handleClothChange} index={i}/>
                    </div>
                    <input className={styles["size-input"]} value={cloth.get("size")} onChange={({ target: { value } }) => handleSizeChange(i, value)}/>
                  </div>
                  <button className={styles.delete} onClick={removeCloth(i)}>
                    <img src="/icon/close.png"/>
                  </button>
                </div>
              ))
            }
          </div>
          {
            uniformInfo.status !== "기부승인요청" && uniformInfo.status !== "교복보유중"
              ? (
                <>
                  <div className={styles["uniform-label"]}>학생증</div>
                  {
                    uniformInfo.receiverCert.length === 0
                    ? (
                      <div className={styles["uniform-cert-none"]}>올해 입학하는 학생입니다</div>
                    )
                    : (
                      <div className={styles["uniform-cert-wrapper"]}>
                        <div style={{ backgroundImage: `url(${uniformInfo.receiverCert[0]})` }}/>
                        <div style={{ backgroundImage: `url(${uniformInfo.receiverCert[1]})` }}/>
                      </div>
                    )
                  }
                </>
              )
              : null
          }
          {
            uniformInfo.status === "구매승인요청"
              ? (
                <div className={styles["uniform-logs-wrapper"]}>
                  <div className={styles["uniform-label2"]}>기록조회</div>
                  <div className={styles["uniform-inner-label"]}>구매자 이름</div>
                  <input className={styles["uniform-inner-input"]} value={checkerGiverName} onChange={({ target: { value } }) => setCheckerGiverName(value)}/>
                  <div className={styles["uniform-inner-label"]}>생년월일</div>
                  <input className={styles["uniform-inner-input"]} placeholder="예: 20040101" value={checkerGiverBirth} onChange={({ target: { value } }) => setCheckerGiverBirth(onlyNum(value))} maxLength="8"/>
                  <button className={styles["uniform-inner-btn"]} onClick={searchLogs}>조회</button>
                  {
                    logs === null || logs === undefined
                      ? null
                      : (
                        <div className={styles["uniform-inner-table"]}>
                          <div className={styles["heading-wrapper"]}>
                            <div className={styles.col1}>신청날짜</div>
                            <div className={styles.col2}>학교</div>
                            <div className={styles.col3}>신청품목</div>
                            <div className={styles.col4}>승인여부</div>
                          </div>
                          {
                            logs.map((log, i) => {
                              console.log(log);
                              const d = new Date(Number(log.id));
                              const ds = `${d.getFullYear()}. ${d.getMonth() + 1 >= 10 ? d.getMonth() + 1 : `0${d.getMonth() + 1}`}. ${d.getDate() >= 10 ? d.getDate() : `0${d.getDate()}`}`;
                              let item = `${log.gender} / ${log.season} / `;
                              log.uniforms.forEach(({ clothType }) => {
                                item += `${clothType},`;
                              });
                              return (
                                <div className={styles.row} key={String(i)}>
                                  <div className={styles.col1}>{ds}</div>
                                  <div className={styles.col2}>{log.school}</div>
                                  <div className={styles.col3}>{item}</div>
                                  <div className={styles.col4}>{log.confirm}</div>
                                </div>
                              );
                            })
                          }
                        </div>
                      )
                  }
                  
                </div>
              )
              : null
          }
          <div className={styles["uniform-btn-wrapper"]}>
            {uniformInfo.status === "교복보유중" ? <button className={styles.update} onClick={handleUpdate}>변경사항 저장</button> : null}
            {uniformInfo.status === "구매승인요청" ? <button className={styles.reject} onClick={() => setRejectModalOpen(true)}>거절</button> : null}
            {uniformInfo.status === "기부승인요청" ? <button className={styles.confirm} onClick={handleStockConfirm}>교복등록</button> : null}
            {uniformInfo.status === "구매승인요청" ? <button className={styles.confirm} onClick={confirmShop}>구매승인</button> : null}
            {uniformInfo.status === "출고대기중" ? <button className={styles.confirm} onClick={confirmDelivery}>교복전달완료</button> : null}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Uniform;
