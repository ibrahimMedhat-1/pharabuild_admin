import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_admin/features/add_doctor/doctors_homepage/view/doctors_homepage.dart';

import '../../features/add_pharmacy/pharmacies_homepage/view/home_page.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int page = 0;
  List<Widget> pages = const [
    PharmaciesHomePage(),
    DoctorsHomePage(),
  ];
  void changePage(int page) {
    this.page = page;
    emit(ChangePageLayoutSuccessfully());
  }
}
