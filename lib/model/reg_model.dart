class RegistartinModel {
  String name;
  String email;
  String age;
  String phoneNumber;
  String password;
  String image;
  String uid;
  RegistartinModel(
      {required this.age,
      required this.email,
      required this.image,
      required this.name,
      required this.password,
      required this.phoneNumber,
      required this.uid});

  factory RegistartinModel.fromJson(Map<String, dynamic> json) {
    return RegistartinModel(
        age: json["age"],
        email: json["email"],
        image: json["image"],
        name: json["name"],
        password: json["password"],
        phoneNumber: json["phonenumber"],
        uid: json["id"]);
  }
}