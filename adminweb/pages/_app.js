import initSDK from "utils/initSDK"; 
import AuthHoC from "components/hocs/auth";

import 'styles/globals.scss';

function MyApp({ Component, pageProps }) {
  initSDK();

  return (
    <AuthHoC>
      <Component {...pageProps} />
    </AuthHoC>
  )
}

export default MyApp
