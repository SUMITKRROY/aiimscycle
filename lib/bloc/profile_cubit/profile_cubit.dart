import 'package:aiimscycle/bloc/profile_cubit/profile_modal.dart';
import 'package:aiimscycle/bloc/profile_cubit/profilr_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../utils/dio_error_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void getProfile() async {
    emit(ProfileLoading());
    try {
      final response = await ProfileRepo().getProfileData();

      if (response.statusCode == 200) {
        User profileModal = User.fromJson(response.data['user']);
        var allRequestsJson = response.data['allRequest'] as List<dynamic>;
        final List<AllRequest> allReq = parseAllRequests(allRequestsJson);
        // print(allReq.last.status);

        emit(ProfileLoaded(profileModal: profileModal, allReq: allReq));
      } else {
        emit(ProfileError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(ProfileError(error: handleDioError(e)));
    } catch (e) {
      emit(ProfileError(error: 'Something Went Wrong'));
    }
  }

  List<AllRequest> parseAllRequests(List<dynamic> allRequestsJson) {
    return allRequestsJson.map((json) => AllRequest.fromJson(json)).toList();
  }
}
