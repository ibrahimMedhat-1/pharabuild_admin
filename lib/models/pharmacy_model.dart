import 'category_model.dart';
import 'offers_model.dart';
import 'product_model.dart';
import 'review_model.dart';

class PharmacyModel {
  String? name;
  String? image;
  String? id;
  String? phoneNo;
  String? address;
  List<CategoryModel>? categories;
  List<ReviewModel>? reviews;
  List<ProductsModel>? products;
  List<OffersModel>? offers;

  PharmacyModel(
    this.name,
    this.image,
    this.id,
    this.phoneNo,
    this.address,
  );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'phoneNo': phoneNo,
        'address': address,
      };

  PharmacyModel.fromJson({
    Map<String, dynamic>? json,
    this.reviews,
    this.products,
    this.categories,
    this.offers,
  }) {
    name = json!['name'];
    phoneNo = json['phoneNo'];
    address = json['address'];
    image = json['image'];
    id = json['id'];
  }
}
