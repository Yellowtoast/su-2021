class UserApiRoutes {
  static const BASE_PATH = '/api/user';
  static const SIGN_IN = '$BASE_PATH/signin';
  static const GET = '$BASE_PATH/getData';
  static const UPDATE = '$BASE_PATH/update';
}

class UserLogsApiRoutes {
  static const BASE_PATH = '/api/user/logs';

  static const PURCHASE_BASE = '$BASE_PATH/uniform/purchase';
  static const PURCHASE_LIST = '$PURCHASE_BASE/list';
  static const PURCHASE_CREATE = '$PURCHASE_BASE/create';

  static const CART_BASE = '$BASE_PATH/uniform/cart';
  static const CART_ADD = '$CART_BASE/add';
  static const CART_REMOVE = '$CART_BASE/remove';
  static const CART_LIST = '$CART_BASE/list';

  static const DONATE_BASE = '$BASE_PATH/uniform/donate';
  static const DONATE_CREATE = '$DONATE_BASE/create';
  static const DONATE_LIST = '$DONATE_BASE/list';
  static const DONATE_UPDATE = '$DONATE_BASE/update';
}
