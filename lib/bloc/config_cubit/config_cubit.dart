import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';
import '../../configuration.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit({required this.configuration}) : super(ConfigInitial()) {
    startTheConfig();
    printUrl();
  }

  final Configuration configuration;

  ConfigCubit get(context) => ConfigCubit(configuration: configuration);

  final String? myUrl = dotenv.env["myUrl"];
  final String? version = dotenv.env["version"];

  // Getter method to access the Configuration object
  Configuration get config => configuration;

  // Example method using the configuration
  void startTheConfig() {
    print(config.verboseflag);
    emit(ConfigLoadedState(check: config.verboseflag, version: version));
  }

  void printUrl() {
    print(myUrl);
  }
}
