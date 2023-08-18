import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realm_todolist_flutter/models/task.dart';
import 'package:realm_todolist_flutter/repository/realm_database.dart';
import 'package:realm_todolist_flutter/services/app_router.dart';
import 'blocs/bloc_exports.dart';
import 'screens/homepage.dart';
void main() {

  final realm = Realm(Configuration.local([]));
  final allTasks = realm.all<Task>();
  BlocOverrides.runZoned(
        () => runApp( MyApp(appRouter: AppRouter(),)),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(RealmDatabase()),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const HomePage(),
        onGenerateRoute: appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

