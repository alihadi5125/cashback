import 'package:bloc/bloc.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  Future<void> logout({required BuildContext context, required bool guest}) async {
    if(!guest){
      var headers = {
        'Authorization': 'Bearer ${SharePrefs.prefs!.getString("token")}'
      };

      showLoaderDialog(context);
      var request = http.Request('POST', Uri.parse('https://mobileapi.apopou.gr/api/logout'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }


  }
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:const Text("Logging Out... Please Wait" )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}
