import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class ProductTypesPageIndexCubit extends Cubit<int> {
  ProductTypesPageIndexCubit(super.initialState);

  setTabIndex({required index}){
    emit(index);
  }
}
