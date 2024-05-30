import 'package:aiimscycle/bloc/get_issue_req/get_issue_req_modal.dart';
import 'package:aiimscycle/bloc/get_issue_req/get_issue_req_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../dio_error_helper.dart';

part 'get_issue_req_state.dart';

class GetIssueReqCubit extends Cubit<GetIssueReqState> {
  GetIssueReqCubit() : super(GetIssueReqInitial());

  getCycleDetail(String reqId) async {
    emit(GetIssueReqLoading());
    try {
      final response = await GetIssueReqRepo().getIssueReq(reqId);

      if (response.statusCode == 200) {
        // print(response.data);
        GetIssueReqModal getIssueReqModal = GetIssueReqModal.fromJson(response.data);
        print(response.data);
        emit(GetIssueReqLoaded(getIssueReqModal: getIssueReqModal));
      } else {
        emit(GetIssueReqError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(GetIssueReqError(error: handleDioError(e)));
    } catch (e) {
      emit(GetIssueReqError(error: 'Something Went Wrong'));
    }
  }
}
