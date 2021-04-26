const SERVER_PATH = "http://192.168.254.44:3001";
const UPLOAD_PATH = `${SERVER_PATH}/api/uploads`;

const ADMIN_PATH = `${SERVER_PATH}/api/admin`;
const ADMIN_SIGN_IN = `${ADMIN_PATH}/signin`;
const ADMIN_VERIFY = `${ADMIN_PATH}/verifyToken`;

const INFO_PATH = `${SERVER_PATH}/api/info`;
const INFO_GET = `${INFO_PATH}/getData`;
const INFO_UPDATE = `${INFO_PATH}/update`;

const USER_PATH = `${SERVER_PATH}/api/user`;
const USER_GET = `${USER_PATH}/getData`;
const USER_UPDATE = `${USER_PATH}/update`;

const USER_LOGS_UNIFORM_DONATE = `${SERVER_PATH}/api/user/logs/uniform/donate`;
const USER_LOGS_UNIFORM_DONATE_UPDATE = `${USER_LOGS_UNIFORM_DONATE}/update`;

const UNIFORM_PATH = `${SERVER_PATH}/api/uniform`;
const UNIFORM_LIST = `${UNIFORM_PATH}/list`;
const UNIFORM_GET = `${UNIFORM_PATH}/getData`;
const UNIFORM_DELETE = `${UNIFORM_PATH}/delete`;
const UNIFORM_UPDATE = `${UNIFORM_PATH}/update`;
const UNIFORM_CONFIRM_DONATE = `${UNIFORM_PATH}/confirm/donate`;

export default {
  SERVER_PATH,
  UPLOAD_PATH,
  USER_PATH,
  ADMIN_PATH,
  USER_GET,
  ADMIN_SIGN_IN,
  ADMIN_VERIFY,
  UNIFORM_LIST,
  INFO_GET,
  INFO_UPDATE,
  UNIFORM_GET,
  UNIFORM_DELETE,
  UNIFORM_UPDATE,
  UNIFORM_CONFIRM_DONATE,
  USER_LOGS_UNIFORM_DONATE_UPDATE,
  USER_UPDATE,
};
