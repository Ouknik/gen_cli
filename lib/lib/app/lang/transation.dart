import 'fr.dart';
import 'ar.dart';
import 'package:get/get.dart';
import 'en.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, "fr": fr, "ar": ar};
}

class StringKeys {
  static const annonces = "advertisements";
  static const accounts = "accounts";
  static const messages = "messages";
  static const settings = "settings";
  static const search = "search";
  static const addAnnonce = "add_annonce";
  static const dashboard = "dashboard";
  static const logOut = "log_out";
  static const selectLanguage = "select_language";
  static const manageAccount = "manage_your_account";
}
