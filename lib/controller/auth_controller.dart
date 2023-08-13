import 'package:get/get.dart';
import 'package:teacher_mobile_app/models/account/ModelAccount.dart';

class AuthController extends GetxController {
  void register(
      String firstName, String lastName, String emailAddress, String password) {
    ModelProfileUser modelProfileUser = ModelProfileUser();

    AccountUser accountUser = AccountUser(
        FirstName: firstName,
        LastName: lastName,
        Email: emailAddress,
        Password: password,
        detailUser: modelProfileUser);
  }
}
