class ApiUrl{
  static String url="http://192.168.1.12/";

  static String submit = url+'Test/submit.php';
  static String validate = url+'Test/validate.php';
  static String getOne = url+'Test/get.php';
  static String login = url+'Test/login.php';
  static String check = url+'Test/check.php';
  static String addpassword = url+'Test/AddPassword.php';
  static String UserDB = url+'Test/UserDB.php';
  static String getAllRestaurant = url+'Test/api/restaurants/getRestau.php';
  static String signInGoogle = url+'Test/google/registerGoogle.php';
  static String get = url+'Test/comments.php';
  static String add = url+'Test/CommentDB.php';
  static String getLoisir = url+'Test/getLoisir.php';
  static String getAllLoisir = url+'Test/getAllLoisir.php';
  static String uploadImage = url+'Test/uploadimage.php';
  static String getPhotosTerrains = url+'Test/getPhotosTerrains.php';



  //Images Folder
  static String imagesTerrain = url+'Test/images/Terrains/';
  static String imagesProfiles = url+'Test/images/Profiles/';



  static const CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const GET_ALL_ACTION = 'GET_ALL';
  static const ADD_USER_ACTION = 'ADD_USER';
  static const ADD_RESERVATION_ACTION = 'ADD_RESERVATION';
  static const UPDATE_USER_ACTION = 'UPDATE_USER';
  static const DELETE_USER_ACTION = 'DELETE_USER';
  static const UPDATE_RESET = 'UPDATE_REST';
  static const ADD_COMMENT_ACTION = 'ADD_COMMENT';
}
