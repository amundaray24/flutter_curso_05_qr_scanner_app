import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_curso_05_qr_scanner_app/src/pages/pages.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/providers/scan_list_provider.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/providers/ui_provider.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('History'),
        actions: [
          IconButton(
            onPressed: () => scanListProvider.deleteAll(),
            icon: const Icon(Icons.delete)
          )
        ],
      ),
      body: const _HomePageBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const ScanButton(),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {

    final uiState = Provider.of<UiProvider>(context);

    final currentPage = uiState.selectedMenuOption;

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentPage) {
      case 1:
        scanListProvider.initialLoadByType('http');
        return const AddressesPage();
      case 0:
      default:
        scanListProvider.initialLoadByType('geo');
        return const MapsPage();
    }
  }
}