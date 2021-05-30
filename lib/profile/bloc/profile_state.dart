abstract class ProfileState {
  const ProfileState();
}

class ProfileInititState extends ProfileState {}

// class ProfileLoadingState extends ProfileState {}

// class UserChangePasswordSuccessState extends ProfileState {}

class UserSaveChangesSucessState extends ProfileState {}

class ErrorChangeUserData extends ProfileState {
  final String message;

  ErrorChangeUserData(this.message);
}
