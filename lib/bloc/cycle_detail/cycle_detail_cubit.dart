import 'package:aiimscycle/bloc/cycle_detail/cycle_detail_repo.dart';
import 'package:aiimscycle/view/user/cycle_detail_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../dio_error_helper.dart';
import 'cycle_detail_modal.dart';

part 'cycle_detail_state.dart';

class CycleDetailCubit extends Cubit<CycleDetailState> {
  CycleDetailCubit() : super(CycleDetailInitial());

  void getCycleDetail(String cycleId) async {
    emit(CycleDetailLoading());
    try {
      final response = await CycleRepo().getCycleDetail(cycleId);

      if (response.statusCode == 200) {
        CycleDetailModal cycleModal = CycleDetailModal.fromJson(response.data);
        emit(CycleDetailLoaded(cycleModal: cycleModal));
      } else {
        emit(CycleDetailError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(CycleDetailError(error: handleDioError(e)));
    } catch (e) {
      emit(CycleDetailError(error: 'Something Went Wrong'));
    }
  }
}
