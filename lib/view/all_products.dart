
import 'package:cashback/controller/AppConstants.dart';
import 'package:cashback/controller/cashback_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  List<String> images=[
    "images/mediamarkt.png",
    "images/cosmossport.png",
    "images/ccc.png",
    "images/ccc.png",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
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
                  image:  DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
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
                             child: Text(
                               'Media Markt',
                               style: GoogleFonts.roboto(
                                 fontSize: 16.0.sp,
                                 color: const Color(0xFF363636),
                                 fontWeight: FontWeight.w900,
                               ),
                             ),
                           ),
                         ),
                         Expanded(
                           child: Align(
                             alignment: Alignment.topCenter,
                             child: Text(
                               '3.6%',
                               style: GoogleFonts.roboto(
                                 fontSize: 20.0.sp,
                                 color: const Color(0xFFFC4F08),
                                 fontWeight: FontWeight.w900,
                               ),
                               textAlign: TextAlign.center,
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
                            child:  Text(
                              'Electronics',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                color: const Color(0xFF363636),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Cashback Up to ',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                color: const Color(0xFFA7A7A7),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
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
                                          child: Text(
                                            '45',
                                            style: GoogleFonts.roboto(
                                              fontSize: 16.0.sp,
                                              color: const Color(0xFF363636),
                                              fontWeight: FontWeight.w900,
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
                                    child: Text(
                                      'Coupons',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14.0.sp,
                                        color: const Color(0xFFA7A7A7),
                                        fontWeight: FontWeight.w500,
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
                                          child: Text(
                                            '45',
                                            style: GoogleFonts.roboto(
                                              fontSize: 16.0.sp,
                                              color: const Color(0xFF363636),
                                              fontWeight: FontWeight.w900,
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
                                    child: Text(
                                      'Coupons',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14.0.sp,
                                        color: const Color(0xFFA7A7A7),
                                        fontWeight: FontWeight.w500,
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
    });
  }
}
