import 'package:bloc/bloc.dart';
import 'package:cashback/controller/all_featured_controller.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/model/all_featured_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'all_feature_shops_state.dart';

class AllFeatureShopsCubit extends Cubit<AllFeatureShopsState> {
  AllFeatureShopsCubit() : super(AllFeatureShopsInitial());
  Future<bool> allFeatureShops({required bool reload}) async{

    if(AllFeatureController.page<=AllFeatureController.data.meta.pagination.totalPages){
      var headers = {
        'Authorization': 'Bearer ${SharePrefs.prefs!.getString("token")}'
      };
      var request = http.Request('GET',
          Uri.parse('https://mobileapi.apopou.gr/api/retailers?featuredStore=1&page=${AllFeatureController.page}'));
      request.headers.addAll(headers);
      emit(AllFeatureShopsLoading());
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String str=await response.stream.bytesToString();
        print(str);
        AllFeatureController.data=AllFeatured.fromRawJson(str);
        AllFeatureController.listData.addAll(AllFeatureController.data.data);
        print("lenfgth"+AllFeatureController.listData.length.toString());

        AllFeatureController.page=AllFeatureController.page+1;

        if(reload){
          emit(AllFeatureShopsReload());
          await Future.delayed(const Duration(milliseconds: 800));
          emit(AllFeatureShopsLoaded());
        }
        else{
          emit(AllFeatureShopsLoaded());
        }

        return true;
      }
      else {
        emit(AllFeatureShopsError());
        print(response.reasonPhrase);
        return false;
      }

    }
    else{
      return false;
    }


  }
}
