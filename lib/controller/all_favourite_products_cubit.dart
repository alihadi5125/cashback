import 'package:bloc/bloc.dart';
import 'package:cashback/controller/all_favourite_controller.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/model/favourite_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'all_favourite_products_state.dart';

class AllFavouriteProductsCubit extends Cubit<AllFavouriteProductsState> {
  AllFavouriteProductsCubit() : super(AllFavouriteProductsInitial());
  Future<bool> allFavouriteProducts() async{

    if(AllFavouriteController.page<=AllFavouriteController.data.meta.pagination.totalPages){
      var headers = {
        'Authorization': 'Bearer ${SharePrefs.prefs!.getString("token")}'
      };

      var request = http.Request('GET', Uri.parse('https://mobileapi.apopou.gr/api/user/${SharePrefs.prefs!.getString("uid")}/favorites?page=${AllFavouriteController.page.toString()}'));

      request.headers.addAll(headers);
      emit(AllFavouriteProductsLoading());
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String str=await response.stream.bytesToString();
        AllFavouriteController.data=FavouriteModel.fromRawJson(str);
        AllFavouriteController.listData.addAll(AllFavouriteController.data.data);
        AllFavouriteController.page=AllFavouriteController.page+1;
        emit(AllFavouriteProductsLoaded());
        return true;
      }
      else {
        emit(AllFavouriteProductsError());
        print(response.reasonPhrase);
        return false;
      }

    }
    else{
      return false;
    }


  }
}
