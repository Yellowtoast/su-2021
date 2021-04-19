import React, { useState } from "react";
import Head from "next/head";

import firebase from "firebase/app";
import "firebase/auth";

import ReactLoading from "react-loading";

import styles from "components/entrance/page.module.scss";

const EntrancePage = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async () => {
    if (email.length === 0 || password.length === 0) {
      alert("모든 항목을 채워주세요");
      return;
    }

    try {
      setLoading(true);
      const { user } = await firebase
        .auth()
        .signInWithEmailAndPassword(email, password);
    } catch (err) {
      console.log(err);
      switch (err.code) {
        case "auth/user-not-found":
          alert("존재하지 않는 계정입니다");
          break;
        case "auth/invalid-email":
          alert("유효하지 않은 이메일 형식입니다");
          break;
        case "auth/user-disabled":
          alert("존재하지 않는 계정입니다");
          break;
        case "auth/wrong-password":
          alert("잘못된 비밀번호 입니다");
          break;
        default:
          alert("잠시후에 다시 시도해주세요");
      }
      setLoading(false);
    }
  };

  const handleKeyDown = ({ keyCode }) => {
    if (keyCode === 13) handleSubmit();
  };
  

  return (
    <div className={styles["entrancePage-wrapper"]}>
      <Head>
        <title>대구 북구 교복 나누미 | 로그인</title>
      </Head>
      <img src="/img/bookie.png" className={styles["entrancePage-bookie"]}/>
      <div className={styles["entrancePage-title"]}>대구 북구 교복 나눔</div>
      <div className={styles["entrancePage-input-section"]}>
        <div className={styles["entrancePage-input-label"]}>이메일</div>
        <input className={styles["entrancePage-input"]} placeholder="이메일을 입력하세요" value={email} onChange={({ target: { value } }) => setEmail(value)}/>
        <div className={styles["entrancePage-input-label"]} >비밀번호</div>
        <input className={styles["entrancePage-input"]} placeholder="비밀번호를 입력하세요" type="password" onKeyDown={handleKeyDown} value={password} onChange={({ target: { value } }) => setPassword(value)}/>
        <button className={styles["entrancePage-sign-btn"]} onClick={handleSubmit}>로그인</button>
      </div>
    </div>
  );
};

export default EntrancePage;
