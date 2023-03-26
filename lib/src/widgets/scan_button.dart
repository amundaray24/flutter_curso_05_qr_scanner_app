import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String qrResponse = await FlutterBarcodeScanner
        .scanBarcode(
          '#3D8BEF', 
          'Exit', 
          false, 
          ScanMode.QR
        );
        if (qrResponse!='-1') {
          final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.insertScan(qrResponse);
        }
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}