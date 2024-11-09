import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fut_app/apps/app/app_repository.dart';
import 'package:fut_app/apps/helper/router/router_schema.dart';
import 'package:fut_app/controllers/apit/apit_cubit.dart';
import 'package:fut_app/routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ApitCubit>(
          create: (BuildContext context) => ApitCubit(
                appRepository: context.read<AppRepository>(),
              ))
    ], child: const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
          ),
          onPressed: () {
            Routes(context).navigate(route: SelectRoute.apit);
          },
          child: const Text('API test', style: TextStyle(color: Colors.white))),
      const SizedBox(
        width: 20.0,
      ),
      TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
          ),
          onPressed: () {
            Routes(context).navigate(route: SelectRoute.ui);
          },
          child: const Text('UI', style: TextStyle(color: Colors.white)))
    ]))));
  }
}
