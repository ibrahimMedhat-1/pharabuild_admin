import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/add_pharmacy/home_page/view/home_page.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int page = 0;
  List<Widget> pages = const [
    PharmaciesPage(),
  ];
  void changePage(int page) {
    this.page = page;
    emit(ChangePageLayoutSuccessfully());
  }
}
