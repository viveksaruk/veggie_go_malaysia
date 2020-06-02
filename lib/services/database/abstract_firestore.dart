import 'package:veggie_go_malaysia/datamodels/restaurant.dart';

abstract class DatabaseService {
  Future<List<Restaurant>> fetchResults();
}
