import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharePrefs{
 static  SharedPreferences? prefs;
 static PageController? controller;
 static  RefreshController refreshController =
 RefreshController(initialRefresh: true);

 static void activateHomeTabController(){
   controller =PageController(initialPage: 0);
 }

static Future<void> init() async {
  prefs=await SharedPreferences.getInstance();

}

}