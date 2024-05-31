import 'package:dartz/dartz.dart';

import 'package:movie_box_app/Domain/Downloads/models/downloads.dart';
import 'package:movie_box_app/Domain/core/failures/main_failure.dart';


abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
