import 'package:bloc/bloc.dart';
import 'package:cashback/controller/categories_controller.dart';
import 'package:cashback/model/categories_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> categories() async {
    var request = http.Request('GET', Uri.parse('https://mobileapi.apopou.gr/api/categories/featured'));

    emit(CategoriesLoading());
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String str=await response.stream.bytesToString();
      CategoriesController.data=CategoriesModel.fromJson(str);
      emit(CategoriesLoaded());
    }
    else {
      emit(CategoriesError());
    print(response.reasonPhrase);
    }

  }
}
