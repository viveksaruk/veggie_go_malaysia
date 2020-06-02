import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/services/database/abstract_firestore.dart';

class FirestoreService implements DatabaseService {
  final Firestore _firestoreService = Firestore.instance;

  DocumentSnapshot _lastDocument;
  List<List<Restaurant>> _allPagedResults = List<List<Restaurant>>();
  
  @override
  Future<List<Restaurant>> fetchResults() {
    var collectionRef = _firestoreService.collection('places');
    var q = collectionRef
        .where('status', isEqualTo: 'OPERAIONAL')
        .limit(3);

    // pagination
    if(_lastDocument != null){
      q = q.startAfterDocument(_lastDocument);
    }

    q.snapshots().listen((snaphsot) { 
      if(snaphsot.documents.isNotEmpty){
        var places = snaphsot.documents
            .map((snapshot) => Restaurant.fromMap(snapshot.data, snaphsot.documentID))
            .where((mappedDoc) => mappedDoc.name != null)
            .toList();
      }
    });
  }
}
