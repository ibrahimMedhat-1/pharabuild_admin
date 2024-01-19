import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_admin/features/add_pharmacy/home_page/view/widget/home_page_search.dart';
import 'package:ip_admin/features/add_pharmacy/home_page/view/widget/pharmacy_widget.dart';
import 'package:ip_admin/features/add_pharmacy/home_page/view/widget/welcome_widget.dart';

import '../manager/home_page_cubit.dart';

class PharmaciesPage extends StatelessWidget {
  const PharmaciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..getAllPharmacies(),
      child: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: WelcomeWidget(
                  welcomeText: 'Welcome!',
                  textColor: Colors.white,
                ),
              ),
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.black87,
                expandedHeight: 80,
                collapsedHeight: 80,
                flexibleSpace: SearchWidget(
                  controller: cubit.searchPharmacyController,
                  search: () {
                    cubit.searchPharmacies(cubit.searchPharmacyController.text);
                  },
                  onChange: (value) {
                    if (value.isEmpty) {
                      cubit.isSearching(false);
                    } else {
                      cubit.isSearching(true);
                    }
                  },
                ),
              ),
              SliverToBoxAdapter(
                  child: (state is GetPharmacyLoading || state is PharmacySearchLoading)
                      ? const Center(child: CircularProgressIndicator())
                      : state is IsSearchingInMedicineInCategory
                          ? PharmaciesList(cubit.searchPharmacyList)
                          : PharmaciesList(cubit.pharmacies)),
            ],
          );
        },
      ),
    );
  }
}
