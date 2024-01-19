import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../models/pharmacy_model.dart';
import '../../../pharmacy_details/view/pharmacy_details.dart';

class PharmaciesList extends StatelessWidget {
  final List<PharmacyModel> pharmacies;
  PharmacyModel pharmacy(index) => pharmacies[index];
  const PharmaciesList(this.pharmacies, {super.key});

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
                builder: (builder) => PharmacyDetails(
                      pharmacyModel: pharmacy(index),
                    )),
          );
        },
        child: Hero(
          tag: pharmacy(index).id!,
          child: AspectRatio(
            aspectRatio: 1 / 1.1,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: pharmacy(index).image ?? '',
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pharmacy(index).name!,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 2),
                        ),
                        Text(
                          pharmacy(index).phoneNo!,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 2),
                        ),
                        Text(
                          pharmacy(index).address!,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(height: 3),
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
      itemCount: pharmacies.length,
    );
  }
}
