import 'dart:async';
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
     // String md5password = Utils.convertToMD5(password);
emit(RegisterLoading());
  var response = await  config.api.register(fName, employee, contact, idFront, idBack, profile, password);

      if(response is bool){
        // response is bool
        // emit success
emit(RegisterSuccess());
      }else{
        // response is string
        // typecast response in string
        var resmsg = response as String;
        // emit failure
emit(RegisterError(resmsg));
      }

    });
  }
}
