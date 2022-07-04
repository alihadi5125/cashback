import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cashback/controller/login_controller.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/model/login_model.dart';
import 'package:cashback/view/bottom_navigation_screen.dart';
import 'package:cashback/view/custom_widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  /// login
  Future<void> userLogin(
      {required BuildContext context,
      required String? email,
      required String? password}) async {

    emit(LoginLoading());
    if (email!.isEmpty || password!.isEmpty) {
      Snackbar.showSnack(
          context: context, message: 'Please enter email & password.');
    } else {
      print(email);
      print(password);
      var request = http.MultipartRequest('POST', Uri.parse('https://mobileapi.apopou.gr/api/login'));
      request.fields.addAll({
        'username': email,
        'password': password
      });


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String str=await response.stream.bytesToString();
        print(str);
        try{
          LoginController.data=LoginModel.fromJson(str);
          SharePrefs.prefs!.setString("token", LoginController.data.accessToken);
          emit(LoginSuccess());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BottomNavigationScreen()));
        }
        catch(e){
         emit(LoginError());
          Snackbar.showSnack(
              context: context, message: 'Incorrect Email or Password');
        }
      }
      else {
        emit(LoginError());
        Snackbar.showSnack(
            context: context, message: 'Incorrect Email or Password');
        print(response.reasonPhrase);
      }
    }
  }
}
