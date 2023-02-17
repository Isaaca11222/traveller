import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:traveller/app/cubit/root_cubit.dart';
import 'package:traveller/app/features/LoginPage/login_page.dart';
import 'package:traveller/app/features/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traveller',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(137, 95, 94, 92),
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return const LoginPage();
          }
          return HomePagee(user: user);
        },
      ),
    );
  }
}
