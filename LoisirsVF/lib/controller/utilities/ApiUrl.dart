class ApiUrl{
static String ip="http://192.168.1.4/";
static String getFoot = ip+'Test/getHoraire.php';
static String submit = ip+'Test/submit.php';
static String validate = ip+'Test/validate.php';
static String getOne = ip+'Test/get.php';
static String getDispo = ip+'Test/getDispo.php';
static String getDispoTerrain = ip+'Test/getDispoTerrain.php';
static String getOneBlack =ip+'Test/getBlack.php';
static String login =ip+'Test/login.php';
static String check = ip+'Test/check.php';
static String addpassword = ip+'Test/AddPassword.php';
static String signInGoogle = 'http://192.168.0.163/Test/google/registerGoogle.php';
static String getLoisir = ip+'Test/getLoisir.php';
static String getAllLoisir = ip+'Test/getAllLoisir.php';
static String getRes= ip+'Test/getRes.php';
static String uploadImage = ip+'Test/uploadimage.php';
static String getPhotosTerrains = ip+'Test/getPhotosTerrains.php';



//Images Folder
static String imagesTerrain = ip+'Test/images/Terrains/';
static String imagesProfiles = ip+'Test/images/Profiles/';

//add reservation
static String addRes= ip+'Test/addReservation.php';
//removeres
static String removeRes= ip+'Test/removeRes.php';

static const CREATE_TABLE_ACTION = 'CREATE_TABLE';
static const GET_ALL_ACTION = 'GET_ALL';
static const ADD_USER_ACTION = 'ADD_USER';
static const ADD_RESERVATION_ACTION = 'ADD_RESERVATION';
static const UPDATE_USER_ACTION = 'UPDATE_USER';
static const DELETE_USER_ACTION = 'DELETE_USER';
static const UPDATE_RESET = 'UPDATE_REST';
static const ADD_COMMENT_ACTION = 'ADD_COMMENT';
}

