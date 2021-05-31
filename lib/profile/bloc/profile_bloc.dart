import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/profile/bloc/profile_event.dart';
import 'package:test_bloc/profile/bloc/profile_state.dart';
import 'package:test_bloc/profile/repo/profile_model.dart';
import 'package:test_bloc/profile/repo/profile_repo.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepo repo = ProfileRepo();
  String token;

  ProfileBloc(ProfileState initialState, this.repo) : super(initialState);

  static ProfileBloc get(BuildContext context) => BlocProvider.of(context);
  User result;

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    // TODO: implement mapEventToState

    if (event is StartProfile) {
      yield ProfileInitialState();
    } else if (event is EmailAddressChange) {
      yield UserChangeEmailAddress();
    } else if (event is MobileNumberChange) {
      yield UserChangeMobileNumber();
    } else if (event is ChangePassword) {
      yield UserChangePasswordSuccessState();
    } else if (event is SaveProfileChanges) {
      // await usersaveChanges(token);
      // yield result = usersaveChanges(event.token);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString('token');
      final data = await repo.getProfileData(token);
      yield UserSaveChangesSucessState(data);
    } else if (event is ErrorSaveChanges) {
      String message;
      yield ErrorChangeUserData(message);
    }
    //throw UnimplementedError();
  }

  usersaveChanges(String token) async {
    print('Hello Save');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    User data = await repo.getProfileData(token);
    print(data.email);
    return data;
    // print(data.phone);
  }
}
