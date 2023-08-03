class Api {
  static const key = 'AIzaSyCrbXVcED8wPQfMsOXQu-uIrFOUek4Ftgc';
  static const baseUrl = 'http://3.110.170.212:8000';
  static const register = '$baseUrl/user/register';
  static const otpEmail = '$register/user/register/validate';
  static const signIn = '$baseUrl/user/login';
  static const forgetPassword = '$baseUrl/user/forget/password';
  static const createNewPassword =
      '$forgetPassword/user/forget/password/validate';
  static const getProfile = '$baseUrl/user/profile/view';
  static const editProfile = '$baseUrl/user/profile/edit';
  static const getCategories = '$baseUrl/category/view';
  static const getProduct = '$baseUrl/product/view';
  static const getAProduct = '$baseUrl/product/view/id?id=';
}
