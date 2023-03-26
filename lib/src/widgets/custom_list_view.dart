import 'package:flutter/material.dart';

import 'package:flutter_curso_05_qr_scanner_app/src/models/scan_model.dart';

class CustomListView extends StatelessWidget {

  final List<ScanModel> scans;
  final IconData icon;
  final Function onTap;
  final Function onDismissed;

  const CustomListView({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.onDismissed,
    required this.scans
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        background: Container(
            color: Colors.red,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white,)
        ),
        onDismissed: (_) => onDismissed(scans[index].id!),
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor,),
          title: Text(scans[index].value),
          subtitle: Text('ID: ${scans[index].id}'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap:  () => onTap(scans[index]),
        ),
      ),
    );
  }
}
