import 'package:cashback/controller/LoginCubit/login_cubit.dart';
import 'package:cashback/controller/add_to_fav_cubit.dart';
import 'package:cashback/controller/all_favourite_products_cubit.dart';
import 'package:cashback/controller/all_feature_shops_cubit.dart';
import 'package:cashback/controller/all_shops_cubit.dart';
import 'package:cashback/controller/categories_cubit.dart';
import 'package:cashback/controller/logout_cubit.dart';
import 'package:cashback/controller/parent_categories_cubit.dart';
import 'package:cashback/controller/remove_fav_cubit.dart';
import 'package:cashback/controller/retailers_search_cubit/retailers_search_cubit.dart';
import 'package:cashback/controller/shared_preferences.dart';
import 'package:cashback/controller/signup_cubit.dart';
import 'package:cashback/view/bottom_navigation_screen.dart';
import 'package:cashback/view/splash_second.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/bottom_navigation_page_index_cubit.dart';
import 'controller/product_types_page_index_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/splash_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SharePrefs.activateHomeTabController();
  await SharePrefs.init();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('el', 'GR')],
      path: 'assets/translation',
      saveLocale: true,
      startLocale: Locale('el', 'GR'),

      // -- change the path of the translation files

      child: const MyApp()));
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
            BlocProvider<AllShopsCubit>(
              create: (BuildContext context) => AllShopsCubit(),
            ),
            BlocProvider<AllFeatureShopsCubit>(
              create: (BuildContext context) => AllFeatureShopsCubit(),
            ),
            BlocProvider<LoginCubit>(
              create: (BuildContext context) => LoginCubit(),
            ),
            BlocProvider<CategoriesCubit>(
              create: (BuildContext context) => CategoriesCubit(),
            ),
            BlocProvider<AllFavouriteProductsCubit>(
              create: (BuildContext context) => AllFavouriteProductsCubit(),
            ),
            BlocProvider<ParentCategoriesCubit>(
              create: (BuildContext context) => ParentCategoriesCubit(),
            ),
            BlocProvider<LogoutCubit>(
              create: (BuildContext context) => LogoutCubit(),
            ),
            BlocProvider<AddToFavCubit>(
              create: (BuildContext context) => AddToFavCubit(),
            ),
            BlocProvider<RemoveFavCubit>(
              create: (BuildContext context) => RemoveFavCubit(),
            ),
            BlocProvider<RetailersSearchCubit>(
              create: (BuildContext context) => RetailersSearchCubit(),
            ),
          ],

          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
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
      child: SharePrefs.prefs!.getString("token")==null?SharePrefs.prefs!.getBool("initial")==null?const SplashScreen():SplashSecond(): BottomNavigationScreen(guest: false,)
     // child: SharePrefs.prefs!.getString("token")==null?SharePrefs.prefs!.getBool("initial")==null?const SplashScreen():SplashSecond(): SplashSecond()
     //  child: const BottomNavigationScreen()
    );
  }
}

