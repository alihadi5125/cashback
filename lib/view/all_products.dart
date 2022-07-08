import 'package:cashback/controller/AppConstants.dart';
import 'package:cashback/controller/add_to_fav_cubit.dart';
import 'package:cashback/controller/all_products_controller.dart';
import 'package:cashback/controller/all_shops_cubit.dart';
import 'package:cashback/controller/cashback_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class AllProducts extends StatefulWidget {
  bool guest;
  AllProducts({required this.guest});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
  @override
  void initState(){
    print("all Products");
    AllProductsController.page=1;
    AllProductsController.listData.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllShopsCubit, AllShopsState>(
  builder: (context, state) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      reverse: false,
      onRefresh: () async {
        refreshController.requestRefresh();
        final result =await context.read<AllShopsCubit>().allShops();
        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.loadNoData();
        }
      },
      onLoading: () async {
        refreshController.requestLoading();
        final result =await context.read<AllShopsCubit>().allShops();
        if (result) {
          refreshController.loadComplete();
        } else {
          refreshController.loadNoData();
        }
      },
      child: ListView.builder(
          itemCount:AllProductsController.listData.length,
          itemBuilder: (context, index){
            return Container(
              padding: EdgeInsets.all(10.sp),
              margin: EdgeInsets.only(bottom: 10.sp),
              width: 334.0,
              height: 111.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 80.0.sp,
                      height: 80.0.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),

                      ),
                      child: Image.network(AllProductsController.listData[index].storeImgUrl.toString()),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.only(left: 20.sp),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        AllProductsController.listData[index].storeName,
                                        style: GoogleFonts.roboto(
                                          fontSize: 16.0.sp,
                                          color: const Color(0xFF363636),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        AllProductsController.listData[index].storeCashback.toString(),
                                        style: GoogleFonts.roboto(
                                          fontSize: 20.0.sp,
                                          color: const Color(0xFFFC4F08),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child:Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          AllProductsController.listData[index].categories.data.asMap().containsKey(0)?AllProductsController.listData[index].categories.data[0].categoryTitle:"N/A",
                                          style: GoogleFonts.roboto(
                                            fontSize: 14.0.sp,
                                            color: const Color(0xFF363636),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Cashback Up to ',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14.0.sp,
                                          color: const Color(0xFFA7A7A7),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Icon(
                                                  Cashback.coupon,
                                                  color: AppConstants.appDarkColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    AllProductsController.listData[index].couponsCount.toString(),
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 16.0.sp,
                                                      color: const Color(0xFF363636),
                                                      fontWeight: FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Coupons'.tr(),
                                              style: GoogleFonts.roboto(
                                                fontSize: 14.0.sp,
                                                color: const Color(0xFFA7A7A7),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Icon(
                                                  Cashback.bag,
                                                  color: AppConstants.appDarkColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    AllProductsController.listData[index].productsCount.toString(),
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 16.0.sp,
                                                      color: const Color(0xFF363636),
                                                      fontWeight: FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Products'.tr(),
                                              style: GoogleFonts.roboto(
                                                fontSize: 14.0.sp,
                                                color: const Color(0xFFA7A7A7),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                 Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: InkWell(
                                      onTap: (){
                                        if(widget.guest){

                                        }
                                        else{
                                          context.read<AddToFavCubit>().addToFav(id:  AllProductsController.listData[index].identifier, context: context);
                                        }

                                      },
                                      child: const Icon(
                                        Cashback.like,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  },
);
  }
}
