import 'package:flutter/material.dart';

import '../constants.dart';
import '../pages/recordes_page.dart';
import '../theme.dart';

class Recordes extends StatefulWidget {
  const Recordes({Key? key}) : super(key: key);

  @override
  State<Recordes> createState() => _RecordesState();
}

class _RecordesState extends State<Recordes> {
  showRecordes(Modo modo) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => RecordesPage(modo: modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 10, 190, 255),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Recordes',
                style: TextStyle(
                  color: MemoriaTheme.color,
                  fontSize: 22,
                ),
              ),
            ),
            ListTile(
              title: const Text('Modo Normal'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo.normal),
            ),
            ListTile(
              title: const Text('Modo Cacá'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo.caca),
            )
          ],
        ),
      ),
    );
  }
}
