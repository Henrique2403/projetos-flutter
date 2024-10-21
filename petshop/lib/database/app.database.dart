import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../domain/animal.dart';
import 'constants.dart';

class AnimalDataBase {
  static final AnimalDataBase instance = AnimalDataBase._init();
  static Database? _database;

  AnimalDataBase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDataBase(nameDB);
    return _database!;
  }

  Future<Database> initDataBase(String name) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, name);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute(createTable);
  }

  Future<int> insert(Animal animal) async {
    final db = await instance.database;
    return await db.insert(tableName, animal.toJson());
  }

  Future<List<Animal>> readAll() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((animalJson) => Animal.fromJson(animalJson)).toList();
  }
}