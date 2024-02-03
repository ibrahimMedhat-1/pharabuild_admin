import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_admin/features/add_doctor/create_doctor/view/register_doctor.dart';
import 'package:ip_admin/features/add_doctor/doctors_homepage/view/widgets/doctor_widget.dart';
import 'package:ip_admin/features/add_pharmacy/pharmacies_homepage/view/widget/home_page_search.dart';

import '../manager/doctor_list_cubit/doctor_list_cubit.dart';

class DoctorsHomePage extends StatelessWidget {
  const DoctorsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorListCubit()..getAllDoctors(),
      child: BlocConsumer<DoctorListCubit, DoctorListState>(
        listener: (context, state) {},
        builder: (context, state) {
          final DoctorListCubit cubit = DoctorListCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Contractors',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 30,
                    ),
              ),
            ),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  flexibleSpace: SearchWidget(
                    addButtonOnPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => const RegisterDoctor()),
                      );
                    },
                    onChange: (value) {
                      if (value.isEmpty) {
                        cubit.isSearching(false);
                      } else {
                        cubit.isSearching(true);
                      }
                    },
                    controller: cubit.searchController,
                    search: () {
                      cubit.searchDoctors(cubit.searchController.text);
                    },
                  ),
                ),
                if (state is GetAllDoctorsLoading || state is GetDoctorBySpecialityLoading)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                else
                  SliverToBoxAdapter(
                    child: DoctorListWidget(
                        doctors: state is IsSearchingInMedicineInCategory ? cubit.searchDoctorList : cubit.doctorsList),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
