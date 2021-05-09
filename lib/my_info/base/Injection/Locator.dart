import 'package:flutter_frist_try/my_info/services/Network/ApiService.dart';
import 'package:flutter_frist_try/my_info/services/Sql/PrefService.dart';
import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final prefInstance = await PrefService.getInstance();
  locator.registerSingleton<PrefService>(prefInstance);
  locator.registerLazySingleton(() => ApiService());
}
