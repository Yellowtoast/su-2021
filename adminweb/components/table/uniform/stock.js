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
          <div className={styles["table-stock-header1"]}>코드</div>
          <div className={styles["table-stock-header2"]} />
          <div className={styles["table-stock-header3"]}>학교</div>
          <div className={styles["table-stock-header4"]}>품목</div>
          <div className={styles["table-stock-header5"]}>기부자</div>
          <div className={styles["table-stock-header6"]}>입고일</div>
        </div>
        <div>
        {
            list.map((data, i) => {
              const d = new Date(data["dateStock"]);
              const ds = `${d.getFullYear()}. ${d.getMonth() + 1 >= 10 ? d.getMonth() + 1 : `0${d.getMonth() + 1}`}. ${d.getDate() >= 10 ? d.getDate() : `0${d.getDate()}`}`;
              return (
                <Link href={`/uniform?id=${data.id}`} key={String(i)}>
                  <a className={styles["table-section-row"]}>
                    <div className={styles["table-stock-section1"]}>{data.id}</div>
                    <div className={styles["table-stock-section2"]}>
                      <div style={{ backgroundImage: `url(${data.images[0]})` }}/>
                    </div>
                    <div className={styles["table-stock-section3"]}>{data["filter-school"]}</div>
                    <div className={styles["table-stock-section4"]}>{data["filter-clothType"].join(" / ")}</div>
                    <div className={styles["table-stock-section5"]}>{data["giverName"]}</div>
                    <div className={styles["table-stock-section6"]}>{ds}</div>
                  </a>
                </Link>
              );
            })
          }
        </div>
      </div>
    </div>
  );
};

export default Table;