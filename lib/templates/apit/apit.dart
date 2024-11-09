import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fut_app/apps/app/app_repository.dart';
import 'package:fut_app/apps/helper/router/router_schema.dart';
import 'package:fut_app/controllers/apit/apit_cubit.dart';
import 'package:fut_app/routes.dart';

class Apit extends StatelessWidget {
  const Apit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ApitCubit>(
          create: (BuildContext context) => ApitCubit(
                appRepository: context.read<AppRepository>(),
              ))
    ], child: const ApitView());
  }
}

class ApitView extends StatelessWidget {
  const ApitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
              key: context.read<ApitCubit>().loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: context.read<ApitCubit>().contactInfoController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      // phone number validation logic
                      else if (!RegExp(r'^(\+?\d{1,2}\s?)?\d{10,13}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: context.read<ApitCubit>().deviceNameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocConsumer<ApitCubit, ApitState>(
                    listener: (context, state) {
                      if (state.status == ApitStatus.error) {
                        SnackBar snackBar = SnackBar(
                          content: Text(state.message!),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      if (state.status == ApitStatus.success) {
                        Routes(context)
                            .navigate(route: SelectRoute.verify, argument: {
                          'code_message': state.data?.message ?? '',
                          'contactInfo': context
                              .read<ApitCubit>()
                              .contactInfoController
                              .text,
                          'deviceName': context
                              .read<ApitCubit>()
                              .deviceNameController
                              .text
                        });
                      }
                    },
                    builder: (context, state) {
                      return TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {
                            if (context
                                .read<ApitCubit>()
                                .loginFormKey
                                .currentState!
                                .validate()) {
                              context.read<ApitCubit>().login(
                                  context
                                      .read<ApitCubit>()
                                      .contactInfoController
                                      .text,
                                  context
                                      .read<ApitCubit>()
                                      .deviceNameController
                                      .text);
                            }
                          },
                          child: state.status == ApitStatus.initial ||
                                  state.status == ApitStatus.error
                              ? const Text('Login',
                                  style: TextStyle(color: Colors.white))
                              : const CircularProgressIndicator(
                                  color: Colors.white));
                    },
                  )
                ],
              ))),
    );
  }
}
