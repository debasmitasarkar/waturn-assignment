import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walturn/presentation/pages/login/login_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late LoginController controller;
  @override
  void initState() {
    super.initState();
    controller = ref.read(loginControllerProvider);
  }

  Widget _initialWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                controller.authenticate(
                    emailController.text, passwordController.text);
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Consumer(builder: (context, ref, child) {
        LoginScreenState screenState = ref.watch(loginScreenStateProvider);
        switch (screenState) {
          case LoginScreenState.initial:
            return _initialWidget();
          case LoginScreenState.loading:
            return const Center(child: CircularProgressIndicator());
          case LoginScreenState.error:
            return const Center(child: Text('Error'));
          case LoginScreenState.success:
            return const Center(child: Text('Success'));
          default:
            return _initialWidget();
        }
      }),
    );
  }
}
