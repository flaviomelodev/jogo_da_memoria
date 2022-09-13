import 'package:flutter/material.dart';

import '../constants.dart';
import '../theme.dart';
import '../widgets/logo.dart';

import '../widgets/start_button.dart';
import 'nivel_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  selecionarNivel(Modo modo, BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NivelPage(modo: modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
              title: 'Modo Normal',
              color: Colors.pinkAccent,
              action: () => selecionarNivel(Modo.normal, context),
            ),
            StartButton(
              title: 'Modo Difícil',
              color: MemoriaTheme.color,
              action: () => selecionarNivel(Modo.caca, context),
            ),
            const SizedBox(height: 60),
            //const Recordes(),
          ],
        ),
      ),
    );
  }
}
