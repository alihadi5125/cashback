import 'package:bloc/bloc.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/model/all_shops_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'all_products_controller.dart';
part 'all_shops_state.dart';

class AllShopsCubit extends Cubit<AllShopsState> {
  AllShopsCubit() : super(AllShopsInitial());
  Future<bool> allShops({required bool reload}) async{
    if(AllProductsController.page<=AllProductsController.data.meta.pagination.totalPages){
      print("page now is "+AllProductsController.page.toString());
      print("total Pages are "+AllProductsController.data.meta.pagination.totalPages.toString());
      var headers = {
        'Authorization': 'Bearer ${SharePrefs.prefs!.getString("token")}'
      };
      var request = http.Request('GET',
          Uri.parse("https://mobileapi.apopou.gr/api/retailers?include=categories&fields=identifier,storeName,storeImgURL,storeCashback,coupons_count,products_count,favoriters&page=${AllProductsController.page}"));
      request.headers.addAll(headers);
      emit(AllShopsLoading());
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String str=await response.stream.bytesToString();
        AllProductsController.data=AllStores.fromRawJson(str);
        print(AllProductsController.data.data.toString());
        AllProductsController.listData.addAll(AllProductsController.data.data);
        AllProductsController.page=AllProductsController.page+1;
        print("length of data is ");
        print(AllProductsController.listData.length);
          if(reload){
            emit(Reload());
            await Future.delayed(const Duration(milliseconds: 800));
            emit(AllShopsLoaded());

          }
          else{
            emit(AllShopsLoaded());
          }

        return true;
      }

      else {
        emit(AllShopsError());
        print(response.reasonPhrase);
        return false;

      }

    }
    else{
      return false;
    }
    }

}
