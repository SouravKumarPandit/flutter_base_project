//
//import 'package:moor_flutter/moor_flutter.dart';
//
//// Moor works by source gen. This file will all the generated code.
//part 'moor_database.g.dart';
//
////@DataClassName('task')
//class Tasks extends Table{
// IntColumn get id=>integer().autoIncrement()();
// TextColumn get name=>text().withLength(min: 1,max: 99)();
// DateTimeColumn get dueDate =>dateTime().nullable()();
// BoolColumn get completed=>boolean().withDefault(Constant(false))();
//
//// @override
//// Set<Column> get primaryKey =>{id,name};
//
//
//}
//@UseMoor(tables: [Tasks],daos: [TasksDao])
//// _$AppDatabase is the name of the generated class
//class AppDatabase extends _$AppDatabase {
//  AppDatabase()
//      : super((FlutterQueryExecutor.inDatabaseFolder(
//    path: 'app_database.sqlite',
//    logStatements: true,
//  )));
//
//  // Bump this when changing tables and columns.
//  // Migrations will be covered in the next part.
//  @override
//  int get schemaVersion => 1;
//
//
//  // All tables have getters in the generated class - we can select the tasks table
//  Future<List<Task>> getAllTasks() => select(tasks).get();
//
//  // Moor supports Streams which emit elements when the watched data changes
//  Stream<List<Task>> watchAllTasks() => select(tasks).watch();
//
//  Future insertTask(Task task) => into(tasks).insert(task);
//
//  // Updates a Task with a matching primary key
//  Future updateTask(Task task) => update(tasks).replace(task);
//
//  Future deleteTask(Task task) => delete(tasks).delete(task);
//}
//
//
////
////@UseDao(
////  tables: [Tasks],
////)
////class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
////  final AppDatabase db;
////
////  TaskDao(this.db) : super(db);
////
////  Stream<List<TaskWithTag>> watchAllTasks() {
////    return (select(tasks)
////      ..orderBy(
////        [
////              (t) =>
////              OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
////              (t) => OrderingTerm(expression: t.name),
////        ],
////      ))
////        .join(
////      [
////        leftOuterJoin(tags, tags.name.equalsExp(tasks.tagName)),
////      ],
////    )
////        .watch()
////        .map((rows) => rows.map(
////          (row) {
////        return TaskWithTag(
////          task: row.readTable(tasks),
////          tag: row.readTable(tags),
////        );
////      },
////    ).toList());
////  }
////
////  Future insertTask(Insertable<Task> task) => into(tasks).insert(task);
////  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);
////  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
////}