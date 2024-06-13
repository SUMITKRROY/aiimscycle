import 'package:aiimscycle/bloc/admin/update_issue_req/update_issur_req_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../utils/dio_error_helper.dart';

part 'update_issue_req_state.dart';

class UpdateIssueReqCubit extends Cubit<UpdateIssueReqState> {
  UpdateIssueReqCubit() : super(UpdateIssueReqInitial());

  void updateIssueReq({required String id, required bool status}) async {
    emit(UpdateIssueReqLoading());
    try {
      final response = await CycleIssueUpdateRepo().updateIssueReq(id: id, status: status);

      if (response.statusCode == 200) {
        emit(UpdateIssueReqLoaded());
      } else {
        emit(UpdateIssueReqError(error: response.data['message']));
      }
    } on DioException catch (e) {
      emit(UpdateIssueReqError(error: handleDioError(e)));
    } catch (e) {
      emit(UpdateIssueReqError(error: 'Something Went Wrong'));
    }
  }
}
