import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_curso_05_qr_scanner_app/src/models/scan_model.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/utils/utils.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/widgets/custom_list_view.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/providers/scan_list_provider.dart';

class AddressesPage extends StatelessWidget {
   
  const AddressesPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return CustomListView(
        icon: Icons.compass_calibration,
        onTap: (ScanModel scanModel) => dispatchUrl(scanModel.value),
        onDismissed: (id) => scanListProvider.deleteById(id),
        scans: scans
    );
  }
}