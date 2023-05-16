import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_module.dart';

import 'package:todo_list_provider/app/modules/home/home_page.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_controller.dart';

import '../../repositories/tasks/tasks_repository.dart';
import '../../repositories/tasks/tasks_repository_impl.dart';
import '../../services/tasks/tasks_service.dart';
import '../../services/tasks/tasks_service_impl.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(bindings: [
          ChangeNotifierProvider(
              create: (context) =>
                  HomeController(tasksService: context.read())),
          Provider<TasksRepository>(
            create: (context) =>
                TasksRepositoryImpl(sqliteConnectionFactory: context.read()),
          ),
          Provider<TasksService>(
            create: (context) =>
                TasksServiceImpl(tasksRepository: context.read()),
          ),
        ], routers: {
          '/home': (context) => HomePage(
                homeController: context.read(),
              ),
        });
}
