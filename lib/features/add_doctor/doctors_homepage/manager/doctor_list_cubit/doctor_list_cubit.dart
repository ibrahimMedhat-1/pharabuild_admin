import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../models/doctor_model.dart';
import '../../../../../../shared/utils/toasts.dart';

part 'doctor_list_state.dart';

class DoctorListCubit extends Cubit<DoctorListState> {
  DoctorListCubit() : super(DoctorListInitial());

  static DoctorListCubit get(context) => BlocProvider.of(context);
  String? dropDownMenuItemValue;
  TextEditingController searchController = TextEditingController();
  List<DoctorModel> doctorsList = [];
  List<DoctorModel> searchDoctorList = [];

  void changeDropDownItem(value) {
    doctorsList.clear();
    dropDownMenuItemValue = value;
    emit(ChangeDropDownMenuItemValue());
    emit(GetDoctorBySpecialityLoading());
    if (value != 'All') {
      FirebaseFirestore.instance.collection('doctors').where('speciality', isEqualTo: value).get().then((value) {
        for (var element in value.docs) {
          doctorsList.add(DoctorModel.fromJson(element.data()));
        }
        emit(GetDoctorBySpecialitySuccessfully());
      }).catchError((onError) {
        emit(GetDoctorBySpecialityError());
        showToast(onError.message);
      });
    } else {
      FirebaseFirestore.instance.collection('doctors').get().then((value) {
        for (var element in value.docs) {
          doctorsList.add(DoctorModel.fromJson(element.data()));
        }
        emit(GetDoctorBySpecialitySuccessfully());
      }).catchError((onError) {
        emit(GetDoctorBySpecialityError());
        showToast(onError.message);
      });
    }
  }

  void getAllDoctors() {
    emit(GetAllDoctorsLoading());
    FirebaseFirestore.instance.collection('doctors').snapshots().listen((value) {
      doctorsList.clear();
      for (var element in value.docs) {
        doctorsList.add(DoctorModel.fromJson(element.data()));
      }
      emit(GetAllDoctorsSuccessfully());
    });
  }

  void searchDoctors(String value) {
    searchDoctorList = [];
    for (DoctorModel pharmacy in doctorsList) {
      if (pharmacy.name!.toLowerCase().contains(value.toLowerCase())) {
        searchDoctorList.add(pharmacy);
        emit(IsSearchingInMedicineInCategory());
      }
    }
  }

  void isSearching(bool isSearching) {
    if (isSearching) {
      emit(IsSearchingInMedicineInCategory());
    } else {
      searchDoctorList = [];
      emit(IsNotSearchingInMedicineInCategory());
    }
  }

  void deleteDoctor(context, {required String doctorId}) async {
    emit(DeleteDoctorLoading());
    await FirebaseFirestore.instance.collection('doctors').doc(doctorId).delete();
    FirebaseStorage.instance.ref().child('pharmacies/$doctorId').getDownloadURL().then((value) async {
      FirebaseStorage.instance.ref().child('pharmacies/$doctorId').delete();
    });
    emit(DeleteDoctorSuccessfully());
    Navigator.pop(context);
  }
}
