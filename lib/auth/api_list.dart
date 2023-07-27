class Api {
  static const key = 'AIzaSyCrbXVcED8wPQfMsOXQu-uIrFOUek4Ftgc';
  static const baseUrl = 'http://3.110.170.212:8000/user';
  static const register = '$baseUrl/register';
  static const otpEmail = '$register/validate';
  static const signIn = '$baseUrl/login';
  static const forgetPassword = '$baseUrl/forget/password';
  static const createNewPassword = '$forgetPassword/validate/newpassword';
  static const getProfile = '$baseUrl/profile/view';
  static const editProfile = '$baseUrl/profile/edit';
}
