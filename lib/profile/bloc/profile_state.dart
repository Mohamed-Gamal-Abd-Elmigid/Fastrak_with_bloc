import 'package:test_bloc/profile/repo/profile_model.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class UserChangeEmailAddress extends ProfileState {}

class UserChangeMobileNumber extends ProfileState {}

class UserChangePasswordSuccessState extends ProfileState {}

class UserSaveChangesSucessState extends ProfileState {
  final User profile;
  UserSaveChangesSucessState(this.profile);
}

class ErrorChangeUserData extends ProfileState {
  final String message;
  ErrorChangeUserData(this.message);
}
