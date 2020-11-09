class ApiUrl{
  static String ip="http://192.168.0.163/";
  static String getFoot = ip+'Test/getFoot.php';
  static String submit = 'http://192.168.0.163/Test/submit.php';
  static String validate = 'http://192.168.0.163/Test/validate.php';
  static String getOne = 'http://192.168.0.163/Test/get.php';
  static String getOneBlack = 'http://192.168.0.163/Test/getBlack.php';
  static String login = 'http://192.168.0.163/Test/login.php';
  static String check = 'http://192.168.0.163/Test/check.php';
  static String addpassword = 'http://192.168.0.163/Test/AddPassword.php';
  static String UserDB = 'http://192.168.0.163/Test/UserDB.php';
  static String getAllRestaurant = 'http://192.168.0.163/Test/api/restaurants/getRestau.php';
  static String signInGoogle = 'http://192.168.0.163/Test/google/registerGoogle.php';
  static String get = "http://192.168.0.163/Test/comments.php";
  static String add = "http://192.168.0.163/Test/CommentDB.php";
  static String getLoisir = ip+'Test/getLoisir.php';
  static String getAllLoisir = ip+'Test/getAllLoisir.php';
  static const CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const GET_ALL_ACTION = 'GET_ALL';
  static const ADD_USER_ACTION = 'ADD_USER';
  static const ADD_RESERVATION_ACTION = 'ADD_RESERVATION';
  static const UPDATE_USER_ACTION = 'UPDATE_USER';
  static const DELETE_USER_ACTION = 'DELETE_USER';
  static const UPDATE_RESET = 'UPDATE_REST';
  static const ADD_COMMENT_ACTION = 'ADD_COMMENT';
}