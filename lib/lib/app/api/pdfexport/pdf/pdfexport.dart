import 'dart:io';
import 'dart:typed_data';
import 'package:farah_admin/app/model/invoice.dart';
import 'package:farah_admin/app/model/invoices.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> makePdf(Invoices invoice) async {
  final pdf = Document();

  final imageLogo = MemoryImage(File('assets/logo-roya.png').readAsBytesSync());

  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Attention to: ${invoice.clienName}"),
                    Text(invoice.clientAdress),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(imageLogo),
                )
              ],
            ),
            Container(height: 50),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                TableRow(
                  children: [
                    Padding(
                      child: Text(
                        'INVOICE FOR PAYMENT',
                        style: Theme.of(context).header4,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ],
                ),
                ...invoice.item.map(
                  (e) => TableRow(
                    children: [
                      Expanded(
                        child: PaddedText(e.month),
                        flex: 2,
                      ),
                      Expanded(
                        child: PaddedText("${e.prix} dh"),
                        flex: 1,
                      )
                    ],
                  ),
                ),
                TableRow(
                  children: [
                    PaddedText('TAX', align: TextAlign.right),
                    PaddedText('0'),
                  ],
                ),
                TableRow(
                  children: [
                    PaddedText('TOTAL', align: TextAlign.right),
                    PaddedText(invoice.prixtotal)
                  ],
                )
              ],
            ),
            Padding(
              child: Text(
                "THANK YOU FOR YOUR CUSTOM!",
                style: Theme.of(context).header2,
              ),
              padding: EdgeInsets.all(20),
            ),
            Text(
                "Please forward the below slip to your accounts payable department."),
            Divider(
              height: 1,
              borderStyle: BorderStyle.dashed,
            ),
            Container(height: 50),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                TableRow(
                  children: [
                    PaddedText('Account Name'),
                    PaddedText(
                      invoice.clienName,
                    )
                  ],
                ),
                TableRow(
                  children: [
                    PaddedText(
                      'Account Adress',
                    ),
                    PaddedText(invoice.clientAdress)
                  ],
                ),
                TableRow(
                  children: [
                    PaddedText(
                      'Total Amount to be Paid',
                    ),
                    PaddedText(invoice.prixtotal)
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Please ensure all cheques are payable to the ADAM FAMILY TRUST.',
                style: Theme.of(context).header3.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        );
      },
    ),
  );
  return pdf.save();
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
