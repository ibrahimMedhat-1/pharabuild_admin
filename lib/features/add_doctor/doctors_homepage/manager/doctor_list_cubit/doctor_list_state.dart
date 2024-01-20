part of 'doctor_list_cubit.dart';

@immutable
abstract class DoctorListState {}

class DoctorListInitial extends DoctorListState {}

class ChangeDropDownMenuItemValue extends DoctorListState {}

class GetAllDoctorsLoading extends DoctorListState {}

class GetAllDoctorsSuccessfully extends DoctorListState {}

class GetAllDoctorsError extends DoctorListState {}

class GetDoctorBySpecialityLoading extends DoctorListState {}

class GetDoctorBySpecialitySuccessfully extends DoctorListState {}

class GetDoctorBySpecialityError extends DoctorListState {}

class IsSearchingInMedicineInCategory extends DoctorListState {}

class IsNotSearchingInMedicineInCategory extends DoctorListState {}

class DeleteDoctorSuccessfully extends DoctorListState {}

class DeleteDoctorLoading extends DoctorListState {}
