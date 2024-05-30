import 'package:aiimscycle/bloc/withdraw-issue-request/withdraw_issue_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../dio_error_helper.dart';

part 'withdraw_issue_req_state.dart';

class WithdrawIssueReqCubit extends Cubit<WithdrawIssueReqState> {
  WithdrawIssueReqCubit() : super(WithdrawIssueReqInitial());

  withdrawCycle(String reqId) async {
    emit(WithdrawIssueReqLoading());
    try {
      final response = await WithdrawIssueReqRepo().withdrawIssueReq(reqId);

      if (response.statusCode == 200) {
        emit(WithdrawIssueReqLoaded());
      } else {
        emit(WithdrawIssueReqError(error: response.data['message']));
      }
    } on DioException catch (e) {
      emit(WithdrawIssueReqError(error: handleDioError(e)));
    } catch (e) {
      emit(WithdrawIssueReqError(error: 'Something Went Wrong'));
    }
  }
}
