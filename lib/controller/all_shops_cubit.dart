import 'package:bloc/bloc.dart';
import 'package:cashback/model/all_shops_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'all_products_controller.dart';
part 'all_shops_state.dart';

class AllShopsCubit extends Cubit<AllShopsState> {
  AllShopsCubit() : super(AllShopsInitial());
  Future<void> allShops() async{
    var request = http.Request('GET',
        Uri.parse('https://mobileapi.apopou.gr/api/retailers'));
    emit(AllShopsLoading());
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String str=await response.stream.bytesToString();
      AllProductsController.data=AllStores.fromRawJson(str);
      emit(AllShopsLoaded());
    }
    else {
      emit(AllShopsError());
    print(response.reasonPhrase);
    }

  }
}
