import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_admin/features/authentication/view/widgets/auth_button.dart';
import 'package:ip_admin/features/authentication/view/widgets/custom_text_form.dart';

import '../../../shared/utils/images.dart';
import '../manager/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Color(0x4D090F13),
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(16),
                    left: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                "assets/logos/Home Build Construction Logo (8).png",
                                scale: 10,
                              ),
                              const SizedBox(width: 5,),
                              Text(
                                "PharaBuild Admin",
                                style: Theme.of(context).textTheme.titleLarge!,
                              )
                            ],
                          ),
                          CustomTextForm(
                            controller: cubit.emailAddressController,
                            obscure: false,
                            labelText: 'Email Address',
                            hintText: 'Enter your email here...',
                            keyboardType: TextInputType.emailAddress,
                            validationText: 'Please enter your email',
                          ),
                          CustomTextForm(
                            controller: cubit.passwordController,
                            obscure: cubit.obscure,
                            labelText: 'Password',
                            hintText: 'Enter your password here...',
                            suffixIcon: cubit.suffixIcon,
                            suffixPressed: cubit.suffixPressed,
                            keyboardType: TextInputType.visiblePassword,
                            validationText: 'Please enter your password',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    cubit.clearTextFormFields();
                                  },
                                  child: const Text('Forgot Password?'),
                                ),
                                state is LoginLoading
                                    ? const CircularProgressIndicator()
                                    : AuthButton(
                                        onTap: () {
                                          if (formKey.currentState!.validate()) {
                                            cubit.login(context);
                                          }
                                        },
                                        text: 'Login',
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
