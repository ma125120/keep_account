import 'package:keep_account/models/index.dart';
import 'package:sqflite/sqflite.dart';

final String tableBill = 'bill';

class BillProvider {
  Database db;

  Future open(String path) async {
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table $tableBill ( 
            $columnId integer primary key autoincrement, 
            iconType TEXT not null,
            price REAL not null,
            note TEXT,
            hasCost INTEGER not null)
        '''
        );
    });
  }

  Future<Bill> insert(Bill bill) async {
    bill.id = await db.insert(tableBill, bill.toJson());
    return bill;
  }

  Future<Bill> getBill(int id) async {
    List<Map> maps = await db.query(
      tableBill,
      where: '$columnId = ?',
      whereArgs: [id]
    );
    if (maps.length > 0) {
      return Bill.fromJson(maps.first);
    }
    return null;
  }
  Future<List<Bill>> getBills() async {
    List<Map> maps = await db.query(
      tableBill,
    );
    if (maps.length > 0) {
      return maps.map((v) => Bill.fromJson(v)).toList(growable: false);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableBill, where: '$columnId = ?', whereArgs: [id]);
  }
  Future<int> empty() async {
    return await db.delete(tableBill);
  }

  Future<int> update(Bill bill) async {
    return await db.update(tableBill, bill.toJson(),
        where: '$columnId = ?', whereArgs: [bill.id]);
  }

  Future close() async => db.close();
}

final BillProvider monthInfoProvider = new BillProvider();