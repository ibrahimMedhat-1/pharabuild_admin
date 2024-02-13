import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_admin/features/add_doctor/doctors_homepage/manager/doctor_list_cubit/doctor_list_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../models/doctor_model.dart';

class DoctorDetails extends StatelessWidget {
  final ContractorModel doctorModel;

  const DoctorDetails({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorListCubit(),
      child: BlocConsumer<DoctorListCubit, DoctorListState>(
        listener: (context, state) {},
        builder: (context, state) {
          final DoctorListCubit cubit = DoctorListCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SafeArea(child: TopImageWidget(tag: doctorModel.id!, image: doctorModel.image ?? '')),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctorModel.name!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          InkWell(
                            onTap: () async {
                              await launchUrl(Uri.parse('tel://${doctorModel.phoneNo}'));
                            },
                            child: Text(
                              doctorModel.phoneNo!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          // Text(
                          //   'Address',
                          //   style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                          // ),
                          // InkWell(
                          //   onTap: () async {
                          //     launchUrl(
                          //       Uri.parse(
                          //           'https://www.google.com/maps/search/?api=1&query=${doctorModel.address!['latitude']},${doctorModel.address!['longitude']}'),
                          //     );
                          //   },
                          //   child: Text(
                          //     doctorModel.address!['text'],
                          //     style: Theme.of(context).textTheme.bodyLarge,
                          //   ),
                          // ),
                          Text(
                            'Speciality',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                          ),
                          Text(
                            doctorModel.speciality!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          // Text(
                          //   'Bio',
                          //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          //         height: 2,
                          //       ),
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     showDialog(
                          //       context: context,
                          //       builder: (context) => Dialog(
                          //           child: Padding(
                          //         padding: const EdgeInsets.all(10),
                          //         child: Text(
                          //           doctorModel.bio!,
                          //           style: const TextStyle(
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //       )),
                          //     );
                          //   },
                          //   child: Container(
                          //     width: MediaQuery.sizeOf(context).width - 40,
                          //     margin: const EdgeInsets.all(10),
                          //     padding: const EdgeInsets.all(10),
                          //     clipBehavior: Clip.antiAlias,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(20),
                          //         color: Colors.white,
                          //         boxShadow: const [
                          //           BoxShadow(
                          //             color: Colors.grey,
                          //             offset: Offset(0, 0),
                          //             blurRadius: 3,
                          //           ),
                          //         ]),
                          //     child: Text(doctorModel.bio!),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      cubit.deleteDoctor(context, doctorId: doctorModel.id!);
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
          );
        },
      ),
    );
  }
}
