import 'package:bloc/bloc.dart';
import 'package:cashback/controller/all_featured_controller.dart';
import 'package:cashback/model/all_featured_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'all_feature_shops_state.dart';

class AllFeatureShopsCubit extends Cubit<AllFeatureShopsState> {
  AllFeatureShopsCubit() : super(AllFeatureShopsInitial());
  Future<bool> allFeatureShops() async{

    if(AllFeatureController.page<=AllFeatureController.data.meta.pagination.totalPages){
      var request = http.Request('GET',
          Uri.parse('https://mobileapi.apopou.gr/api/retailers/featured'));
      emit(AllFeatureShopsLoading());
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String str=await response.stream.bytesToString();
        AllFeatureController.data=AllFeatured.fromRawJson(str);
        AllFeatureController.listData.addAll(AllFeatureController.data.data);
        AllFeatureController.page=AllFeatureController.page+1;
        emit(AllFeatureShopsLoaded());
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
