import 'package:flutter/material.dart';

import '../../../../../../models/doctor_model.dart';
import '../doctor_details.dart';

class DoctorListWidget extends StatelessWidget {
  final List<ContractorModel> doctors;

  const DoctorListWidget({required this.doctors, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => DoctorDetails(
                doctorModel: doctors[index],
              ),
            ),
          );
        },
        child: Hero(
          tag: doctors[index].id!,
          child: AspectRatio(
            aspectRatio: 2.1 / 1.18,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctors[index].name ?? '',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
                    ),
                    Text(
                      doctors[index].phoneNo ?? '',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 2),
                    ),
                    Text(
                      doctors[index].speciality ?? '',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(height: 3),
                    ),
                    // Expanded(
                    //   child: CachedNetworkImage(
                    //     fit: BoxFit.fill,
                    //     width: double.infinity,
                    //     imageUrl: doctors[index].image ?? '',
                    //     errorWidget: (context, url, error) => const Icon(
                    //       Icons.error,
                    //       color: Colors.red,
                    //     ),
                    //     placeholder: (context, url) => const Center(
                    //       child: CircularProgressIndicator(),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      itemCount: doctors.length,
    );
  }
}
