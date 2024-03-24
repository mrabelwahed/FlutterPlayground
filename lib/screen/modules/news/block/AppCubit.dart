import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/screen/modules/news/block/AppStates.dart';
import 'package:flutter_playground/screen/modules/news/business_screen.dart';
import 'package:flutter_playground/screen/modules/news/science_screen.dart';
import 'package:flutter_playground/screen/modules/news/sports_screen.dart';
import 'package:flutter_playground/screen/shared/cache/CacheHelper.dart';
import 'package:flutter_playground/screen/shared/network/DioHelper.dart';

import '../settings_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  bool isWebViewLoading = true;
  bool isDarkMode = false;
  //
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }

  void toggleWebViewLoading() {
    isWebViewLoading =!isWebViewLoading;
    emit(WebViewLoading());
  }

  void toggleDarkTheme({bool? fromShared}) {
    if (fromShared !=null) {
      isDarkMode = fromShared;
    } else {
      isDarkMode = !isDarkMode;
    }
    CacheHelper.putBoolean(key: 'isDark', value: isDarkMode).then((value) =>  emit(DarkThemeState()));
  }


  void getBusiness() {
    emit(BusinessNewsLoading());
    DioHelper.getData(path: "v2/top-headlines", queryParameters: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'fee38bf418b04948b7b372c045fdf499'
    }).then((value) {
      business = value.data['articles'];
      log(value.toString());
      emit(BusinessNewsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(BusinessNewsError(error.toString()));
    });
  }

  void getSports() {
    emit(SportsNewsLoading());
    DioHelper.getData(path: "v2/top-headlines", queryParameters: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      sports = value.data['articles'];
      log(value.toString());
      emit(SportsNewsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(SportsNewsError(error.toString()));
    });
  }


  void getScience() {
    emit(ScienceNewsLoading());
    DioHelper.getData(path: "v2/top-headlines", queryParameters: {
      'country': 'us',
      'category': 'science',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      science = value.data['articles'];
      log(value.toString());
      emit(ScienceNewsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(ScienceNewsError(error.toString()));
    });
  }
}
