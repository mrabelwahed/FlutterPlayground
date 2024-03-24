

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/screen/modules/news/block/AppCubit.dart';
import 'package:flutter_playground/screen/modules/news/block/AppStates.dart';

class NewsLayout extends StatelessWidget {
  final bool isDark;
  const NewsLayout(this.isDark,{super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,states){},
      builder:(context,states) => Scaffold(
        appBar: AppBar(
          title: Text('News App', style: Theme.of(context).textTheme.bodyMedium,),
          actions: [
            IconButton(onPressed: (){
              print("search is clicked");
            }, icon: Icon(Icons.search)),
            IconButton(onPressed: (){
              print("theme toggle is clicked");
              cubit.toggleDarkTheme();
            }, icon: Icon(Icons.brightness_4_outlined))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.business), label: "business"),
            BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sport"),
            BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
          ],
          currentIndex: cubit.currentIndex,
          onTap: (index) {
            cubit.changeCurrentIndex(index);
          },
        ),
        body: ConditionalBuilder(
          condition: true,
          builder: (context) => cubit.screens[cubit.currentIndex],
          fallback: (context) => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
