import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/models/game_opcao.dart';
import '../constants.dart';
import '../controllers/game_controller.dart';
import '../theme.dart';
import 'package:provider/provider.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final GameOpcao gameOpcao;

  const CardGame({super.key, required this.modo, required this.gameOpcao});

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  //sempre que utilizar animações tem que colocar o SingleTickerProviderStateMixin
  //porque dá as funções de sincronização da animação
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  AssetImage getImage(double angulo) {
    // mudança de angulo das cartas ao clicar
    if (angulo > 0.5 * pi) {
      return AssetImage('images/${widget.gameOpcao.opcao.toString()}.png');
    } else {
      return widget.modo == Modo.normal
          ? const AssetImage('images/card_normal.png')
          : const AssetImage('images/card_round.png');
    }
  }

  flipCard() {
    final game = context.read<GameController>();

    if (!animation.isAnimating &&
        !widget.gameOpcao.matched &&
        !widget.gameOpcao.selected &&
        !game.jogadaCompleta) {
      animation.forward();
      game.escolher(widget.gameOpcao, resetCard);
    }
  }

  resetCard() {
    animation.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        final angulo = animation.value * pi;
        final transform = Matrix4.identity()
          //perspectiva ao rotacionar a carta
          ..setEntry(3, 2, 0.002)
          //qual angulo vai alterar
          ..rotateY(angulo);

        return GestureDetector(
          onTap: () => flipCard(),
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.modo == Modo.normal
                      ? Colors.white
                      : MemoriaTheme.color,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: getImage(angulo),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
