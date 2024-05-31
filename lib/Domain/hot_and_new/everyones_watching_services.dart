import 'package:dartz/dartz.dart';

import 'package:movie_box_app/Domain/hot_and_new/model/everyones_watching/everyones_watching.dart';


import '../core/failures/main_failure.dart';

abstract class EveryonesWatchingServices {
  Future<Either<MainFailure, EveryonesWatching>> getPopular();
}
