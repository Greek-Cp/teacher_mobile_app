import 'package:get/get.dart';
import 'package:teacher_mobile_app/controller/account_user_controller.dart';
import 'package:teacher_mobile_app/models/account/ModelAccount.dart';

class AuthController extends GetxController {
  final AccountUserController _accoutUseController =
      Get.find<AccountUserController>();

  void register(
      String firstName, String lastName, String emailAddress, String password) {
    ModelProfileUser modelProfileUser = ModelProfileUser();

    AccountUser accountUser = AccountUser(
        FirstName: firstName,
        LastName: lastName,
        Email: emailAddress,
        Password: password,
        detailUser: modelProfileUser);
    _accoutUseController.addAccount(accountUser);
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    return await _accoutUseController.loginAccount(email, password);
  }
}
