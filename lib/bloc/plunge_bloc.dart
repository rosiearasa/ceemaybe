import 'dart:async';
import '../data/plunge.dart';
import '../data/plungedata_db.dart';

//interface between UI AND DB
class PlungeBloc {
  PlungeDB db;
  List<Plunge> plungeList;

//set up a broadcast stream for mltiple listeners
  final _plungesStreamController = StreamController<List<Plunge>>.broadcast();

  //for updates
  final _plungeInsertController = StreamController<Plunge>();
  final _plungeUpdateController = StreamController<Plunge>();
  final _plungeDeleteController = StreamController<Plunge>();

  //sink to add data and stream to get data
  Stream<List<Plunge>> get plunges => _plungesStreamController.stream;

  StreamSink<List<Plunge>> get plungesSink => _plungesStreamController.sink;

  StreamSink<Plunge> get plungeInsertSink => _plungesInsertController.sink;
  StreamSink<Plunge> get plungeUpdateSink => _plungesUpdateController.sink;
  StreamSink<Plunge> get plungeDeleteSink => _plungesDeleteController.sink;

  Future getPlunges() async {
    List<Plunge> plunges = await db.getPlunges();
    plungeList = plunges;
    plungesSink.add(plunges);
  }

  List<Plunge> returnPlunges(plunges) {
    return plunges;
  }

  void _deletePlunge(Plunge plunge){

    db.deletePlunge(plunge).the((result){
      getPlunges();
    });
  }

  
}
