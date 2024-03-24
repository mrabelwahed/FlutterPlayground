
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/screen/shared/bloc/todo/todo_cubit.dart';
import 'package:flutter_playground/screen/shared/bloc/todo/todo_states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => TodoCubit()..createDatabase(),
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (BuildContext context, TodoStates state) => {},
        builder: (BuildContext context, TodoStates state) {
          TodoCubit cubit = TodoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.edit),
              onPressed: (){
                print("fab btn is clicked");
                cubit.insertToDatabase(cubit.database ,name: "ramadan", time: "100", date: "today");
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: "New"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive),
                    label: "Archive"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.done),
                    label: "Done"
                ),
              ],
              currentIndex: cubit.currentIndex,
              onTap: (index) {
               TodoCubit.get(context).changeCurrentIndex(index);
              },
            ),
            body: ConditionalBuilder(
              condition: true,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => const Text("fallback data"),
            )
          );
        },
      )

    );
  }
}
