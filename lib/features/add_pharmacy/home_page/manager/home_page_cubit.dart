import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/pharmacy_model.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  static HomePageCubit get(context) => BlocProvider.of(context);
  List<PharmacyModel> pharmacies = [];
  List<PharmacyModel> searchPharmacyList = [];
  TextEditingController searchPharmacyController = TextEditingController();
  void getAllPharmacies() async {
    if (pharmacies.isEmpty) {
      emit(GetPharmacyLoading());
      FirebaseFirestore.instance.collection('pharmacies').snapshots().listen((value) async {
        pharmacies.clear();
        for (QueryDocumentSnapshot<Map<String, dynamic>> element in value.docs) {
          pharmacies.add(PharmacyModel.fromJson(
            json: element.data(),
          ));
        }
        emit(GetPharmacySuccessfully());
      });
    }
  }

  void searchPharmacies(String value) {
    searchPharmacyList = [];
    for (PharmacyModel pharmacy in pharmacies) {
      if (pharmacy.name!.toLowerCase().contains(value.toLowerCase())) {
        searchPharmacyList.add(pharmacy);
        emit(IsSearchingInMedicineInCategory());
      }
    }
  }

  void isSearching(bool isSearching) {
    if (isSearching) {
      emit(IsSearchingInMedicineInCategory());
    } else {
      searchPharmacyList = [];
      emit(IsNotSearchingInMedicineInCategory());
    }
  }
}
