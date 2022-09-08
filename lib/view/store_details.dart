import 'package:cashback/controller/AppConstants.dart';
import 'package:cashback/controller/cashback_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_drawing/path_drawing.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails({Key? key}) : super(key: key);

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: Color(0xffEFEEEE),
          body: Container(
            margin: AppConstants.screenPadding,
        width: 1.sw,
        height: 1.sh,
            child:  Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 20.sp,
                  child: SizedBox(
                    height: 25.sp,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_back,
                        size: 25.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60.sp,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    width: 1.sw,
                    height: 0.88.sh,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 100.sp,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100.0.sp,
                                  height: 100.0.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(

                                        height: 100.0.sp,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: const Color(0xFFD00000),
                                        ),
                                      ),
                                      Positioned(
                                        right: 6.sp,
                                        bottom: 6.sp,
                                        child: Container(
                                          height: 26.sp,
                                          width: 26.sp,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                            shape: BoxShape.circle
                                          ),
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 22.sp,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child:  Align(
                                          alignment: Alignment.topLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              style: GoogleFonts.roboto(
                                                fontSize: 16.0.sp,
                                                color: const Color(0xFF363636),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Media Markt Coupons Offers +\n ',
                                                  style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:  'up to 3.5% Cashback',
                                                  style: GoogleFonts.roboto(
                                                    color: const Color(0xFFFC4F08),
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Icon(
                                                  Icons.star_border_outlined,
                                                  size: 23.sp,
                                                  color: const Color(0xFFD00000),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 18.0.sp,
                                                      color: const Color(0xFF363636),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '4.5',
                                                        style: GoogleFonts.roboto(
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: ' by 4523 persons',
                                                        style: GoogleFonts.roboto(
                                                          fontSize: 14.0,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 132.0.sp,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              border: Border.all(
                                                width: 2.0,
                                                color: const Color(0xFFFC4F08),
                                              ),
                                            ),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  //TODO: onTap See all reviews
                                                  print('onTap See all reviews');
                                                },
                                                child: Center(
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      'SEE ALL REVIEWS',
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 12.0.sp,
                                                        color: const Color(0xFFFC4F08),
                                                        fontWeight: FontWeight.w900,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.sp,
                        ),
                        SizedBox(
                          height: 92.sp,
                          width: 1.sw,
                          child: Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Container(
                                  padding: EdgeInsets.only(left: 13.sp, right: 13.sp),
                                  height: 92.0.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0.sp),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex:2,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Icon(
                                                  Cashback.coupon,
                                                  size:40.sp,
                                                  color: const Color(0xFFFC4F08),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                            flex: 2,
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    '14',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 40.0.sp,
                                                      color: const Color(0xFF363636),
                                                      fontWeight: FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Coupons Available',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14.0.sp,
                                                color: const Color(0xFFA7A7A7),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(left: 13.sp, right: 13.sp),
                                  height: 92.0.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0.sp),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex:2,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Icon(
                                                  Cashback.bag,
                                                  size:40.sp,
                                                  color: const Color(0xFF0BDCD4),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    '14',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 40.0.sp,
                                                      color: const Color(0xFF363636),
                                                      fontWeight: FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Products Available',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14.0.sp,
                                                color: const Color(0xFFA7A7A7),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.sp,
                        ),
                    Text(
                      'Available Coupons ',
                      style: GoogleFonts.roboto(
                        fontSize: 16.0.sp,
                        color: const Color(0xFF363636),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),


                      SizedBox(
                        height: 175.sp,
                        child: Stack(
                          children: [
                            CustomPaint(
                              size: Size(1.sw,(1.sw*0.5).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                              painter: FillPainter(),
                              child: Container(
                                height:160.sp,
                              ),
                            ),
                            CustomPaint(
                              size: Size(1.sw,(1.sw*0.5).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                              painter: FillWithDot(),
                              child: Container(
                                padding: EdgeInsets.only(left: 30.sp, right: 23.sp, top: 10.sp, bottom: 10.sp),

                                height:160.sp,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex:4,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child:   Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(

                                                height: 70.0.sp,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                  color: const Color(0xFFD00000),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 7.sp),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          'Refund available for any...',
                                                          style: GoogleFonts.roboto(
                                                            fontSize: 16.0.sp,
                                                            color: const Color(0xFF363636),
                                                            fontWeight: FontWeight.w900,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: FittedBox(
                                                        child: Text.rich(
                                                          TextSpan(
                                                            style: GoogleFonts.roboto(
                                                              fontSize: 14.0,
                                                              color: const Color(0xFF363636),
                                                              height: 1.29,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: 'At vero eos et accusamus et eos et accusamusiusto... ',
                                                                style: GoogleFonts.roboto(
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: 'read more',
                                                                style: GoogleFonts.roboto(
                                                                  fontWeight: FontWeight.w900,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment: Alignment.topLeft,                                                      child: Text(
                                                        '3.5%',
                                                        style: GoogleFonts.roboto(
                                                          fontSize: 20.0,
                                                          color: const Color(0xFFFC4F08),
                                                          fontWeight: FontWeight.w900,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                        'Cashback up to',
                                                        style: GoogleFonts.roboto(
                                                          fontSize: 12.0.sp,
                                                          color: const Color(0xFFA7A7A7),
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: // Group: Group 151
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child:  Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Container(
                                                    height: 35.0.sp,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(2.0),
                                                      border: Border.all(
                                                        width: 2.0,
                                                        color: const Color(0xFFFC4F08),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'CASHBACK DOWNLOAD',
                                                        style: GoogleFonts.roboto(
                                                          fontSize: 14.0,
                                                          color: const Color(0xFFFC4F08),
                                                          fontWeight: FontWeight.w900,
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      flex:2,
                                                      child: Align(
                                                        alignment: Alignment.bottomRight,
                                                        child: Text(
                                                          '22/02/2022',
                                                          style: GoogleFonts.roboto(
                                                            fontSize: 14.0.sp,
                                                            color: const Color(0xFF363636),
                                                            fontWeight: FontWeight.w900,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment: Alignment.bottomRight,
                                                        child: Text(
                                                          'Expiry Date',
                                                          style: GoogleFonts.roboto(
                                                            fontSize: 12.0,
                                                            color: const Color(0xFFA7A7A7),
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        SizedBox(
                          height: 175.sp,
                          child: Stack(
                            children: [
                              CustomPaint(
                                size: Size(1.sw,(1.sw*0.5).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: FillPainter(),
                                child: Container(
                                  height:175.sp,
                                ),
                              ),
                              CustomPaint(
                                size: Size(1.sw,(1.sw*0.5).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: FillWithDot(),
                                child: Container(

                                  height:175.sp,
                                ),
                              ),
                            ],
                          ),
                        ),







                      ],
                    ),
                  ),
                ),

              ],
            )
      )),
    );
  }
}


class FillPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path0 = Path();
    path0.moveTo(size.width,0);
    path0.lineTo(size.width,size.height*0.4042667);
    path0.quadraticBezierTo(size.width*0.9340000,size.height*0.3966667,size.width*0.9317333,size.height*0.5008000);
    path0.quadraticBezierTo(size.width*0.9331667,size.height*0.6042000,size.width,size.height*0.5994667);
    path0.lineTo(size.width,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(0,size.height*0.6000000);
    path0.quadraticBezierTo(size.width*0.0695000,size.height*0.5954667,size.width*0.0696667,size.height*0.4930667);
    path0.quadraticBezierTo(size.width*0.0693333,size.height*0.4000667,0,size.height*0.3923333);
    path0.lineTo(0,0);
    path0.lineTo(size.width,0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class FillWithDot extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = Color(0xffCCCCCC)
      ..style = PaintingStyle.stroke
      ..strokeWidth =2.sp;

    Path path0 = Path();
    path0.moveTo(size.width,0);
    path0.lineTo(size.width,size.height*0.4042667);
    path0.quadraticBezierTo(size.width*0.9340000,size.height*0.3966667,size.width*0.9317333,size.height*0.5008000);
    path0.quadraticBezierTo(size.width*0.9331667,size.height*0.6042000,size.width,size.height*0.5994667);
    path0.lineTo(size.width,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(0,size.height*0.6000000);
    path0.quadraticBezierTo(size.width*0.0695000,size.height*0.5954667,size.width*0.0696667,size.height*0.4930667);
    path0.quadraticBezierTo(size.width*0.0693333,size.height*0.4000667,0,size.height*0.3923333);
    path0.lineTo(0,0);
    path0.lineTo(size.width,0);
    path0.close();

    canvas.drawPath(dashPath(
      path0,
      dashArray: CircularIntervalList<double>(<double>[15.0, 6]),
    ), paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

