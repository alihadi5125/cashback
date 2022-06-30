import 'package:cashback/controller/bottom_navigation_page_index_cubit.dart';
import 'package:cashback/controller/cashback_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';
class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEEEE),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: PageView(
          children: [
            HomeScreen(),

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
                            child: Text(
                              'Home',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                color: state==0?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
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
                      context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: 1);
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
                            child: Text(
                              'Products',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                color: state==1?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
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
                      context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: 2);
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
                            child: Text(
                              'Refer',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                color: state==2?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
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
                      context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: 3);
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
                            child: Text(
                              'Wishlist',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                color: state==3?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
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
                      context.read<BottomNavigationPageIndexCubit>().setPageIndex(index: 4);
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
                            child: Text(
                              'Account',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0.sp,
                                color: state==4?const Color(0xffFC4F08):const Color(0xffA7A7A7),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
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
    );
  }
}
