import 'package:bloc/bloc.dart';
import 'package:cashback/model/all_shops_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'all_products_controller.dart';
part 'all_shops_state.dart';

class AllShopsCubit extends Cubit<AllShopsState> {
  AllShopsCubit() : super(AllShopsInitial());
  Future<bool> allShops() async{
    if(AllProductsController.page<=AllProductsController.data.meta.pagination.totalPages){
      print("page now is "+AllProductsController.page.toString());
      print("total Pages are "+AllProductsController.data.meta.pagination.totalPages.toString());
      var request = http.Request('GET',
          Uri.parse('https://mobileapi.apopou.gr/api/retailers?page=${AllProductsController.page}'));

      emit(AllShopsLoading());
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String str=await response.stream.bytesToString();
        AllProductsController.data=AllStores.fromRawJson(str);
        AllProductsController.listData.addAll(AllProductsController.data.data);
        AllProductsController.page=AllProductsController.page+1;
        print("length of data is ");
        print(AllProductsController.listData.length);

        emit(AllShopsLoaded());
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
