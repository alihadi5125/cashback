import 'package:bloc/bloc.dart';
import 'package:cashback/controller/all_featured_controller.dart';
import 'package:cashback/model/all_featured_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'all_feature_shops_state.dart';

class AllFeatureShopsCubit extends Cubit<AllFeatureShopsState> {
  AllFeatureShopsCubit() : super(AllFeatureShopsInitial());
  Future<void> allFeatureShops() async{
    var request = http.Request('GET', Uri.parse('https://mobileapi.apopou.gr/api/retailers'));
    emit(AllFeatureShopsLoading());
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String str=await response.stream.bytesToString();
      AllFeatureController.data=AllFeatured.fromRawJson(str);
      emit(AllFeatureShopsLoaded());
    }
    else {
      emit(AllFeatureShopsError());
      print(response.reasonPhrase);
    }

  }
}
