import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'pharmacy_details_state.dart';

class PharmacyDetailsCubit extends Cubit<PharmacyDetailsState> {
  PharmacyDetailsCubit() : super(PharmacyDetailsInitial());

  static PharmacyDetailsCubit get(context) => BlocProvider.of(context);
  String buttonName = 'Add To Cart';
  bool isInCart = false;
  void deletePharmacy(context, {required String pharmacyId}) async {
    await FirebaseFirestore.instance.collection('pharmacies').doc(pharmacyId).delete();
    FirebaseStorage.instance.ref().child('pharmacies/$pharmacyId').getDownloadURL().then((value) async {
      FirebaseStorage.instance.ref().child('pharmacies/$pharmacyId').delete();
    });
    emit(DeletePharmacySuccessfully());
    Navigator.pop(context);
  }

  void callPharmacy(String phoneNo) async {
    await launchUrl(Uri.parse('tel://$phoneNo'));
  }
}
