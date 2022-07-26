import 'package:cashback/controller/add_to_fav_cubit.dart';
import 'package:cashback/controller/all_feature_shops_cubit.dart';
import 'package:cashback/controller/all_featured_controller.dart';
import 'package:cashback/controller/remove_fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FeaturedHeart extends StatefulWidget {
  bool guest;
  int index;
  FeaturedHeart({required this.guest, required this.index});

  @override
  State<FeaturedHeart> createState() => _FeaturedHeartState();
}

class _FeaturedHeartState extends State<FeaturedHeart> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: (){
          if(!widget.guest){
            if(AllFeatureController.listData[widget.index].favoriters==0){
              context.read<AddToFavCubit>().addToFav(id:  AllFeatureController.listData[widget.index].identifier, context: context,
                  index: widget.index,
                type: "feature"
              ).whenComplete(() {
                setState((){

                });
                // AllFeatureController.page=1;
                // AllFeatureController.listData.clear();
                // context.read<AllFeatureShopsCubit>().allFeatureShops(reload:true);
              });
            }
            else{
              context.read<RemoveFavCubit>().removeFav(id:AllFeatureController.listData[widget.index].identifier, context: context,
                  index: widget.index,
                type: "feature"
              ).whenComplete(() {
                setState((){

                });
              });
              // AllFeatureController.page=1;
              // AllFeatureController.listData.clear();
              // context.read<AllFeatureShopsCubit>().allFeatureShops(reload:true);
            }
          }



        },
        child: Icon(
          Icons.favorite,
          color: AllFeatureController.listData[widget.index].favoriters==0?Colors.grey:Colors.red,
        ),
      ),
    );
  }
}
