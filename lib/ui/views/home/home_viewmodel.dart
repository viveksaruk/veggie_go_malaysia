import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/services/database/firestore.dart';

class HomeViewModel extends FutureViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  @override
  Future futureToRun() {
    return _firestoreService.fetchResults();
  }
}
