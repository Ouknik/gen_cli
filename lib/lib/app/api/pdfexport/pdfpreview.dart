import 'package:farah_admin/app/model/invoice.dart';
import 'package:farah_admin/app/model/invoices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:printing/printing.dart';
import 'pdf/pdfexport.dart';

class PdfPreviewPage extends StatelessWidget {
  final Invoices invoice;
  const PdfPreviewPage({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(invoice),
      ),
    );
  }
}
