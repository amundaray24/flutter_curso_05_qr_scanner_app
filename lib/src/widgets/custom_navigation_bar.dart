import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_curso_05_qr_scanner_app/src/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final uiState = Provider.of<UiProvider>(context);

    final currentIndex = uiState.selectedMenuOption;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => uiState.selectedMenuOption = value,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Maps'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration_outlined),
          label: 'Address'
        )
      ],
    );
  }
}