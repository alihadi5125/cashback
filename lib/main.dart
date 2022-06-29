import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/controller/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/bottom_navigation_page_index_cubit.dart';
import 'controller/product_types_page_index_cubit.dart';
import 'view/splash_screen.dart';
void main() {
  SharePrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<BottomNavigationPageIndexCubit>(
              create: (BuildContext context) => BottomNavigationPageIndexCubit(0),
            ),
            BlocProvider<ProductTypesPageIndexCubit>(
              create: (BuildContext context) => ProductTypesPageIndexCubit(0),
            ),
            BlocProvider<SignupCubit>(
              create: (BuildContext context) => SignupCubit(),
            ),
          ],

          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: const SplashScreen()
    );
  }
}

