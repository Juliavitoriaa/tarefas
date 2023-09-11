import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase {
  String _dbPath = 'tarefas.db';

  Future<Database> getInstance() async {
    return await databaseFactoryIo.openDatabase(_dbPath);
  }
}