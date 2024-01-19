import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_admin/features/add_pharmacy/pharmacy_details/view/widgets/pharmacy_details_widget/bottom_more_products.dart';
import 'package:ip_admin/features/add_pharmacy/pharmacy_details/view/widgets/pharmacy_details_widget/top_image.dart';
import 'package:ip_admin/features/add_pharmacy/pharmacy_details/view/widgets/pharmacy_products_widgets/product_item.dart';

import '../../../../models/product_model.dart';
import '../manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';
import '../manager/pharmacy_products_cubit/pharmacy_products_cubit.dart';

class ProductsDetails extends StatelessWidget {
  final String tag;
  final ProductsModel productsModel;

  const ProductsDetails({super.key, required this.tag, required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PharmacyProductsCubit>(
            create: (context) => PharmacyProductsCubit()..getSimilarProducts(productsModel)),
        BlocProvider<PharmacyDetailsCubit>(create: (context) => PharmacyDetailsCubit()),
      ],
      child: BlocConsumer<PharmacyDetailsCubit, PharmacyDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final PharmacyDetailsCubit detailsCubit = PharmacyDetailsCubit.get(context);
          return BlocConsumer<PharmacyProductsCubit, PharmacyProductsState>(
            listener: (context, state) {},
            builder: (context, state) {
              final PharmacyProductsCubit productsCubit = PharmacyProductsCubit.get(context);
              return Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TopImageWidget(tag: tag, image: productsModel.image!),
                                Text(
                                  productsModel.name!,
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        height: 2,
                                      ),
                                ),
                                Text(
                                  productsModel.description!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  'Similar Products',
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        height: 3,
                                      ),
                                ),
                                state is GetSimilarProductsLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : GridView.count(
                                        crossAxisCount: 2,
                                        shrinkWrap: true,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        physics: const NeverScrollableScrollPhysics(),
                                        children: productsCubit.similarProducts
                                            .asMap()
                                            .entries
                                            .map(
                                              (e) => ProductItem(
                                                tag: e.value.tag!,
                                                productImage: e.value.image!,
                                                productName: e.value.name!,
                                                productPrice: e.value.price!,
                                                productDescription: e.value.description!,
                                                onTap: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (builder) => ProductsDetails(
                                                        tag: e.value.tag!,
                                                        productsModel: e.value,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                            .toList(),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        BottomWidget(
                          text: '\$${productsModel.price}',
                          buttonText: detailsCubit.buttonName,
                          onTap: () {
                            if (detailsCubit.isInCart) {
                            } else {}
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
