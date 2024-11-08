import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shopping/models/shopping_item.dart';

class GeneratePrinting {
  Future<void> PrintingPdf(List<ShoppingItem> items) async {
    if (items == null || items.isEmpty) {
      print("A lista de itens está vazia ou nula.");
      return;
    }

    final pdf = pw.Document();

    final netImage = await networkImage(
        'https://media.istockphoto.com/id/1206806317/pt/vetorial/shopping-cart-icon-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=cl3NPzmnu0pRmaRGndYIejbHGe-atORf0JDjzmhX8Z8=');

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Container(
                width: 300,
                height: 300,
                child: pw.Image(netImage, fit: pw.BoxFit.cover),
              ),
              pw.Text('Seu Pedido de Compra:'),
              pw.SizedBox(height: 20),
              // Adiciona os itens da lista ao PDF
              pw.ListView(
                children: items.map((shoppingItem) {
                  return pw.Text(
                      'Item: ${shoppingItem.name}, Quantidade: ${shoppingItem.quantity}');
                }).toList(),
              ),
            ],
          ),
        );
      },
    ));

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}