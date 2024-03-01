import 'package:farah_admin/app/api/detail.dart';
import 'package:farah_admin/app/model/invoice.dart';
import 'package:farah_admin/app/modules/innvoices/controllers/innvoices_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InvoicePage extends StatelessWidget {
  final controller = Get.put(InnvoicesController());
  InvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoices = controller.innvoicesMonthUserId.value;
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoices'),
      ),
      body: ListView(
        children: [
          ...invoices.map(
            (e) => ListTile(
              title: Text(e.annonceTitle),
              subtitle: Text(e.userFirstName),
              trailing: Text(e.clientPrix),
              onTap: () {
                /* Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => DetailPage(invoice: e),
                  ),
                );*/
              },
            ),
          )
        ],
      ),
    );
  }
}
