import 'package:cashback/controller/LoginCubit/login_cubit.dart';
import 'package:cashback/controller/product_types_page_index_cubit.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/view/bottom_navigation_screen.dart';
import 'package:cashback/view/custom_widgets/custom_button.dart';
import 'package:cashback/view/custom_widgets/snack_bar.dart';
import 'package:cashback/view/custom_widgets/text_field.dart';
import 'package:cashback/view/register_screen.dart';
import 'package:cashback/view/splash_second.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState(){
    SharePrefs.activateHomeTabController();
    context.read<ProductTypesPageIndexCubit>().setTabIndex(index: 0);
    super.initState();

  }
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: ()async {
          debugPrint("popping from route 2 disabled");
          return false;
        },
        child: Scaffold(
          backgroundColor: Color(0xffEFEEEE),
          body: SingleChildScrollView(
            child: SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Stack(
                children: [
                  Positioned(
                    top: -160.sp,
                    left: -60.sp,
                    child: Container(
                      padding: EdgeInsets.only(right: 1.26.sw),
                      width: 720.0,
                      height: .6.sh,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(360.0, 233.5)),
                        color: Color(0xFFFC4F08),
                      ),
                      child: InkWell(
                        onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashSecond()));
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0.17.sh,
                    child: Container(
                      margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                      width: 341.0.sp,
                      height: .81.sh,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white,
                      ),
                      child: ListView(
                        padding:
                            EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
                        children: [
                          Image.asset(
                            "images/logo_orange.png",
                            height: 90.sp,
                          ),
                          SizedBox(
                            height: 0.03.sh,
                          ),
                          Center(
                            child: Text(
                              'Login'.tr(),
                              style: GoogleFonts.roboto(
                                fontSize: 32.0.sp,
                                color: const Color(0xFF363636),
                                fontWeight: FontWeight.w900,
                                height: 1.22,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),

                          SizedBox(
                            height: 20.sp,
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: Color(0xffFC4F08),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Email'.tr(),
                                      style: GoogleFonts.lato(
                                        fontSize: 14.0.sp,
                                        color: Colors.black,
                                        letterSpacing: 0.168,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          CustomTextField(
                            hintText: "Email".tr(),
                            controller: email,
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          SizedBox(
                            height: 20.sp,
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.lock_open_outlined,
                                      color: Color(0xffFC4F08),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Password'.tr(),
                                      style: GoogleFonts.lato(
                                        fontSize: 14.0.sp,
                                        color: Colors.black,
                                        letterSpacing: 0.168,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          CustomTextField(
                            hintText: "Password".tr(),
                            controller: password,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                //TODO: onTap Forget Password?
                                print('onTap Forget Password?');
                              },
                              child: Text(
                                'Forget Password?'.tr(),
                                style: GoogleFonts.roboto(
                                  fontSize: 14.0.sp,
                                  color: const Color(0xFF363636),
                                  fontWeight: FontWeight.w500,
                                  height: 1.29,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.05.sh,
                          ),
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return InkWell(
                                  onTap: () async {
                                    final Connectivity connectivity = Connectivity();
                                    ConnectivityResult result= await connectivity.checkConnectivity();

                                          if(result==ConnectivityResult.mobile || result == ConnectivityResult.wifi){
                                            context.read<LoginCubit>().userLogin(
                                                context: context,
                                                email: email.text,
                                                password: password.text);
                                          }

                                   else{
                                     Snackbar.showSnack(
                                         context: context, message: 'No Internet Connection'.tr());

                                   }


                                  },
                                  child: state is LoginLoading?
                                  Container(
                              margin: EdgeInsets.only(left: 70.sp, right: 70.sp),
                              alignment: Alignment(0.0, -0.08),
                              width: 202.0,
                              height: 45.0.sp,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0.sp),
                              color: const Color(0xFFFC4F08),
                              ),
                              child: const Center(
                              child: CircularProgressIndicator()
                              ),
                              )
                                  :CustomButton(title: "LOGIN".tr()));
                            },
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          Text(
                            'Get Register with'.tr(),
                            style: GoogleFonts.roboto(
                              fontSize: 14.0.sp,
                              color: const Color(0xFF363636),
                              fontWeight: FontWeight.w500,
                              height: 1.07,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          SizedBox(
                            height: 40.sp,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Image.asset("images/google.png"),
                                ),
                                Expanded(
                                  child: Image.asset("images/facebook.png"),
                                ),
                                Expanded(
                                  child: Image.asset("images/apple.png"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Create an Account?'.tr(),
                                style: GoogleFonts.roboto(
                                  fontSize: 17.0.sp,
                                  color: const Color(0xFF363636),
                                  fontWeight: FontWeight.w500,
                                  height: 1.06,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Sign Up'.tr(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterScreen()));
                                      },
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.0.sp,
                                      color: Colors.black,
                                      letterSpacing: 0.192,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )..recognizer
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.05.sh,
                          ),
                          Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationScreen(
                                  guest:true
                                )));
                              },
                              child: Text(
                                "Login as a guest".tr(),
                                 style: GoogleFonts.roboto(
                                fontSize: 17.0.sp,
                                color:Colors.grey,
                                fontWeight: FontWeight.w500,
                                height: 1.06,
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
            ),
          )),
      );
  }
}
