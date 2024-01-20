import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../layout/view/layout_view.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscure = true;
  IconData suffixIcon = Icons.visibility_off;

  void login(BuildContext context) {
    emit(LoginLoading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddressController.text.trim(), password: passwordController.text)
        .then((value) {
      FirebaseFirestore.instance.collection('admin').doc(value.user!.uid).get().then((value) {
        if (value.data()!['type'] == 'admin') {
          emit(LoginSuccessfully());
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => const Layout()));
        } else {
          emit(LoginError());
          Fluttertoast.showToast(msg: 'No Authorization');
        }
      }).catchError((onError) {
        emit(LoginError());
        Fluttertoast.showToast(msg: onError.message.toString());
      });
    }).catchError((onError) {
      emit(LoginError());
      Fluttertoast.showToast(msg: onError.message.toString());
    });
  }

  void suffixPressed() {
    obscure = !obscure;
    if (obscure) {
      suffixIcon = Icons.visibility_off;
      emit(ChangeObscure());
    } else {
      suffixIcon = Icons.visibility;
      emit(ChangeObscure());
    }
  }

  void clearTextFormFields() {
    emailAddressController.clear();
    passwordController.clear();
    emit(ClearAllTextFormFields());
  }
}
