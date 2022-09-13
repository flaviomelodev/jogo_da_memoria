import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Image.asset('images/host.png', width: 200, height: 200),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: RichText(
            text: TextSpan(
              text: 'Jogo da ',
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontSize: 30, color: Colors.white),
              children: const [
                TextSpan(
                  text: 'Memória',
                  style: TextStyle(color: Colors.pinkAccent),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
