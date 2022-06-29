import 'package:cashback/view/bottom_navigation_screen.dart';
import 'package:cashback/view/custom_widgets/custom_button.dart';
import 'package:cashback/view/custom_widgets/text_field.dart';
import 'package:cashback/view/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEFEEEE),
        body: SizedBox(
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
                  height: 467.0.sp,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(360.0, 233.5)),
                    color: Color(0xFFFC4F08),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                  height: 651.0.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                  ),
                  child: ListView(
                    padding:
                        EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
                    children: [
                      Image.asset("images/logo_orange.png",
                      height: 90.sp,
                      ),
                      SizedBox(
                        height: 35.sp,
                      ),
                      Center(
                        child: Text(
                          'Login',
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
                                  'Email',
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
                        hintText: "Full Name",
                        controller: TextEditingController(),
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
                                  'Password',
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
                        hintText: "Password",
                        controller: TextEditingController(),
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
                        'Forget Password?',
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
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationScreen()));
                          },
                          child: CustomButton(title: "LOGIN")),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        'Get Register with',
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
                        height: 40.sp,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Create an Account?',
                            style: GoogleFonts.roboto(
                              fontSize: 17.0.sp,
                              color: const Color(0xFF363636),
                              fontWeight: FontWeight.w500,
                              height: 1.06,
                            ),
                            children:  <TextSpan>[
                              TextSpan(text: ' Sign Up',
                                recognizer:  TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                            },
                                style:  GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                color: Colors.black,
                                letterSpacing: 0.192,
                                fontWeight: FontWeight.w900,
                              ),
                              )..recognizer
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
