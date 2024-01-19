import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_admin/layout/manager/layout_cubit.dart';

import '../../shared/utils/icons.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final LayoutCubit cubit = LayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(toolbarHeight: 0),
            body: cubit.pages[cubit.page],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.page,
              onTap: (int page) {
                cubit.changePage(page);
              },
              items: const [
                BottomNavigationBarItem(
                  label: 'Pharmacies',
                  icon: ImageIcon(AssetImage(IconsAsset.pharmacyIcon)),
                ),
                BottomNavigationBarItem(
                  label: 'Doctors',
                  icon: ImageIcon(AssetImage(IconsAsset.doctorIcon)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
