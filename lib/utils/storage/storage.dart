import 'package:get_storage/get_storage.dart';
import 'package:threads_clone/utils/storage/storage_keys.dart';

class Storage {
  static final session = GetStorage();

  // Read user session
  static final userSession = session.read(Storagekeys.userSession);
}
