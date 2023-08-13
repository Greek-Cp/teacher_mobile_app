import 'package:get/get.dart';

import '../models/account/ModelAccount.dart';

class AccountUserController extends GetxController {
  final repository = RepositoryAccount();

  // final RxList<AccountUser> accountList = <AccountUser>[].obs;

  Future<void> addAccount(AccountUser account) async {
    await repository.addAccount(account);
  }

  Future<Map<String, dynamic>> loginAccount(
      String email, String password) async {
    repository.loadListAccountFromSharedPreferences();
    final user = repository.listAccountUser!.firstWhere(
      (element) => element.Email == email && element.Password == password,
    );

    if (user != null) {
      return {
        'statusLogin': true,
        'user': user,
      };
    } else {
      return {
        'statusLogin': false,
        'user': null,
      };
    }
  }
}
