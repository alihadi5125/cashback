import 'package:bloc/bloc.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/model/sign_up_model.dart';
import 'package:cashback/view/bottom_navigation_screen.dart';
import 'package:cashback/view/custom_widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signUp(String username, String email, String password,
      BuildContext context) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://mobileapi.apopou.gr/api/register'));
    request.fields
        .addAll({'fname': username, 'username': email, 'password': password});
    emit(SignupLoading());
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String str = await response.stream.bytesToString();

      emit(SignupSucess());
      try {
        SignUpController.data = Signup.fromJson(str);
        SharePrefs.prefs!.setString("token", SignUpController.data.accessToken);
        SharePrefs.prefs!.setString("uid", SignUpController.data.data.userId.toString());
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavigationScreen(guest: false,)));
      } catch (e) {
        Snackbar.showSnack(context: context, message: "User Already Exist".tr());
      }
    } else {
      print(response.reasonPhrase);
    }
  }
}

class SignUpController {
  static Signup data = Signup(
      tokenType: '',
      accessToken: '',
      data: Data(
          userId: 1,
          created: DateTime.now(),
          fname: '',
          ip: '',
          sha1: 343,
          username: ''));
}
