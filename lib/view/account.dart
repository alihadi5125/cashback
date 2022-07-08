import 'package:cashback/controller/logout_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AccountScreen extends StatefulWidget {
  bool guest;
  AccountScreen({required this.guest});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      child:ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            width: 383.0,
            height: 0.27.sh,
            color: const Color(0xFFFC4F08),
            child: Column(
              children: [
                SizedBox(
                  height: 30.sp,
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 93.0.sp,
                      height: 93.0.sp,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/man.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'George Smith',
                      style: GoogleFonts.roboto(
                        fontSize: 20.0.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
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
                        'User ID: 234234',
                        style: GoogleFonts.roboto(
                          fontSize: 14.0.sp,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 145.0,
                      height: 33.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: const Color(0xFF363636).withOpacity(0.39),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '€ 100.0',
                            style: GoogleFonts.roboto(
                              fontSize: 20.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
            alignment: Alignment(-0.62, -0.05),
            width: 341.0,
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
                      child: Image.asset("images/coins.png",
                        width: 25.sp,
                      )),
                ),
                Expanded(
                    flex: 6,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Balance'.tr(),
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          color: const Color(0xFF363636),
                          fontWeight: FontWeight.w500,
                          height: 0.88,
                        ),
                      ),
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                )

              ],
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
            alignment: Alignment(-0.62, -0.05),
            width: 341.0,
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
                      child: Image.asset("images/history.png",
                        width: 25.sp,
                      )),
                ),
                Expanded(
                    flex: 6,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'History'.tr(),
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          color: const Color(0xFF363636),
                          fontWeight: FontWeight.w500,
                          height: 0.88,
                        ),
                      ),
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                )

              ],
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
            alignment: Alignment(-0.62, -0.05),
            width: 341.0,
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
                      child: Image.asset("images/withdraw.png",
                        width: 25.sp,
                      )),
                ),
                Expanded(
                    flex: 6,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Withdrawal'.tr(),
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          color: const Color(0xFF363636),
                          fontWeight: FontWeight.w500,
                          height: 0.88,
                        ),
                      ),
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                )

              ],
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
            alignment: Alignment(-0.62, -0.05),
            width: 341.0,
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
                      child: Image.asset("images/list.png",
                        width: 25.sp,
                      )),
                ),
                Expanded(
                    flex: 6,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Transaction not Recorded'.tr(),
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          color: const Color(0xFF363636),
                          fontWeight: FontWeight.w500,
                          height: 0.88,
                        ),
                      ),
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                )

              ],
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
            alignment: Alignment(-0.62, -0.05),
            width: 341.0,
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
                      child: Image.asset("images/user.png",
                        width: 25.sp,
                      )),
                ),
                Expanded(
                    flex: 6,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Edit Profile'.tr(),
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          color: const Color(0xFF363636),
                          fontWeight: FontWeight.w500,
                          height: 0.88,
                        ),
                      ),
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                )

              ],
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
            alignment: Alignment(-0.62, -0.05),
            width: 341.0,
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
                      child: Image.asset("images/information.png",
                        width: 25.sp,
                      )),
                ),
                Expanded(
                    flex: 6,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Help'.tr(),
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          color: const Color(0xFF363636),
                          fontWeight: FontWeight.w500,
                          height: 0.88,
                        ),
                      ),
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                )

              ],
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
            alignment: const Alignment(-0.62, -0.05),
            width: 341.0,
            height: 59.0.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
            ),
            child: InkWell(
              onTap: (){
                context.read<LogoutCubit>().logout(context: context, guest: true);
              },
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset("images/logout.png",
                          width: 25.sp,
                        )),
                  ),
                  Expanded(
                      flex: 6,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Logout'.tr(),
                          style: GoogleFonts.roboto(
                            fontSize: 16.0,
                            color: const Color(0xFF363636),
                            fontWeight: FontWeight.w500,
                            height: 0.88,
                          ),
                        ),
                      )),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
