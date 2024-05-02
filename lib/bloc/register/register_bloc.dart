
import 'dart:developer';
import 'package:aiimscycle/configuration.dart';
import 'package:aiimscycle/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  Configuration config;
  RegisterBloc({required this.config}) : super(RegisterInitial()) {
    on<RegisterSuccessEvent>((event, emit) async {
      String fName = event.fName;
      String employee = event.employee;
      String contact = event.contact;
      String idFront = event.idFront;
      String idBack = event.idBack;
      String profile = event.profile;
      String password = event.password;
      String md5password = Utils.convertToMD5(password);
      String base64idFront = Utils.convertToBase64(idFront);
      String base64idBack = Utils.convertToBase64(idBack);
      String base64profile = Utils.convertToBase64(profile);
      log("base 64 $base64profile");
      log("base 64 $base64idFront");
      log("base 64 $base64idBack");
      emit(RegisterLoading());
      var response = await config.api.register(fName, employee, contact,
          base64idFront, base64idBack, base64profile, password);

      if (response is bool) {
        // emit success
        emit(RegisterSuccess());
      } else {
        // response is string
        // typecast response in string
        var resmsg = response as String;
        // emit failure
        emit(RegisterError(resmsg));
      }
    });
  }
}
