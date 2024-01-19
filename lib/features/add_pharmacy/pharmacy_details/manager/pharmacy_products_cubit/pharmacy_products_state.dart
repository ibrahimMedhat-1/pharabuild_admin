part of 'pharmacy_products_cubit.dart';

@immutable
abstract class PharmacyProductsState {}

class PharmacyProductsInitial extends PharmacyProductsState {}

class ChangeDropDownMenuItemValue extends PharmacyProductsState {}

class GetSimilarProductsLoading extends PharmacyProductsState {}

class GetSimilarProductsSuccessfully extends PharmacyProductsState {}

class GetSimilarProductsError extends PharmacyProductsState {}

class CategoryFilterInAllProductsLoading extends PharmacyProductsState {}

class CategoryFilterInAllProductsSuccessfully extends PharmacyProductsState {}

class CategoryFilterInAllProductsError extends PharmacyProductsState {}

class ShowAllProducts extends PharmacyProductsState {}

class IsSearchingInMedicineInCategory extends PharmacyProductsState {}

class IsNotSearchingInMedicineInCategory extends PharmacyProductsState {}
