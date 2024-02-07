import 'package:flutter/foundation.dart';

class Plunge {
  Float64List locationLatitide;
  Float64List locationLongitude;
  DateTime dateTimeStarted;
  DateTime dateTimeCompleted;
  int duration;
  int temperature;
  String plungeMethod;
  String shiver;

  Plunge(this.locationLatitide, this.locationLongitude, this.dateTimeStarted,
      this.dateTimeCompleted, this.duration,this.temperature, this.plungeMethod, this.shiver);

  Map<String, dynamic> toMap() {
    return {
      'locationLatitide': locationLatitide,
      'locationLongitude': locationLongitude,
      'dateTimeStarted': dateTimeStarted,
      'dateTimeCompleted': dateTimeCompleted,
      'duration': duration,
      'temperature': temperature,
      'plungeMethod': plungeMethod,
      'shiver': shiver,
    };
  }

  static Plunge fromMap(Map<String, dynamic> map) {
    return Plunge(
        map['locationLatitide'],
        map['locationLongitude'],
        map['dateTimeStarted'],
        map['dateTimeCompleted'],
        map['duration'],
        map['temperature'],
        map['plungeMethod'],
        map['shiver']);
  }
}
