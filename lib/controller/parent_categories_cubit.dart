import 'package:bloc/bloc.dart';
import 'package:cashback/controller/parent_categories_controller.dart';
import 'package:cashback/model/parent_categories.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'parent_categories_state.dart';

class ParentCategoriesCubit extends Cubit<ParentCategoriesState> {
  ParentCategoriesCubit() : super(ParentCategoriesInitial());

  Future<void> parentCategories() async{
    emit(ParentCategoriesLoading());
    var request = http.Request('GET', Uri.parse('https://mobileapi.apopou.gr/api/categories/parent'));


    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      String str=await response.stream.bytesToString();
      ParentCategoriesController.data=ParentCategories.fromRawJson(str);
      emit(ParentCategoriesLoaded());
    }
    else {
    print(response.reasonPhrase);
    emit(ParentCategoriesError());
    }
  }
}
