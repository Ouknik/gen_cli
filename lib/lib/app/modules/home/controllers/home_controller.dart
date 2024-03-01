import 'package:farah_admin/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:farah_admin/app/modules/home/views/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/actions.dart';
import '../../../model/actions.dart';
import '../../../model/annonce.dart';
import '../../../model/category.dart';
import '../providers/annonce_provider.dart';

class HomeController extends GetxController {
  final annonce = <AnnonceElements>[].obs;
  final annoncevalue = <AnnonceElements>[].obs;
  final loading = false.obs;
  final category = <CategoryElement>[].obs;
  final categoryvalue = <CategoryElement>[].obs;
  final categoryid = "0".obs;
  final activeindex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getActions();
    GetAllAnnonce();
    GetAllCategory();
  }

  getToAddAnnonceView() {
    DashboardController dashboardController = Get.find();
    dashboardController.currentPage.value = 4;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  GetAllAnnonce() async {
    loading.value = true;
    print("startt");
    Annonce? _annonce = await AnnonceProvider().getAnnonce();
    annoncevalue.value = _annonce.annonces;
    annonce.value = _annonce.annonces;
    loading.value = false;
    update();
  }

  filterAnnouncesByUserID(Map<String, String> userId) async {}

  GetAllCategory() async {
    Category? _category = await AnnonceProvider().getCategory();
    category.value = _category.category;
    category.insert(
        0,
        CategoryElement(
            categoryCategory: "All", categoryId: "0", categoryIcon: ""));
    update();
  }

  final listAction = <ActionModel>[].obs;
  getActions() {
    for (var element in Actionjson.actions) {
      listAction.add(ActionModel.fromJson(element));
    }
  }

  activeAction({required AnnonceElements annonce, required String action}) {
    if (action == "View") {
      Get.to(Details(annonce: annonce));
    } else if (action == "Validate") {
      //validate
    } else if (action == "Edit") {
      //edit
    } else if (action == "Delete") {
      //delete
    }
  }
}
