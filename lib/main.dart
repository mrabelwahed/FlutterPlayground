import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/screen/layout/news_layout.dart';
import 'package:flutter_playground/screen/modules/news/block/AppCubit.dart';
import 'package:flutter_playground/screen/modules/news/block/AppStates.dart';
import 'package:flutter_playground/screen/shared/bloc/todo/bloc_observer.dart';
import 'package:flutter_playground/screen/shared/cache/CacheHelper.dart';
import 'package:flutter_playground/screen/shared/network/DioHelper.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getBoolean(key: 'isDark') ?? false;
  print('theme now; $isDark');
  runApp(MyApp(isDark));
}


class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp(this.isDark,{super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusiness()..getSports()..getScience().. toggleDarkTheme(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppStates> (
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white
                  ),
                    iconTheme: IconThemeData(
                        color: Colors.black
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedIconTheme: IconThemeData(
                        color: Colors.deepOrange
                    ),
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white
                ),
                textTheme: TextTheme(
                    bodyMedium: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),

                ),
              progressIndicatorTheme: ProgressIndicatorThemeData(
                color: Colors.deepOrange
              )
            ),
            darkTheme: ThemeData(
                scaffoldBackgroundColor:HexColor('333739'),
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                    backgroundColor: HexColor('333739'),
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    ),
                    iconTheme: IconThemeData(
                        color: Colors.white
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedIconTheme: IconThemeData(
                        color: Colors.deepOrange
                    ),
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: HexColor('333739'),
                ),
                textTheme: TextTheme(
                  bodyMedium: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  bodySmall: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                progressIndicatorTheme: ProgressIndicatorThemeData(
                    color: Colors.deepOrange
                )
            ),
            themeMode: AppCubit.get(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: NewsLayout(isDark),
          );
        },
      ),
    );
  }

}
