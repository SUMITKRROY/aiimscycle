import 'package:aiimscycle/bloc/make_surrender_req/make_surrender_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../dio_error_helper.dart';

part 'make_surrender_req_state.dart';

class MakeSurrenderReqCubit extends Cubit<MakeSurrenderReqState> {
  MakeSurrenderReqCubit() : super(MakeSurrenderReqInitial());

  void makeSurrenderReq(String reqId) async {
    emit(MakeSurrenderReqLoading());
    try {
      final response = await MakeSurrenderRepo().makeSurrenderIssueRepo(reqId);

      if (response.statusCode == 200) {
        emit(MakeSurrenderReqLoaded());
      } else {
        emit(MakeSurrenderReqError(error: response.data['message']));
      }
    } on DioException catch (e) {
      emit(MakeSurrenderReqError(error: handleDioError(e)));
    } catch (e) {
      emit(MakeSurrenderReqError(error: 'Something Went Wrong'));
    }
  }
}
