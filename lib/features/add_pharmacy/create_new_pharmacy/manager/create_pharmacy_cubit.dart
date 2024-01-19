import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ip_admin/models/pharmacy_model.dart';
import 'package:ip_admin/shared/utils/toasts.dart';

import '../../../../shared/custom_transitions/custom_transitions.dart';
import '../view/add_pharmacy_details.dart';

part 'create_pharmacy_state.dart';

class CreatePharmacyCubit extends Cubit<CreatePharmacyState> {
  CreatePharmacyCubit() : super(CreatePharmacyInitial());

  static CreatePharmacyCubit get(context) => BlocProvider.of(context);
  String? pharmacyId;
  String? imageLink;
  late final XFile? imageFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void registerPharmacy(context) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim())
        .then((value) {
      pharmacyId = value.user!.uid;
      FirebaseFirestore.instance
          .collection('pharmacies')
          .doc(value.user!.uid)
          .set({'id': value.user!.uid}).then((value) {
        Navigator.pushReplacement(
            context,
            NavigateSlideTransition(
              child: const AddPharmacyDetails(),
            ));
      });
    }).catchError((onError) {
      showToast(onError.message);
    });
  }

  void getPharmacyImage() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  void addPharmacyData() async {
    if (imageFile != null) {
      FirebaseStorage.instance.ref();
    }
    FirebaseFirestore.instance.collection('pharmacies').doc(pharmacyId).set(PharmacyModel(
          nameController.text,
          imageLink,
          pharmacyId,
          phoneController.text,
          addressController.text,
        ).toMap());
  }
}
