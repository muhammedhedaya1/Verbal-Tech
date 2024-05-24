class UserModel{
  static String collectionName='users';
  String? id;
  String? fullName;
  String? userName;
  String? email;

  UserModel({this.id, this.fullName, this.userName, this.email});


  UserModel.fromFireStore(Map<String,dynamic>? data){
    id= data?['id'];
    fullName =data?['fullName'];
    userName=data?['userName'];
    email=data?['email'];
  }
  Map<String,dynamic>toFireStore(){
    return {
      'id': id,
      'fullName' : fullName,
      'userName' : userName,
      'email' : email
    };
  }
}