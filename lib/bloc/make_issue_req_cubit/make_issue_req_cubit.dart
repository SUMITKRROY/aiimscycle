import 'package:aiimscycle/bloc/make_issue_req_cubit/make_Issue_req_modal.dart';
import 'package:aiimscycle/bloc/make_issue_req_cubit/make_Issue_req_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../dio_error_helper.dart';
import '../cycle_detail/cycle_detail_modal.dart';

part 'make_issue_req_state.dart';

class MakeIssueReqCubit extends Cubit<MakeIssueReqState> {
  MakeIssueReqCubit() : super(MakeIssueReqInitial());

  void makeIssueReq({required CycleDetailModal cycleDetailModal}) async {
    emit(MakeIssueReqLoading());
    try {
      final response = await MakeIssueReqRepo().makeIssueReq(cycleDetailModal: cycleDetailModal);

      if (response.statusCode == 200) {
        MakeIssueReqModal makeIssueReqModal = MakeIssueReqModal.fromJson(response.data);
        emit(MakeIssueReqLoaded(makeIssueReqModal: makeIssueReqModal));
      } else {
        emit(MakeIssueReqError(error: response.data['message']));
      }
    } on DioException catch (e) {
      emit(MakeIssueReqError(error: handleDioError(e)));
    } catch (e) {
      emit(MakeIssueReqError(error: 'Something Went Wrong'));
    }
  }
}
