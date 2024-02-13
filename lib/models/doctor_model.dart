class ContractorModel {
  String? id;
  String? name;
  String? phoneNo;
  String? speciality;
  String? lastMessage;

  ContractorModel(
    this.id,
    this.name,
    this.phoneNo,
    this.speciality,
  );
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'phoneNo': phoneNo,
        'speciality': speciality,
  };
  ContractorModel.fromJson(Map<String, dynamic>? json, {this.lastMessage}) {
    id = json!['id'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    speciality = json['speciality'];
  }
}
