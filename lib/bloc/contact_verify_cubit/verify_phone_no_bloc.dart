import 'dart:convert';
import 'package:aiimscycle/bloc/contact_verify_cubit/verify_phone_no_repo.dart';
import 'package:aiimscycle/config/api_route.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import '../../utils/dio_helper.dart'; // Add Dio for API requests

part 'verify_phone_no_event.dart';
part 'verify_phone_no_state.dart';

class VerifyPhoneNoBloc extends Bloc<VerifyPhoneNoEvent, VerifyPhoneNoState> {
  VerifyPhoneNoBloc() : super(VerifyPhoneNoInitial()) {
    on<VerifyPhoneNumberEvent>(_onVerifyPhoneNumber);
  }

  // Event handler for verifying phone number
  Future<void> _onVerifyPhoneNumber(
      VerifyPhoneNumberEvent event, Emitter<VerifyPhoneNoState> emit) async {
    emit(VerifyPhoneNoLoading());

// print ("data ${data}");
    try {
      final response = await VerifyPhoneNoReqRepo().verifyPhoneNoReqRepo ( contact: event.phoneNumber, employeeCode: event.userId);

      // Handle the response
      if (response.statusCode == 200) {
        emit(VerifyPhoneNoSuccess(message: 'Verification successful'));
      } else {
        emit(VerifyPhoneNoError(error: 'Failed to verify phone number'));
      }
    } catch (e) {
      // Handle any exceptions
      emit(VerifyPhoneNoError(error: e.toString()));
    }
  }
}
