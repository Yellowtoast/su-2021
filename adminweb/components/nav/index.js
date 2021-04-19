import React from "react";
import Link from "next/link";
import { useRouter } from "next/router";

import styles from "components/nav/index.module.scss";

const Nav = () => {
  const router = useRouter();

  const isDonate = router.route === '/' || router.route.indexOf("uniform") !== -1;

  return (
    <div className={styles["nav-wrapper"]}>
      <div className={styles["nav-contents"]}>
        <div className={styles["nav-left-section"]}>
          <Link href="/">
            <a className={styles[isDonate ? "nav-menu-active" : "nav-menu"]}>교복 기부관리</a>
          </Link>
        </div>
        <div className={styles["nav-right-section"]}>
          <button className={styles["nav-signout-btn"]}>로그아웃</button>
        </div>
      </div>
    </div>
  );
};

export default Nav;
