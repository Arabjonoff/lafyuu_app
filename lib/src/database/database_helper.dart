import 'dart:async';

import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'lafyuudatabase.db');

    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  static const String favTable = "fav_table";
  static const String favColumnId = "id";
  static const String favColumnImage = "images";
  static const String favColumnName = "name";
  static const String favColumnPrice = "price";
  static const String favColumnDiscountPrice = "discount_price";
  static const String favColumnAvg = "review_avg";

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $favTable('
      '$favColumnId INTEGER PRIMARY KEY, '
      '$favColumnImage TEXT, '
      '$favColumnName TEXT, '
      '$favColumnPrice INTEGER, '
      '$favColumnDiscountPrice REAL, '
      '$favColumnAvg REAL)',
    );
  }

  Future<int> saveProductFav(ProductListResult product) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      favTable,
      product.toJson(),
    );
    return result;
  }

  Future<List<ProductListResult>> getProductFav() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
      'SELECT * FROM $favTable',
    );
    List<ProductListResult> data = <ProductListResult>[];
    for (int i = 0; i < list.length; i++) {
      ProductListResult userModel = ProductListResult(
        id: list[i][favColumnId],
        name: list[i][favColumnName],
        images: ProductImages(
          image: list[i][favColumnImage],
        ),
        price: list[i][favColumnPrice],
        discountPrice: list[i][favColumnDiscountPrice],
        reviewAvg: list[i][favColumnAvg],
        isFav: true
      );
      data.add(userModel);
    }
    return data;
  }

  Future<int> deleteProductFav(int id) async {
    var dbClient = await db;
    int result = await dbClient.delete(
      favTable,
      where: '$favColumnId = ?',
      whereArgs: [id],
    );
    return result;
  }
}
