import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:threads_clone/routes/route_names.dart';
import 'package:threads_clone/routes/routes.dart';
import 'package:threads_clone/services/supbase_services.dart';
import 'package:threads_clone/theme.dart';
import 'package:threads_clone/utils/storage/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load Envirment varialbe .env file data
  await dotenv.load(fileName: ".env");

  // Initialize get storage
  await GetStorage.init();

  // Initialize supbase
  Get.put(SupabaseServices());

  // Start the app to the phone
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("User Session data is .....");
    print(Storage.userSession);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      getPages: Routes.pages,
      initialRoute:
          Storage.userSession != null ? RouteName.home : RouteName.login,
    );
  }
}
