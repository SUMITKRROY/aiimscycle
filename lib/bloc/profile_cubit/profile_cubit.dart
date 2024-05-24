import 'package:aiimscycle/bloc/profile_cubit/profile_modal.dart';
import 'package:aiimscycle/bloc/profile_cubit/profilr_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../dio_error_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void getProfile() async {
    emit(ProfileLoading());
    try {
      final response = await ProfileRepo().getProfileData();

      if (response.statusCode == 200) {
        User profileModal = User.fromJson(response.data['user']);
        emit(ProfileLoaded(profileModal: profileModal));
      } else {
        emit(ProfileError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(ProfileError(error: handleDioError(e)));
    } catch (e) {
      emit(ProfileError(error: 'Something Went Wrong'));
    }
  }
}
