import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:spotify/Mainpage/login.dart';
import 'package:spotify/views/home/home_screen.dart';

import '../constants/res/app_constant.dart';

class AuthHelper extends ChangeNotifier {
  Client client = Client();
  late Account account;
  AuthHelper() {
    _init();
  }
  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    account = Account(client);
    _checkIsLoggedIn();
  }

  _checkIsLoggedIn() async {
    try {
      var res = await account.get();
    } catch (e) {
      print(e);
    }
  }

  login(String email, String password) async {
    try {
      var result =
          await account.createEmailSession(email: email, password: password);
      if (result.userId.isNotEmpty) {
        Get.snackbar('success', 'Login succesful');
        Get.to(HomeScreen());
      }else{
          Get.snackbar('fail', 'check your details');
      }
    } catch (e) {
       Get.snackbar('fail', e.toString());
    }
  }

  creatAccount(String name, String email, String password) async {
    try {
      var result =
          await account.create(userId: name, email: email, password: password);
           Get.snackbar('success', 'account created succesful');
        Get.to(LoginPage());
    
    } catch (e) {
    Get.snackbar('failed',e.toString());
    }
  }
}
