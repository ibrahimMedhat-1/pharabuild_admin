import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_admin/features/add_pharmacy/create_new_pharmacy/manager/create_pharmacy_cubit.dart';

class RegisterPharmacy extends StatelessWidget {
  const RegisterPharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePharmacyCubit, CreatePharmacyState>(
      listener: (context, state) {},
      builder: (context, state) {
        final CreatePharmacyCubit cubit = CreatePharmacyCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: const Text('Add Pharmacy')),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: cubit.emailController,
                  decoration: const InputDecoration(
                    label: Text('Pharmacy Email'),
                  ),
                ),
                TextFormField(
                  controller: cubit.passwordController,
                  decoration: const InputDecoration(
                    label: Text('Pharmacy Password'),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    cubit.registerPharmacy(context);
                  },
                  child: const Text('Register Pharmacy'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
