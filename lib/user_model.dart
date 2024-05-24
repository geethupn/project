class UserModel
{
  String firstname;
  String lastname;
  String phone;
  String? id;

  UserModel({
     required this.firstname,
     required this.lastname,
     required this.phone,
     this.id
  });

  get contacts => null;

  Map<String,dynamic> data(docId)=>
  {
    "first_name":firstname,"last_name":lastname,"phone":phone,"id":docId
  };

  factory UserModel.fromData(Map<String,dynamic> i)
  {
    return UserModel(
      firstname: i["first_name"], 
      lastname: i["last_name"], 
      phone: i["phone"]);
  }

}