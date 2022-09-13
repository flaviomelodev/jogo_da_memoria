import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/pages/home_page.dart';
import 'package:jogo_da_memoria/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: MemoriaTheme.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/splash.png', width: 400, height: 400),
            const SizedBox(height: 10),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
