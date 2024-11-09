import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fut_app/apps/app/app_repository.dart';
import 'package:fut_app/apps/helper/router/router_schema.dart';
import 'package:fut_app/controllers/apit/apit_cubit.dart';
import 'package:fut_app/routes.dart';

class Verify extends StatelessWidget {
  const Verify({super.key, required this.data});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ApitCubit>(
          create: (BuildContext context) => ApitCubit(
                appRepository: context.read<AppRepository>(),
              ))
    ], child: VerifyView(data: data));
  }
}

class VerifyView extends StatelessWidget {
  const VerifyView({super.key, required this.data});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: context.read<ApitCubit>().verifyFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: context.read<ApitCubit>().verifyCodeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Code',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter received code';
                    }
                    // phone number validation logic
                    else if (!RegExp(r'^(\+?\d{1,2}\s?)?\d{10,13}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid code number';
                    }
                    return null;
                  },
                ),
                BlocConsumer<ApitCubit, ApitState>(
                  listener: (context, state) {
                    if (state.status == ApitStatus.error) {
                      SnackBar snackBar = SnackBar(
                        content: Text(state.message!),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (state.status == ApitStatus.success) {
                      Routes(context).navigate(route: SelectRoute.success);
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
                              .verifyFormKey
                              .currentState!
                              .validate()) {
                            context.read<ApitCubit>().verify(
                                data['contactInfo'] ?? '',
                                data['deviceName'] ?? '',
                                context
                                    .read<ApitCubit>()
                                    .verifyCodeController
                                    .text);
                          }
                        },
                        child: state.status == ApitStatus.initial ||
                                state.status == ApitStatus.error
                            ? const Text('Verify',
                                style: TextStyle(color: Colors.white))
                            : const CircularProgressIndicator(
                                color: Colors.white));
                  },
                ),
                Text(data['code_message'] ?? '')
              ],
            )));
  }
}
