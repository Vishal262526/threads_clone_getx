import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:threads_clone/utils/env.dart';

class SupabaseServices extends GetxService {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    await Supabase.initialize(
      url: ENV.supbaseUrl,
      anonKey: ENV.supbaseAnonKey,
    );
  }

  static final SupabaseClient client = Supabase.instance.client;
}
