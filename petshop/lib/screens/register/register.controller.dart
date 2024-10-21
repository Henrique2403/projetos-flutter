import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../datasource/preference.datasource.dart';

class RegisterController extends GetxController {
  final Rx<String> _name = Rx("");
  final Rx<String> _email = Rx("");
  final Rx<String> _password = Rx("");
  final Rx<String?> message = Rx("");
  final Rx<bool> registered = Rx(false);
  late PreferenceDataSource _preference;

  RegisterController(){
    initRegister();
  }

  initRegister() async {
    _preference = PreferenceDataSource();
    await _preference.initPreference();
  }
  Rx<String> get name => _name;

  Rx<String> get email => _email;

  Rx<String> get password => _password;

  save(String name, String email, String password){
    bool isValid = true;

    if(name.isEmpty){
      isValid = false;
      message.value = "O nome está vazio";
    }

    if(name.isEmpty){
      isValid = false;
      message.value = "O nome está vazio";
    }

    if(name.isEmpty){
      isValid = false;
      message.value = "O nome está vazio";
    }

    if(isValid) {
      _preference.save("name", name);
      _preference.save("email", email);
      _preference.save("password", password);
      registered.value = true;
    }
  }

}