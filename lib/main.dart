import 'package:digio_train/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digio_train/features/ault/presentation/bloc/space_x_bloc.dart';
import 'features/ault/presentation/pages/home_page.dart';

void main() {
  initDI(); // <<< เรียก DI ก่อน runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SpaceXBloc>()..add(FetchAllDataEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
