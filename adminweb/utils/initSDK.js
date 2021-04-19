import firebase from "firebase/app";

const initSDK = () => {
  if (!firebase.apps.length) {
    firebase.initializeApp({
      apiKey: "AIzaSyDstnaDHXcX6GpvcpQz9og0P_ZsETGUezI",
      authDomain: "su-2020.firebaseapp.com",
      projectId: "su-2020",
      storageBucket: "su-2020.appspot.com",
      messagingSenderId: "326012009410",
      appId: "1:326012009410:web:9bad8cd952d4c140fff45b",
      measurementId: "G-5JTFX0TN17"
    });
  }
};

export default initSDK;
