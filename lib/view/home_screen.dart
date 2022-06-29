import 'package:cashback/controller/AppConstants.dart';
import 'package:cashback/controller/cashback_icons.dart';
import 'package:cashback/controller/product_page_controller.dart';
import 'package:cashback/controller/product_types_page_index_cubit.dart';
import 'package:cashback/view/all_featured_products.dart';
import 'package:cashback/view/all_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: ListView(
        children: [
          SizedBox(
            height: 30.sp,
          ),
          Container(
            padding: AppConstants.screenPadding,
            height: 60.sp,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset("images/logo_orange.png"),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    width: 61.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Cashback.flag,
                            color: AppConstants.appDarkColor,
                            size: 15.sp,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: AppConstants.appBlackMedium,
                              size: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 40.0.sp,
                      height: 40.0.sp,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.notifications_none,
                        color: AppConstants.appDarkColor,
                        size: 25.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: AppConstants.screenPadding,
            height: 50.sp,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
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
                        hintText: "Type in your text",
                        fillColor: Colors.white70),
                  ),
                ),
                Expanded(
                    child: Column(
                      children: [
                        const Expanded(
                          child: Icon(
                            Cashback.category,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Categories',
                            style: GoogleFonts.roboto(
                              fontSize: 14.0.sp,
                              color: const Color(0xFF363636),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          SizedBox(
            height: 95.sp,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: index == 0 ? 20.sp : 0, right: 10.sp),
                    height: 95,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            width: 97.33,
                            height: 70.0.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.0),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Image.asset(
                                assetsArray[index],
                                height: 35.sp,
                                width: 70.sp,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              categories[index],
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
          Container(
            padding: EdgeInsets.all(3.sp),
            margin: AppConstants.screenPadding,
            width: 334.0,
            height: 50.0.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFCCCCCC),
              ),
            ),
            child: BlocBuilder<ProductTypesPageIndexCubit, int>(
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 86.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: state==0?const Color(0xFFFC4F08):Colors.transparent,
                        ),
                        child: InkWell(
                          onTap: (){
                            context.read<ProductTypesPageIndexCubit>().setTabIndex(index: 0);
                            ProductsPageController.page.jumpTo(0);
                          },
                          child: Center(
                            child: Text(
                              'All',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                color: state==0?Colors.white:Color(0xff4D4D4D),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),

                    ),
                    Expanded(
                      child: Container(
                        width: 86.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: state==1?const Color(0xFFFC4F08):Colors.transparent,
                        ),
                        child: InkWell(
                          onTap: (){
                            context.read<ProductTypesPageIndexCubit>().setTabIndex(index: 1);
                            ProductsPageController.page.jumpTo(1);
                          },
                          child: Center(
                            child: Text(
                              'Featured',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                color: state==1?Colors.white:Color(0xff4D4D4D),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),

                    ),
                    Expanded(
                      child: Container(
                        width: 86.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: state==2?const Color(0xFFFC4F08):Colors.transparent,
                        ),
                        child: InkWell(
                          onTap: (){
                            context.read<ProductTypesPageIndexCubit>().setTabIndex(index: 2);
                            ProductsPageController.page.jumpTo(2);
                          },
                          child: Center(
                            child: Text(
                              'Favourite',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                color: state==2?Colors.white:Color(0xff4D4D4D),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),

                    ),

                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            margin: AppConstants.screenPadding,
            height: 0.45.sh,
            child: PageView(
              controller: ProductsPageController.page,
              onPageChanged: (x){
                context.read<ProductTypesPageIndexCubit>().setTabIndex(index: x);
              },
              children: [
                AllProducts(),
                AllFeaturedProducts(),
                AllProducts(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
