import 'package:cashback/view/custom_widgets/custom_button.dart';
import 'package:cashback/view/splash_second.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              Positioned(
                top: -300.sp,
                left: -220.sp,
                child: Container(
                  width: 720.0,
                  height: 467.0.sp,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(360.0, 233.5)),
                    color: Color(0xFFFC4F08),
                  ),
                ),
              ),
              Positioned(
                top: -290.sp,
                left: -200.sp,
                child: Container(
                  width: 720.0,
                  height: 467.0.sp,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(360.0, 233.5)),
                    color: Color(0xFFFC4F08).withOpacity(.3),
                  ),
                ),
              ),
              Positioned(
                top: -285.sp,
                left: -180.sp,
                child: Container(
                  width: 720.0,
                  height: 467.0.sp,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(const Radius.elliptical(360.0, 233.5)),
                    color: Color(0xFFFC4F08).withOpacity(.3),
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0.35.sh,
                  child: Image.asset(
                    "images/logo_orange.png",
                    height: 100.sp,
                  )),
              Positioned(
                left: 0,
                right: 0,
                top: 0.46.sh,
                child: Text(
                  'Our Prioirty is to provide the\n best services that meets your expectation\n and this is the sample description',
                  style: GoogleFonts.roboto(
                    fontSize: 17.0.sp,
                    color: const Color(0xFF363636),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 30.sp,
                right: 0,
                top: 0.55.sh,
                child: Text(
                  'Select your country',
                  style: GoogleFonts.roboto(
                    fontSize: 16.0.sp,
                    color: Colors.black,
                    letterSpacing: 0.192,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Positioned(
                left: 30.sp,
                right: 30.sp,
                top: 0.59.sh,
                child: Container(
                  width: 300.0.sp,
                  height: 46.0.sp,
                  child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: ["Cyprus","Tunisia", 'Canada'],
                    onChanged: print,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.sp),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color(0xffFFA07A))),
                        hintText: "Cyprus",
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                  top: 0.8.sh,
                  left: 0,
                  right: 0,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashSecond()));
                    },
                    child: CustomButton(
                title: "ENTER",
              ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}