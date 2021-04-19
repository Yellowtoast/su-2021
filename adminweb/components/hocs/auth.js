import React, { useState, useEffect } from "react";

import firebase from 'firebase/app';
import 'firebase/auth';

import LoadingPage from "components/loading/page"; 
import EntrancePage from "components/entrance/page";

const AuthHoC = ({ children }) => {
  const [loading, setLoading] = useState(true);
  const [authentication, setAuthentication] = useState(false);

  useEffect(() => {
    firebase.auth().onAuthStateChanged((user) => {
      if (user !== null && user.email === "bukgu@daegu.go.kr") setAuthentication(true);
      setLoading(false);
    });
  }, []);

  if (loading) return <LoadingPage />
  if (!authentication) return <EntrancePage />

  return children;
};

export default AuthHoC;
