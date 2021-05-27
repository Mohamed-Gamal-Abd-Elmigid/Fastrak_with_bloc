// // To parse this JSON data, do
// //
// //     final user = userFromJson(jsonString);
//
// import 'dart:convert';
//
// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());
//
// class User {
//   User({
//     required this.data,
//   });
//
//   Data data;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     // data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     data: json['data'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data == null ? null : data.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.companyName,
//     this.phone,
//     this.email,
//     this.socialType,
//     this.socialId,
//     this.type,
//     this.isBusiness,
//     this.hasPassword,
//     this.activationStatus,
//     this.accessToken,
//     this.hasNotification,
//     this.profilePicture,
//     this.bankAccount,
//   });
//
//   String id;
//   String firstName;
//   String lastName;
//   dynamic companyName;
//   String phone;
//   String email;
//   dynamic socialType;
//   dynamic socialId;
//   int type;
//   int isBusiness;
//   bool hasPassword;
//   int activationStatus;
//   String accessToken;
//   bool hasNotification;
//   ProfilePicture profilePicture;
//   dynamic bankAccount;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"] == null ? null : json["id"],
//     firstName: json["first_name"] == null ? null : json["first_name"],
//     lastName: json["last_name"] == null ? null : json["last_name"],
//     companyName: json["company_name"],
//     phone: json["phone"] == null ? null : json["phone"],
//     email: json["email"] == null ? null : json["email"],
//     socialType: json["social_type"],
//     socialId: json["social_id"],
//     type: json["type"] == null ? null : json["type"],
//     isBusiness: json["is_business"] == null ? null : json["is_business"],
//     hasPassword: json["has_password"] == null ? null : json["has_password"],
//     activationStatus: json["activation_status"] == null ? null : json["activation_status"],
//     accessToken: json["access_token"] == null ? null : json["access_token"],
//     hasNotification: json["has_notification"] == null ? null : json["has_notification"],
//     profilePicture: json["profile_picture"] == null ? null : ProfilePicture.fromJson(json["profile_picture"]),
//     bankAccount: json["bank_account"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "first_name": firstName == null ? null : firstName,
//     "last_name": lastName == null ? null : lastName,
//     "company_name": companyName,
//     "phone": phone == null ? null : phone,
//     "email": email == null ? null : email,
//     "social_type": socialType,
//     "social_id": socialId,
//     "type": type == null ? null : type,
//     "is_business": isBusiness == null ? null : isBusiness,
//     "has_password": hasPassword == null ? null : hasPassword,
//     "activation_status": activationStatus == null ? null : activationStatus,
//     "access_token": accessToken == null ? null : accessToken,
//     "has_notification": hasNotification == null ? null : hasNotification,
//     "profile_picture": profilePicture == null ? null : profilePicture.toJson(),
//     "bank_account": bankAccount,
//   };
// }
//
// class ProfilePicture {
//   ProfilePicture({
//     this.id,
//     this.path,
//     this.pathThumbnail,
//     this.mimeType,
//     this.customProperties,
//   });
//
//   int id;
//   String path;
//   String pathThumbnail;
//   String mimeType;
//   List<dynamic> customProperties;
//
//   factory ProfilePicture.fromJson(Map<String, dynamic> json) => ProfilePicture(
//     id: json["id"] == null ? null : json["id"],
//     path: json["path"] == null ? null : json["path"],
//     pathThumbnail: json["path_thumbnail"] == null ? null : json["path_thumbnail"],
//     mimeType: json["mime_type"] == null ? null : json["mime_type"],
//     customProperties: json["custom_properties"] == null ? null : List<dynamic>.from(json["custom_properties"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "path": path == null ? null : path,
//     "path_thumbnail": pathThumbnail == null ? null : pathThumbnail,
//     "mime_type": mimeType == null ? null : mimeType,
//     "custom_properties": customProperties == null ? null : List<dynamic>.from(customProperties.map((x) => x)),
//   };
// }
