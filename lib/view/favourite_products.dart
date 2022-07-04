
import 'package:cashback/controller/AppConstants.dart';
import 'package:cashback/controller/all_favourite_controller.dart';
import 'package:cashback/controller/all_favourite_products_cubit.dart';
import 'package:cashback/controller/all_products_controller.dart';
import 'package:cashback/controller/all_shops_cubit.dart';
import 'package:cashback/controller/cashback_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class FavouriteProducts extends StatefulWidget {
  const FavouriteProducts({Key? key}) : super(key: key);

  @override
  State<FavouriteProducts> createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
  @override
  void initState(){
    print("all Products");
    AllFavouriteController.page=1;
    AllFavouriteController.listData.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFavouriteProductsCubit, AllFavouriteProductsState>(
  builder: (context, state) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      reverse: false,
      onRefresh: () async {
        refreshController.requestRefresh();
        final result =await context.read<AllFavouriteProductsCubit>().allFavouriteProducts();
        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.loadNoData();
        }
      },
      onLoading: () async {
        refreshController.requestLoading();
        final result =await context.read<AllFavouriteProductsCubit>().allFavouriteProducts();
        if (result) {
          refreshController.loadComplete();
        } else {
          refreshController.loadNoData();
        }
      },
      child: ListView.builder(
          itemCount: AllFavouriteController.listData.length,
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
                      child: Image.network(AllFavouriteController.listData[index].storeImgUrl.toString()),
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
                                        AllFavouriteController.listData[index].storeName,
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
                                        AllFavouriteController.listData[index].storeCashback.toString(),
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
                                          AllFavouriteController.listData[index].headTitle.substring(0,  10),
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
                                                    AllFavouriteController.listData[index].couponsCount.toString(),
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
                                              'Coupons',
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
                                                    AllFavouriteController.listData[index].productsCount.toString(),
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
                                              'Products',
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
                                const Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Icon(
                                      Cashback.like,
                                      color: Colors.black,
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
