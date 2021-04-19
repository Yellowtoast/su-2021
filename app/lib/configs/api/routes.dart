class ApiConfig {
  ApiConfig._();

  static const BASE_URI = 'http://172.30.1.60:3000';
  static const SERVER_URI = '$BASE_URI/api';
  static const USER_REF = '$SERVER_URI/user';
  static const INFO_REF = '$SERVER_URI/info';
  static const ADMIN_REF = '$SERVER_URI/admin';
  static const UNIFORM_REF = '$SERVER_URI/uniform';
}
