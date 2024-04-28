import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:threads_clone/routes/route_names.dart';
import 'package:threads_clone/services/supbase_services.dart';
import 'package:threads_clone/utils/helper.dart';
import 'package:threads_clone/utils/storage/storage.dart';
import 'package:threads_clone/utils/storage/storage_keys.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      final authRes = await SupabaseServices.client.auth.signUp(
        email: email,
        password: password,
        data: {"name": name},
      );

      if (authRes.user != null) {
        Storage.session
            .write(Storagekeys.userSession, authRes.session!.toJson());

        isLoading.value = false;

        Get.offAllNamed(RouteName.home);
      }
    } on AuthException catch (e) {
      isLoading.value = false;
      showSnackBar(title: "Error", message: e.message);
      print(e.message);
    } catch (e) {
      isLoading.value = false;
      showSnackBar(
        title: "Error",
        message: "Something went wrong please contact to the admin",
      );
      print(e);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      final authRes = await SupabaseServices.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (authRes.user != null) {
        print("User is logged in ...... session is ${authRes.session!}");
        await Storage.session
            .write(Storagekeys.userSession, authRes.session!.toJson());

        isLoading.value = false;

        Get.offAllNamed(RouteName.home);
      }
    } on AuthException catch (e) {
      showSnackBar(title: "Error", message: e.message);
      print(e.message);
    } catch (e) {
      isLoading.value = false;
      showSnackBar(
        title: "Error",
        message: "Something went wrong please contact to the admin",
      );
      print(e);
    }
  }

  Future<void> signOut() async {
    isLoading.value = true;
    try {
      await SupabaseServices.client.auth.signOut();

      await Storage.session.remove(Storagekeys.userSession);

      Get.offAllNamed(RouteName.login);
    } on AuthException catch (e) {
      showSnackBar(title: "Error", message: e.message);
      print(e.message);
    } catch (e) {
      isLoading.value = false;
      showSnackBar(
        title: "Error",
        message: "Something went wrong please contact to the admin",
      );
      print(e);
    }
  }
}
