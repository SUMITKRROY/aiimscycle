import 'package:aiimscycle/bloc/admin/admin_cycle_req/admin_cycle_req_modal.dart';
import 'package:aiimscycle/bloc/admin/admin_cycle_req/admin_cycle_req_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../utils/dio_error_helper.dart';

part 'admin_cycle_req_state.dart';

class AdminCycleReqCubit extends Cubit<AdminCycleReqState> {
  AdminCycleReqCubit() : super(AdminCycleReqInitial());

  void getAdminCycleReq() async {
    emit(AdminCycleReqLoading());
    try {
      final response = await AdminCycleReqRepo().getAdminIssueReq();

      if (response.statusCode == 200) {
        var cycleIssueInventoryModal = response.data['issue'] as List<dynamic>;
        var cycleSurrenderInventoryModal = response.data['surrender'] as List<dynamic>;
        final List<AdminIssueReqModal> allIssueReq = parseAllRequests(cycleIssueInventoryModal);
        final List<AdminIssueReqModal> allSurrenderReq =
            parseAllRequests(cycleSurrenderInventoryModal);

        emit(AdminCycleReqLoaded(
            adminIssueReqModal: allIssueReq, adminSurrenderReqModal: allSurrenderReq));
      } else {
        emit(AdminCycleReqError(error: response.data['message']));
      }
    } on DioException catch (e) {
      emit(AdminCycleReqError(error: handleDioError(e)));
    } catch (e) {
      emit(AdminCycleReqError(error: 'Something Went Wrong'));
    }
  }

  List<AdminIssueReqModal> parseAllRequests(List<dynamic> cycleInventoryModal) {
    return cycleInventoryModal.map((json) => AdminIssueReqModal.fromJson(json)).toList();
  }
}
