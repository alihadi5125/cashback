
import 'package:cashback/controller/add_to_fav_cubit.dart';
import 'package:cashback/controller/all_products_controller.dart';
import 'package:cashback/controller/all_shops_cubit.dart';
import 'package:cashback/controller/remove_fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AllShopsHeart extends StatefulWidget {
  bool guest;
  int index;

  AllShopsHeart({required this.guest, required this.index,});

  @override
  State<AllShopsHeart> createState() => _AllShopsHeartState();
}

class _AllShopsHeartState extends State<AllShopsHeart> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(widget.guest){

        }
        else{

          if(AllProductsController.listData[widget.index].favoriters==0){
            context.read<AddToFavCubit>().addToFav(id:AllProductsController.listData[widget.index].identifier,
            context: context,
            index: widget.index,
              type:'all'
            ).whenComplete(() {
           setState((){

           });
            });
          }
          else{

            context.read<RemoveFavCubit>().removeFav(
            id:AllProductsController.listData[widget.index].identifier,
            context:context,
            index:widget.index,type: "all"
            ).whenComplete(() {
              setState((){

              });
            });
            // AllProductsController.page=1;
            // AllProductsController.listData.clear();
            // context.read<AllShopsCubit>().allShops(reload:true);
          }

        }

      },
      child:  Icon(
        Icons.favorite,
        color: AllProductsController.listData[widget.index].favoriters==0?Colors.grey:Colors.red,
      ),
    );
  }
}
