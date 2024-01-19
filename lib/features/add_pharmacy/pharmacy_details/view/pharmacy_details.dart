import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/pharmacy_model.dart';
import '../manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';
import 'widgets/pharmacy_details_widget/top_image.dart';

class PharmacyDetails extends StatelessWidget {
  final PharmacyModel pharmacyModel;

  const PharmacyDetails({
    super.key,
    required this.pharmacyModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PharmacyDetailsCubit(),
      child: BlocConsumer<PharmacyDetailsCubit, PharmacyDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final PharmacyDetailsCubit cubit = PharmacyDetailsCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopImageWidget(tag: pharmacyModel.id!, image: pharmacyModel.image ?? ''),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            pharmacyModel.name!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          InkWell(
                              onTap: () {
                                cubit.callPharmacy(pharmacyModel.phoneNo!);
                              },
                              child: Text(
                                pharmacyModel.phoneNo!,
                                style: Theme.of(context).textTheme.bodyLarge,
                              )),
                          MaterialButton(
                            onPressed: () {
                              cubit.deletePharmacy(context, pharmacyId: pharmacyModel.id!);
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
