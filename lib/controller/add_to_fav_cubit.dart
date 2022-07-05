import 'package:bloc/bloc.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/model/add_to_fav_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;


part 'add_to_fav_state.dart';

class AddToFavCubit extends Cubit<AddToFavState> {
  AddToFavCubit() : super(AddToFavInitial());

  Future<void> addToFav({required int id, required BuildContext context}) async{

    var headers = {
      'Authorization': 'Bearer ${SharePrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('https://mobileapi.apopou.gr/api/user/add/retailer-favorites/${id.toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {


      AddToFav data=AddToFav.fromJson(await response.stream.bytesToString());
      if(data.success){
        dialogSucess(context);
      }

    }
    else {
      errorDialog(context);
    print(response.reasonPhrase);
    }

  }
  dialogSucess(BuildContext context){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,

      desc: 'Retailer Added to Favourites',

      btnOkOnPress: () {

      },
    )..show();
  }

  errorDialog(BuildContext context){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,

      desc: 'Already Added to Favourites',
        btnOkColor: Colors.red,
      btnOkOnPress: () {

      },
    )..show();
  }
}
