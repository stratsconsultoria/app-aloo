import 'dart:convert';

import '../app_routes.dart';
import 'package:get/get.dart';

import '../../data/infra/cache/cache.dart';
import '../../data/models/models.dart';
import '../../domain/entities/entities.dart';

class AuthController extends GetxController {
  @override
  Future<void> onInit() async {
    await getUser();
    super.onInit();
  }

  Rx<UserEntity> account = UserEntity(
    id: '',
    email: '',
    nome: '',
    permissao: '',
    master: '',
    empresa: '',
    pushId: '',
    expireAt: DateTime.now(),
  ).obs;

  Future<void> setAccount(UserEntity newUser) async {
    UserData accountModel = UserData(
      id: newUser.id,
      email: newUser.email,
      expireAt: newUser.expireAt,
      success: 1,
      jwt: '',
      nome: '',
      permissao: '',
      master: '',
      empresa: '',
      pushId: '',
    );
    account.value = newUser;
    await CacheAdapter().writeStorage(
      CacheString.userKey,
      jsonEncode(accountModel.toJson()),
    );
  }

  Future<void> logout() async {
    await CacheAdapter().clear();
    Get.toNamed(Routes.initial);
  }

  Future<void> getUser() async {
    String? accountJson = await CacheAdapter().read(CacheString.userKey);
    if (accountJson != null) {
      UserData modelAccount = UserData.fromJson(json.decode(accountJson));
      account.value = modelAccount.toEntity();
    }
  }

  RxInt homeIndex = 0.obs;

  void setHomeIndex(int index) {
    homeIndex.value = index;
  }
}
