import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_box_app/Core/di/injectable.config.dart';


final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjectable() async {
  getIt.init(environment: Environment.prod);
}
