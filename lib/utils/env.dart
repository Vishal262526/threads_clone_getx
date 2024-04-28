import 'package:flutter_dotenv/flutter_dotenv.dart';

class ENV {
  static final supbaseUrl = dotenv.env['SUPABASE_URL']!;
  static final supbaseAnonKey = dotenv.env['SUPABASE_KEY']!;
}
