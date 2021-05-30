abstract class ProfileEvent {}

class StartProfile extends ProfileEvent {}

class UploadPhoto extends ProfileEvent {}

// class EmailAddressChange extends ProfileEvent {
//   final String emailAddress;
//
//   EmailAddressChange(this.emailAddress);
// }

// class MobileNumberChange extends ProfileEvent {
//   final String mobileNumber;
//
//   MobileNumberChange(this.mobileNumber);
// }

// class ChangePassword extends ProfileEvent {
//   final String newPassword;
//
//   ChangePassword(this.newPassword);
// }

class SaveProfileChanges extends ProfileEvent {
  final String token;

  SaveProfileChanges(this.token);
}
