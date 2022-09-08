import 'package:cashback/controller/AppConstants.dart';
import 'package:cashback/controller/all_products_controller.dart';
import 'package:cashback/controller/cashback_icons.dart';
import 'package:cashback/controller/categories_controller.dart';
import 'package:cashback/controller/categories_cubit.dart';
import 'package:cashback/controller/product_page_controller.dart';
import 'package:cashback/controller/product_types_page_index_cubit.dart';
import 'package:cashback/controller/retailers_search_cubit/retailers_search_cubit.dart';
import 'package:cashback/view/all_featured_products.dart';
import 'package:cashback/view/all_products.dart';
import 'package:cashback/view/all_shops_heart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchClickScreen extends StatefulWidget {
  bool guest;
  SearchClickScreen({required this.guest});

  @override
  State<SearchClickScreen> createState() => _SearchClickScreenState();
}

class _SearchClickScreenState extends State<SearchClickScreen> {
  FocusNode node=FocusNode();
  List<String> assetsArray = [
    "images/marketplace.png",
    "images/electronics.png",
    "images/home.png",
    "images/home.png",
  ];
  List<String> categories = [
    "Marketplaces",
    "Electronics",
    "Home Appliances",
    "Electronics",
  ];
  TextEditingController search =TextEditingController();
  @override
  void initState(){
    context.read<CategoriesCubit>().categories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: ListView(
          children: [
            SizedBox(
              height: 30.sp,
            ),

            Container(
              padding: AppConstants.screenPadding,
              height: 50.sp,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      focusNode: node,
                      controller: search,
                      onChanged: (x){
                        if(x.isEmpty){
                          context.read<RetailersSearchCubit>().searchRetailer("");
                          node.unfocus();
                        }

                      },
                      onSubmitted: (x){
                        context.read<RetailersSearchCubit>().searchRetailer(search.text.trim());
                      },
                      decoration: InputDecoration(

                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(

                            icon: Icon(
                              Icons.arrow_forward,
                              size: 24.sp,
                            ),
                            onPressed: (){
                              node.unfocus();
                              context.read<RetailersSearchCubit>().searchRetailer(search.text.trim());
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0.sp),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30.0.sp),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Type in your text".tr(),
                          fillColor: Colors.white70),

                    ),
                  ),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel'.tr(),
                          style: GoogleFonts.roboto(
                            fontSize: 14.0.sp,
                            color: const Color(0xFF363636),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),),
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            SizedBox(
              height: 80.sp,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AllProductsController.data.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: index == 0 ? 20.sp : 0, right: 40.sp),
                      height: 95,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: 70.sp,
                              height: 70.0.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11.0.sp),
                                color: Colors.white,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(11.0.sp),
                                child: Image.network(AllProductsController.data.data![index].storeImgUrl,
                                fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                AllProductsController.data.data[index].categories.data.asMap().containsKey(0)?AllProductsController.data.data[index].categories.data[0].categoryTitle:"N/A",
                                style: GoogleFonts.roboto(
                                  fontSize: 14.0.sp,
                                  color: const Color(0xFF363636),
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20.sp,
            ),

            Padding(
              padding: AppConstants.screenPadding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Featured Categories'.tr(),
                  style: GoogleFonts.roboto(
                    fontSize: 14.0.sp,
                    color: const Color(0xFF363636),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Container(
              padding: AppConstants.screenPadding,
              height: 100.sp,
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  return state is CategoriesLoading? const Center(
                    child: CircularProgressIndicator(),
                  ): Wrap(
                    spacing: 8, // space between items
                    children:CategoriesController.data.data
                        .map((e) => Container(
                      margin: const EdgeInsets.only(right: 5, bottom: 5),
                      padding: const EdgeInsets.all(9),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xFFE8E8E8),
                      ),
                      child: Text(e.categoryTitle),
                    ))
                        .toList(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 140.sp,
            ),
        Padding(
          padding: AppConstants.screenPadding,
          child: Text(
            'Results',
            style: GoogleFonts.roboto(
              fontSize: 16.0,
              color: const Color(0xFF363636),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
            BlocBuilder<RetailersSearchCubit, RetailersSearchState>(
  builder: (context, state) {
            if(state is RetailersSearchLoaded){
              return Container(
                margin: EdgeInsets.only(top: 10.sp),
                height: 280.sp,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: RetailerSearchController.data.data.length,
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
                                child: Image.network(RetailerSearchController.data.data[index].storeImgUrl.toString()),
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
                                                  RetailerSearchController.data.data[index].storeName,
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
                                                  RetailerSearchController.data.data[index].storeCashback.toString(),
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
                                                    RetailerSearchController.data.data[index].categories.data.asMap().containsKey(0)?RetailerSearchController.data.data[index].categories.data[0].categoryTitle:"N/A",
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
                                                              RetailerSearchController.data.data[index].couponsCount.toString(),
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
                                                              RetailerSearchController.data.data[index].productsCount.toString(),
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
                                                child: AllShopsHeart(index: index,guest: widget.guest,)
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
            }
            else if(state is RetailersSearchLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            else{
              return Container();
            }
  },
)
          ],
        ),
      ),
    );
  }
}
