import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/login/bloc/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/profile/bloc/profile_event.dart';
import 'package:test_bloc/profile/bloc/profile_state.dart';
import 'package:test_bloc/profile/repo/profile_repo.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepo repo;
  String token;
  ProfileBloc(ProfileState ProfileInitalState, this.repo)
      : super(ProfileInitalState);

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    if (event is StartProfile) {
      yield ProfileInititState();
    } else if (event is SaveProfileChanges) {
      yield UserSaveChangesSucessState();
      var data = await repo.profile(token);
      print(data);
      yield UserSaveChangesSucessState();
    } else
      yield ErrorChangeUserData("Save Changes Error");
  }
}
