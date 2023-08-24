class Api {
  static const baseUrl = "https://give-and-gobble.onrender.com";
  static const signupstepone = '$baseUrl/register/stepone';
  static const signupsteptwo = '$baseUrl/register/steptwo/';
  static const loginApi = '$baseUrl/login';

  static const ressignUpstepone = '$baseUrl/restaurant/register/stepone';
  static const ressignUpsteptwo = '$baseUrl/restaurant/register/steptwo/';
  static const restaurantlogin = '$baseUrl/restaurant/login';

  static const ngosignUpstepone = '$baseUrl/ngo/register/stepone';
  static const ngosignUpsteptwo = '$baseUrl/ngo/register/steptwo/';
  static const ngologin = '$baseUrl/ngo/login';

  static const endpointurl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=782bfdf464b34b82b0d6b454aadcab26";

  static const userFoodreq = '$baseUrl/post/food/request';
  static const getpending = '$baseUrl/ngo/get/pending/requests';
  static const accept = '$baseUrl/ngo/accept/request/';
  static const getaccept = '$baseUrl/ngo/get/accepted/requests';
  static const copletereq = '$baseUrl/ngo/complete/request/';
  static const getcomplete = '$baseUrl/ngo/get/completed/requests';

  static const getselected = '$baseUrl/ngo/get/selected/request/';

// user
  static const forogt = '$baseUrl/forgot/password';
  static const enterotp = '$baseUrl/verify/password/request/';
  static const savepassword = '$baseUrl/reset/password';

// restaurant
  static const resforogt = '$baseUrl/restaurant/forgot/password';
  static const resenterotp = '$baseUrl/restaurant/verify/password/request/';
  static const ressavepassword = '$baseUrl/restaurant/reset/password';

  static const ngoforogt = '$baseUrl/ngo/forgot/password';
  static const ngoenterotp = '$baseUrl/ngo/verify/password/request/';
  static const ngosavepassword = '$baseUrl/ngo/reset/password';



  static const userdonation='$baseUrl/get/request/history/';
  static const restaurantdonation='$baseUrl/restaurant/get/request/history/';


  static  const ngoslist ='$baseUrl/ngo/get/all/accepted/ngos';


// Message
static const postmessage='$baseUrl/ngo/post/new/message';
static const getmessage='$baseUrl/ngo/get/all/messages';


}
