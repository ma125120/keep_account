import 'package:keep_account/common/app.dart';
import 'package:keep_account/common/date.dart';
import 'package:keep_account/components/const.dart';
import 'package:keep_account/models/index.dart';
import 'package:sqflite/sqflite.dart';

final String tableBill = 'bill';

class BillProvider {
  Database db;

  Future open() async {
    if (db != null) return;
    final path = App.dbPath;

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          create table $tableBill ( 
            $columnId integer primary key autoincrement, 
            iconId TEXT not null,
            type INTEGER DEFAULT 0,
            price REAL not null,
            note TEXT,
            yearStr TEXT not null,
            monthStr TEXT not null,
            dateStr TEXT not null,
            hasCost INTEGER not null)
        ''');
    });
  }

  Future<Bill> insert(dynamic bill) async {
    await open();
    Map map = (bill is Bill) ? bill.toJson() : bill;
    map['yearStr'] = MyDate.format('yyyy', bill['dateStr']);
    map['monthStr'] = MyDate.format('yyyy-MM', bill['dateStr']);

    map['id'] = await db.insert(tableBill, map);

    return Bill.fromJson(map);
  }

  Future<Bill> getBill(int id) async {
    await open();
    List<Map> maps =
        await db.query(tableBill, where: '$columnId = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return Bill.fromJson(maps.first);
    }
    return null;
  }

  Future<List<Bill>> getBills() async {
    await open();

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

final BillProvider billProvider = new BillProvider();
