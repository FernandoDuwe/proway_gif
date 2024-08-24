import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigRepository {
  static Future<String> getAPIKey() async {
    await dotenv.load(fileName: ".env");

    return dotenv.env["GIPHY_API_KEY"] ?? "";
  }
}
