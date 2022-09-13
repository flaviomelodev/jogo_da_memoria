// ignore: depend_on_referenced_packages
import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';
import '../constants.dart';
import '../models/game_play.dart';
part 'recordes_repository.g.dart';

class RecordesRepository = RecordesRepositoryBase with _$RecordesRepository;

abstract class RecordesRepositoryBase with Store {
  late final Box _recordes;
  late final GamePlay gamePlay;
  @observable
  Map recordesCaca = {};
  @observable
  Map recordesNormal = {};

  RecordesRepositoryBase() {
    _initRepository();
  }

  _initRepository() async {
    await _initDatabase();
    await loadRecordes();
  }

  _initDatabase() async {
    _recordes = await Hive.openBox('gameRecordes3');
  }

  @action
  loadRecordes() {
    recordesNormal = _recordes.get(Modo.normal.toString()) ?? {};
    recordesCaca = _recordes.get(Modo.caca.toString()) ?? {};
  }

  updateRecordes({required GamePlay gamePlay, required int score}) {
    final key = gamePlay.modo.toString();

    if (gamePlay.modo == Modo.normal &&
        (recordesNormal[gamePlay.nivel] == null ||
            score < recordesNormal[gamePlay.nivel])) {
      recordesNormal[gamePlay.nivel] = score;
      _recordes.put(key, recordesNormal);
    } else if (gamePlay.modo == Modo.caca &&
        (recordesCaca[gamePlay.nivel] == null ||
            score > recordesCaca[gamePlay.nivel])) {
      recordesCaca[gamePlay.nivel] = score;
      _recordes.put(key, recordesCaca);
    }
  }
}
