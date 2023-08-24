import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myrticles/cubits/tab_cubit/tab_cubit.dart';
import 'package:myrticles/data/local/repository/storage_repository.dart';
import 'package:myrticles/data/network/api_service.dart';
import 'package:myrticles/utils/routs/routs.dart';
import 'cubits/auth/auth_cubit.dart';
import 'data/reporsitories/auth_repostory.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  runApp(App(
    apiService: ApiService(),
  ));
}

class App extends StatelessWidget {
  const App({super.key, required this.apiService});
  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          RepositoryProvider(
              create: (context) => AuthRepository(apiService: apiService)),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    AuthCubit(repository: context.read<AuthRepository>())),
            BlocProvider(create: (context)=>TabCubit())
          ],
          child: MyApp(),
        ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteNames.splashScreen,
    );
  }
}
