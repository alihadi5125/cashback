import 'package:cashback/controller/AppConstants.dart';
import 'package:cashback/controller/cashback_icons.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesExpanable extends StatefulWidget {
  const CategoriesExpanable({Key? key}) : super(key: key);

  @override
  State<CategoriesExpanable> createState() => _CategoriesExpanableState();
}


class Data{
  String header;
  String title;
  String subtitle;
  List<String> data;

  Data({required this.header, required this.title, required this.subtitle, required this.data});
}
class _CategoriesExpanableState extends State<CategoriesExpanable> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: AppConstants.screenPadding,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_back,
                              size: 25.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Store Categories',
                              style: GoogleFonts.roboto(
                                fontSize: 26.0.sp,
                                color: const Color(0xFF363636),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child:  ListView.builder(
                    padding: AppConstants.screenPadding,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return ListView(
                          padding: EdgeInsets.only(bottom: 20.sp),
                          shrinkWrap: true,
                          children: [
                          Text(
                          index==0?'A':"B",
                          style: GoogleFonts.roboto(
                            fontSize: 16.0,
                            color: const Color(0xFF4D4D4D),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                            SizedBox(
                              height: 9.sp,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: index+1,
                                itemBuilder: (context, index){
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 20.sp),
                                    child: ExpandablePanel(

                                      theme:const ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        hasIcon: false,
                                      ),
                                      header: Container(
                                        padding: EdgeInsets.all(12.sp),
                                        height: 59.0.sp,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Image.asset("images/electronics.png",
                                                height: 40.sp,
                                                  width: 40.sp,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                            alignment: Alignment.bottomLeft,
                                                            child: Text(
                                                              'Auto Moto',
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
                                                            alignment: Alignment.bottomRight,
                                                            child: Icon(
                                                              Icons.keyboard_arrow_down_rounded,
                                                              size: 24.sp,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4.sp,
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                        'Car, Motorcycle',
                                                        style: GoogleFonts.roboto(
                                                          fontSize: 12.0.sp,
                                                          color: const Color(0xFF363636),
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            )
                                          ],
                                        ),
                                      ),
                                      collapsed: Container(
                                        height:0,
                                        color: Colors.grey,

                                      ),
                                      expanded: ListView.builder(
                                          itemCount: 3,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index){
                                        return Container(
                                          margin: EdgeInsets.only(top: 10.sp),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    'Laptops (450)',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 18.0.sp,
                                                      color: const Color(0xFF363636),
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(
                                                    Icons.arrow_forward_ios_rounded,
                                                    size: 15.sp,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      })
                                    ),
                                  );
                                })
                          ],
                        );
                      }),
                )
              ],
            )),
      ),
    );
  }
}
