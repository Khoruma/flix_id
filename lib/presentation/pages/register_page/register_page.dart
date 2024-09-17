import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../extensions/build_context_extension.dart';
import '../../misc/methods.dart';
import '../../providers/router/router_provider.dart';
import '../../providers/user_data/user_data_provider.dart';
import '../../widgets/flix_text_field.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reTypePasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed('main');
          }
        } else if (next is AsyncError) {
          context.showSnackBar(next.error.toString());
        }
      },
    );
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              verticalSpaces(50),
              Center(
                child: Image.asset(
                  'assets/flix_logo.png',
                  width: 150,
                ),
              ),
              verticalSpaces(24),
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.add_a_photo,
                  size: 50,
                ),
              ),
              verticalSpaces(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    FlixTextField(
                      labelText: 'Name',
                      controller: nameController,
                      obscureText: false,
                    ),
                    verticalSpaces(24),
                    FlixTextField(
                      labelText: 'Email',
                      controller: emailController,
                      obscureText: false,
                    ),
                    verticalSpaces(24),
                    FlixTextField(
                      labelText: 'Password',
                      controller: passwordController,
                      obscureText: true,
                    ),
                    verticalSpaces(24),
                    FlixTextField(
                      labelText: 'Re-enter Password',
                      controller: reTypePasswordController,
                      obscureText: true,
                    ),
                    verticalSpaces(24),
                    switch (ref.watch(userDataProvider)) {
                      AsyncData(:final value) => value == null
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (passwordController.text ==
                                      reTypePasswordController.text) {
                                    ref
                                        .read(userDataProvider.notifier)
                                        .register(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text);
                                  } else {
                                    context.showSnackBar(
                                        'Password does not match');
                                  }
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      _ => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    },
                    verticalSpaces(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            ref.read(routerProvider).goNamed(
                                  'login',
                                );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
