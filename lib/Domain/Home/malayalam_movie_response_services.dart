import 'package:dartz/dartz.dart';

import 'package:movie_box_app/Domain/Home/model/malayalam_movie_response/malayalam_movie_response.dart';

import '../core/failures/main_failure.dart';

abstract class MalayalamMovieService {
  Future<Either<MainFailure, MalayalamMovieResponse>> getMalayalamMovies();
}