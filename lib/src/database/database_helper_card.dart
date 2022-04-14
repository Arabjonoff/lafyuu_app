import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperCard {
  static final DatabaseHelperCard _instance = DatabaseHelperCard.internal();

  factory DatabaseHelperCard() => _instance;

  static Database? _db;

  DatabaseHelperCard.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'lafyuudatabaseproduct.db');

    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  static const String cardTable = "fav_table";
  static const String cardColumnId = "id";
  static const String cardColumnImage = "images";
  static const String cardColumnName = "name";
  static const String cardColumnPrice = "price";
  static const String cardColumnDiscountPrice = "discount_price";
  static const String cardColumnAvg = "review_avg";
  static const String cardColumnCard = "cart";

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $cardTable('
      '$cardColumnId INTEGER PRIMARY KEY, '
      '$cardColumnImage TEXT, '
      '$cardColumnName TEXT, '
      '$cardColumnCard INTEGER, '
      '$cardColumnPrice INTEGER, '
      '$cardColumnDiscountPrice REAL, '
      '$cardColumnAvg REAL)',
    );
  }

  Future<int> saveProductCard(ProductListResult card) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      cardTable,
      card.toJsonCard(),
    );
    return result;
  }

  Future<List<ProductListResult>> getProductCard() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
      'SELECT * FROM $cardTable',
    );
    List<ProductListResult> meta = <ProductListResult>[];
    for (int i = 0; i < list.length; i++) {
      ProductListResult userModel = ProductListResult(
        id: list[i][cardColumnId],
        name: list[i][cardColumnName],
        images: ProductImages(
          image: list[i][cardColumnImage],
        ),
        price: list[i][cardColumnPrice],
        discountPrice: list[i][cardColumnDiscountPrice],
        reviewAvg: list[i][cardColumnAvg],
        card: list[i][cardColumnCard],
      );
      meta.add(userModel);
    }
    return meta;
  }

  Future<int> deleteProductCard(int id) async {
    var dbClient = await db;
    int result = await dbClient.delete(
      cardTable,
      where: '$cardColumnId = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<int> updateProductCard(ProductListResult card) async {
    var dbClient = await db;
    int results = await dbClient.update(
      cardTable,
      card.toJsonCard(),
      where: '$cardColumnId = ?',
      whereArgs: [card.id],
    );
    return results;
  }
}
