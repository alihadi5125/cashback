import 'package:cashback/view/custom_widgets/custom_button.dart';
import 'package:cashback/view/login_screen.dart';
import 'package:cashback/view/register_screen.dart';
import 'package:cashback/view/splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashSecond extends StatefulWidget {
  const SplashSecond({Key? key}) : super(key: key);

  @override
  State<SplashSecond> createState() => _SplashSecondState();
}

class _SplashSecondState extends State<SplashSecond> {
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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
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
                top: 0.2.sh,
                child: Container(
                  margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                  width: 341.0.sp,
                  height: 651.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      Image.asset(
                        "images/register_vector.png",
                        height: 300.sp,
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Text(
                        'Get Cashbacksfrom 50,000+ Brands',
                        style: GoogleFonts.roboto(
                          fontSize: 20.0.sp,
                          color: const Color(0xFF363636),
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text(
                        'Amazing platforms, Enjoy the Cashbacks\nand enjoy deals on every shopping',
                        style: GoogleFonts.roboto(
                          fontSize: 16.0.sp,
                          color: const Color(0xFF363636),
                          fontWeight: FontWeight.w500,
                          height: 1.13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 0.08.sh,
                      ),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                          },
                          child: CustomButton(title: "Register Now")),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Already Member?',
                            style: GoogleFonts.roboto(
                              fontSize: 17.0.sp,
                              color: const Color(0xFF363636),
                              fontWeight: FontWeight.w500,
                              height: 1.06,
                            ),
                            children:  <TextSpan>[
                              TextSpan(text: ' Sign In',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                                  },
                                style:  GoogleFonts.roboto(
                                fontSize: 16.0.sp,
                                color: Colors.black,
                                letterSpacing: 0.192,
                                fontWeight: FontWeight.w900,

                              ),),
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
