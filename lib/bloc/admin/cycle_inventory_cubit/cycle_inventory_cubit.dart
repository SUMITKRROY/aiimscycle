import 'package:aiimscycle/bloc/admin/cycle_inventory_cubit/cycle_inv_repo.dart';
import 'package:aiimscycle/bloc/admin/cycle_inventory_cubit/cycle_inventory_modal.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../utils/dio_error_helper.dart';

part 'cycle_inventory_state.dart';

class CycleInventoryCubit extends Cubit<CycleInventoryState> {
  CycleInventoryCubit() : super(CycleInventoryInitial());

  void getCycleInv() async {
    emit(CycleInventoryLoading());
    try {
      final response = await CycleInvRepo().getCycleInv();

      if (response.statusCode == 200) {
        var cycleInventoryModal = response.data as List<dynamic>;
        final List<CycleInventoryModal> allReq = parseAllRequests(cycleInventoryModal);

        emit(CycleInventoryLoaded(cycleInventoryModal: allReq));
      } else {
        emit(CycleInventoryError(error: response.data['message']));
      }
    } on DioException catch (e) {
      emit(CycleInventoryError(error: handleDioError(e)));
    } catch (e) {
      emit(CycleInventoryError(error: 'Something Went Wrong'));
    }
  }

  List<CycleInventoryModal> parseAllRequests(List<dynamic> cycleInventoryModal) {
    return cycleInventoryModal.map((json) => CycleInventoryModal.fromJson(json)).toList();
  }
}
