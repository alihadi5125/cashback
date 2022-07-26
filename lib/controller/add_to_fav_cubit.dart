import 'package:bloc/bloc.dart';
import 'package:cashback/controller/all_favourite_controller.dart';
import 'package:cashback/controller/all_featured_controller.dart';
import 'package:cashback/controller/all_products_controller.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/model/add_to_fav_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;



part 'add_to_fav_state.dart';

class AddToFavCubit extends Cubit<AddToFavState> {

  AddToFavCubit() : super(AddToFavInitial());

  Future<void> addToFav({required int id, required BuildContext context, required int index,
  required String type
  }) async{




    var headers = {
      'Authorization': 'Bearer ${SharePrefs.prefs!.getString("token")}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://mobileapi.apopou.gr/api/user/add/retailer-favorites'));
    request.fields.addAll({
      'retailer_id': id.toString()
    });

    request.headers.addAll(headers);
      dialogSucess(context);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      Navigator.pop(context);
      AddToFav data=AddToFav.fromJson(await response.stream.bytesToString());
      if(data.success){
        if(type=="all"){
          AllProductsController.listData[index].favoriters=1;
        }
        if(type=="feature"){
          AllFeatureController.listData[index].favoriters=1;
        }
        if(type=="fav"){

        }

      }

    }
    else {

    print(response.reasonPhrase);
    }

  }
  dialogSucess(BuildContext context)  {
    showDialog(
        context: context,
        builder: (_) => new Dialog(
          insetPadding: EdgeInsets.all(50),
          backgroundColor: Colors.white,
          child: new Container(
              alignment: FractionalOffset.center,
              height: 80.0,
              width: 10,
              padding: const EdgeInsets.all(20.0),
              child: Center(child: CircularProgressIndicator(
                color: Colors.red,
              ))
          ),
        ));

  }

  errorDialog(BuildContext context){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,

      desc: 'Already Added to Favourites'.tr(),
        btnOkColor: Colors.red,
      btnOkOnPress: () {

      },
    )..show();
  }
}
