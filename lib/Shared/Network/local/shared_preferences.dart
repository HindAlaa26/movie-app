import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper
{
  static SharedPreferences? prefs;
  static init()async
  {
    prefs = await SharedPreferences.getInstance();
  }

 static List<String>? emailAndPasswordList;
  // get Data (email and password) from register screen in login screen
  static Future<List<String>> getEmailAndPassword()async
  {
   return  emailAndPasswordList = await prefs?.getStringList('emailAndPasswordList') ?? [];
    print(emailAndPasswordList);
  }
  // set login Screen in login
  static Future<bool?> setLoginState(bool isRegister)async
  {
    return await prefs?.setBool("isRegister",isRegister)??false ;
  }

  //get Register State
 static Future<bool> getRegisterState()async
{
  return await prefs?.getBool("isRegister")??false;
}
//clear My Account
 static  Future<bool?> clearAccount()async
{
  return await prefs?.clear();
}
  // login Data in register screen
  static Future<dynamic> loginData(
      {required bool isRegister,
        required String email,
        required String password,
        required String nameController,
        required String phoneController,}
      )async
  {

    // Get the existing list of email and password pairs from shared preferences
    List<String> emailAndPasswordList = prefs?.getStringList('emailAndPasswordList') ?? [];

    // Add the new email and password pair to the list
    emailAndPasswordList.add('$email:$password');

    // Save the updated list back to shared preferences
    await prefs?.setStringList('emailAndPasswordList', emailAndPasswordList);
    await prefs?.setString("name", nameController);
    await prefs?.setString("phone", phoneController);
    await prefs?.setBool("isRegister", isRegister);
    print(emailAndPasswordList);
  }
}