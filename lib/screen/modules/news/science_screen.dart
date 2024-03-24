import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/news.dart';
import 'block/AppCubit.dart';
import 'block/AppStates.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder:(context, state) => articleBuilder(AppCubit.get(context).science, context)
    );
  }
}
