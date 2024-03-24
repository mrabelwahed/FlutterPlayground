import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/screen/modules/news/block/AppCubit.dart';
import 'package:flutter_playground/screen/modules/news/block/AppStates.dart';
import 'package:flutter_playground/screen/shared/components/news.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder:(context, state) => articleBuilder(AppCubit.get(context).business, context));
  }
}
