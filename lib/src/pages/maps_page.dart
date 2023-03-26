import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_curso_05_qr_scanner_app/src/models/scan_model.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/providers/scan_list_provider.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/widgets/custom_list_view.dart';

class MapsPage extends StatelessWidget {
   
  const MapsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return CustomListView(
        icon: Icons.map,
        onTap: (ScanModel scanModel) => Navigator.pushNamed(context, 'map', arguments: scanModel),
        onDismissed: (id) => scanListProvider.deleteById(id),
        scans: scans
    );
  }
}