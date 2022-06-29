import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database_repository.g.dart';

class Interviews extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get name => text().withLength(min: 3, max: 30)();

  TextColumn get role => text().withLength(min: 3, max: 30)();

  TextColumn get avatarUrl => text().nullable().named("avatar_url")();

  TextColumn get timing => text()();

  BoolColumn get isMale => boolean().withDefault(const Constant(true))();
}

@DriftDatabase(tables: [Interviews])
class DataBase extends _$DataBase {
  DataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Interview>> get allTodoEntries => select(interviews).get();

  MultiSelectable<Interview> pageOfInterviews(int page, {int pageSize = 6}) {
    return select(interviews)..limit(pageSize, offset: page);
  }

  Future updateInterviews(Interview entry) {
    return update(interviews).replace(entry);
  }

  Future<int> addInterviews(Interview entry) {
    return into(interviews).insert(entry);
  }

  Future deleteInterviews(Interview entry) {
    return (delete(interviews)..where((i) => Constant(i.id == entry.id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
