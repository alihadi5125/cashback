import 'package:cashback/controller/bottom_navigation_page_index_cubit.dart';
import 'package:cashback/controller/cashback_icons.dart';
import 'package:cashback/view/account.dart';
import 'package:cashback/view/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
class BottomNavigationScreen extends StatefulWidget {
 bool guest;
 BottomNavigationScreen({required this.guest});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  PageController pageController=PageController(initialPage: 0);

  @override
  void initState(){
    context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: 0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        debugPrint("popping from route 2 disabled");
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffEFEEEE),
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: PageView(
            controller: pageController,
            onPageChanged: (x){

              if(x==4 && widget.guest==true){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              }
              else{
                context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: x);
              }
            },
            children: [
              HomeScreen(guest:widget.guest),
              Container(),
              Container(),
              Container(),
              AccountScreen(guest:widget.guest),

            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<BottomNavigationPageIndexCubit, int>(
          builder: (context, state) {
            return Container(
              width: 375.0,
              height: 84.0.sp,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0, 0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: 0);
                        pageController.jumpToPage(0);


                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Icon(
                                Cashback.home,
                                color: state==0?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                size: 25.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Home'.tr(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 14.0.sp,
                                    color: state==0?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        if(!widget.guest){
                          pageController.jumpToPage(1);
                          context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: 1);
                        }

                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Icon(
                                Cashback.bag,
                                color: state==1?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                size: 25.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Products'.tr(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 14.0.sp,
                                    color: state==1?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                            if(!widget.guest){
                              context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: 2);
                              pageController.jumpToPage(2);
                            }
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Icon(
                                Cashback.gift,
                                color: state==2?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                size: 25.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Refer a Friend'.tr(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 14.0.sp,
                                    color: state==2?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                       if(!widget.guest){
                         context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: 3);
                         pageController.jumpToPage(3);
                       }
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Icon(
                                Cashback.like,
                                color: state==3?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                size: 25.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Wishlist'.tr(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 14.0.sp,
                                    color: state==3?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        if(!widget.guest){
                          context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: 4);
                          pageController.jumpToPage(4);

                        }
                        else{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        }

                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Icon(
                               Icons.person_outline_outlined ,
                                color: state==4?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                size: 25.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Account'.tr(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 14.0.sp,
                                    color: state==4?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
