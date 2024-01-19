part of 'home_page_cubit.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class GetPharmacySuccessfully extends HomePageState {}

class GetPharmacyLoading extends HomePageState {}

class GetPharmacyError extends HomePageState {}

class PharmacySearchLoading extends HomePageState {}

class PharmacySearchDone extends HomePageState {}

class IsSearchingInMedicineInCategory extends HomePageState {}

class IsNotSearchingInMedicineInCategory extends HomePageState {}
