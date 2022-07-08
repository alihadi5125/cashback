import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:cashback/controller/product_types_page_index_cubit.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/model/add_to_fav_model.dart';
import 'package:cashback/model/remove_fav.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'remove_fav_state.dart';

class RemoveFavCubit extends Cubit<RemoveFavState> {
  RemoveFavCubit() : super(RemoveFavInitial());

  Future<void> removeFav({required int id, required BuildContext context}) async{

    var headers = {
      'Authorization': 'Bearer ${SharePrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('https://mobileapi.apopou.gr/api/user/remove/retailer-favorites/${id.toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {


      RemoveFavModel data=RemoveFavModel.fromRawJson(await response.stream.bytesToString());
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

      desc: 'Retailer has been removed from favorites'.tr(),

      btnOkOnPress: () {
        SharePrefs.controller!.jumpTo(0);


      },
    )..show();
  }

  errorDialog(BuildContext context){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,

      desc: 'Something went wrong'.tr(),
      btnOkColor: Colors.red,
      btnOkOnPress: () {

      },
    )..show();
  }
}
