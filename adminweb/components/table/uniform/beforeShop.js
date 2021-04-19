import React, { useState, useEffect } from "react";
import Link from "next/link";

import firebase from "firebase/app";
import "firebase/firestore";

import styles from "styles/components/table.module.scss";

const Table = ({ list }) => {
  return (
    <div>
      <div className={styles["table-border"]}>
        <div className={styles["table-header-row"]}>
          <div className={styles["table-beforeShop-header1"]}>코드</div>
          <div className={styles["table-beforeShop-header2"]} />
          <div className={styles["table-beforeShop-header3"]}>학교</div>
          <div className={styles["table-beforeShop-header4"]}>품목</div>
          <div className={styles["table-beforeShop-header5"]}>구매자</div>
          <div className={styles["table-beforeShop-header6"]}>연락처</div>
          <div className={styles["table-beforeShop-header7"]}>주소</div>
          <div className={styles["table-beforeShop-header8"]}>수령방법</div>
          <div className={styles["table-beforeShop-header9"]}>신청날짜</div>
        </div>
        <div>
          {
            list.map((data, i) => (
              <Link href={`/uniform?id=${data.id}`} key={String(i)}>
                <a className={styles["table-section-row"]}>
                  <div className={styles["table-beforeShop-section1"]}>{data.id}</div>
                  <div className={styles["table-beforeShop-section2"]}>
                    <div style={{ backgroundImage: `url(${data.images[0]})` }}/>
                  </div>
                  <div className={styles["table-beforeShop-section3"]}>{data["filter-school"]}</div>
                  <div className={styles["table-beforeShop-section4"]}>{data["filter-clothType"].join(" / ")}</div>
                  <div className={styles["table-beforeShop-section5"]}>{data["receiverName"]}</div>
                  <div className={styles["table-beforeShop-section6"]}>{`${data["receiverPhone"].substring(0, 3)}-${data["receiverPhone"].substring(3, 7)}-${data["receiverPhone"].substring(7, 11)}`}</div>
                  <div className={styles["table-beforeShop-section7"]}>{data["receiverAddress"] || "-"}</div>
                  <div className={styles["table-beforeShop-section8"]}>{data["receiverDeliveryType"] === "배송 요청" ? "배송 요청" : "직접 방문"}</div>
                  <div className={styles["table-beforeShop-section9"]}>{`20${data.id.substring(0, 2)}.${data.id.substring(2, 4)}.${data.id.substring(4, 6)}`}</div>
                </a>
              </Link>
            ))
          }
        </div>
      </div>
    </div>
  );
};

export default Table;