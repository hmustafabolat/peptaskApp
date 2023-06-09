import 'package:get/get.dart';
import '../repository/auth_repository.dart';
import '../service/auth_service.dart';
import '../viewmodel/auth_viewmodel.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel(), fenix: true);
    Get.lazyPut(() => AuthRepository(), fenix: true);
    Get.lazyPut(() => AuthService(), fenix: true);
  }
}
