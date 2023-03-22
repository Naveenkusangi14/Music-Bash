import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:spotify/Mainpage/login.dart';

import '../constants/res/app_constant.dart';
class AuthHelper extends ChangeNotifier {
  Client client = Client();
late Account account;
AuthHelper(){
  _init();
}
_init(){
  client.setEndpoint(AppConstants.endpoint)
  .setProject(AppConstants.projectId);
  account = Account(client);
  _checkIsLoggedIn();
}
 _checkIsLoggedIn() async{
 try {
    var res = await account.get();
 } catch (e) {
   print(e); 
 }
 }

login(String email , String password) async{
   try {
    var result = await account.createEmailSession( email: email, password: password);
  
} catch (e) {
  print(e); 
}
}
creatAccount(String name,String email,String password) async{
  try {
    var result = await account.create(userId: name, email: email, password: password);
    print(result);
  } catch (e) {
    print(e); 
  }

}
 
}