import 'dart:convert';

import 'package:get/get.dart';

import '../../../config/statues.dart';
import '../../../func/call_api.dart';
import '../../../model/annonce.dart';
import '../../../model/category.dart';

class AnnonceProvider extends GetConnect {
  Future<Annonce> getAnnonce() async {
    final response = await CallApi()
        .callApiStreamWithOtt("/annonce/agadir", Statue().get, {});

    try {
      return annonceFromJson(response);
    } catch (e) {
      return Annonce(nxtapott: "", annonces: [], status: "");
    }
  }

  Future<Category> getCategory() async {
    final response =
        await CallApi().callApiStreamWithOtt("/category", Statue().get, {});

    return categoryFromJson(response);
  }

  Future<List<AnnonceElements>> getAnnonceById({required String userId}) async {
    final response = await CallApi()
        .callApiStreamWithOtt("/myannonce/${userId}", Statue().get, {});

    Annonce resp = annonceFromJson(response);
    List<AnnonceElements> res = resp.annonces;
    return res;
  }
}
