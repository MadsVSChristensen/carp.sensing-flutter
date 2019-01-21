import 'package:test/test.dart';
import 'package:carp_mobile_sensing/core/core.dart';
import 'package:carp_mobile_sensing/probes/sound/sound.dart';
import 'dart:convert';
import 'dart:io';

String _encode(Object object) => const JsonEncoder.withIndent(' ').convert(object);

void main() {
  Study study;

  setUp(() {
    study = Study("1234", "bardram", name: "bardram study");
    study.dataEndPoint = DataEndPoint(DataEndPointType.PRINT);
//    study.dataEndPoint = FileDataEndPoint()
//      ..bufferSize = 50 * 1000
//      ..zip = true
//      ..encrypt = false;

//    study.addTask(Task('1st Taks')
//      ..addMeasure(Measure(DataFormat('carp', 'location')))
//      ..addMeasure(Measure(DataFormat('carp', 'noise'))));
//
//    study.addTask(ParallelTask('2nd Taks')
//      ..addMeasure(Measure(DataFormat('carp', 'accelerometer')))
//      ..addMeasure(Measure(DataFormat('carp', 'light'))));
//
//    study.addTask(SequentialTask('3rd Taks')
//      ..addMeasure(Measure(DataFormat('carp', 'apps'))
//        ..configuration['frequency'] = '2'
//        ..configuration['jakob'] = 'was here')
//      ..addMeasure(PeriodicMeasure(DataFormat('carp', 'weather'))));
//
//    study.addTask(SequentialTask('4rd Taks')
//      ..addMeasure(PeriodicMeasure(DataFormat('carp', 'apps'), frequency: 3, duration: 8))
//      ..addMeasure(Measure(DataFormat('carp', 'weather'))));

    study.addTask(Task('Location Task')..addMeasure(Measure(MeasureType(NameSpace.CARP, DataType.LOCATION))));

    study.addTask(ParallelTask('Sensor Task')
      ..addMeasure(PeriodicMeasure(MeasureType(NameSpace.CARP, DataType.ACCELEROMETER),
          frequency: 10 * 1000, // sample every 10 secs
          duration: 100 // for 100 ms
          ))
      ..addMeasure(PeriodicMeasure(MeasureType(NameSpace.CARP, DataType.GYROSCOPE),
          frequency: 20 * 1000, // sample every 20 secs
          duration: 100 // for 100 ms
          )));

    study.addTask(Task('Audio Recording Task')
      ..addMeasure(AudioMeasure(MeasureType(NameSpace.CARP, DataType.AUDIO),
          frequency: 10 * 60 * 1000, // sample sound every 10 min
          duration: 10 * 1000, // for 10 secs
          studyId: study.id))
      ..addMeasure(NoiseMeasure(MeasureType(NameSpace.CARP, DataType.NOISE),
          frequency: 10 * 60 * 1000, // sample sound every 10 min
          duration: 10 * 1000, // for 10 secs
          samplingRate: 500 // configure sampling rate to 500 ms
          )));

    study.addTask(SequentialTask('Sample Activity with Weather Task')
      ..addMeasure(Measure(MeasureType(NameSpace.CARP, DataType.ACTIVITY))..configuration['jakob'] = 'was here')
      ..addMeasure(PeriodicMeasure(MeasureType(NameSpace.CARP, DataType.WEATHER))));

    study.addTask(SequentialTask('Task collecting a list of all installed apps')
      ..addMeasure(Measure(MeasureType(NameSpace.CARP, DataType.APPS))));
  });

  String _string_snapshot;
  void _snapshot() {
    _string_snapshot = json.encode(study);
  }

  void _restore() {
    study = Study.fromJson(json.decode(_string_snapshot));
  }

  test('json.encode II', () {
    print(JsonEncoder.withIndent('  ').convert(study));
  });

  /// Test if we can take a snapshot of a Study and restore it using JSON.
  test('Study snapshot / restore', () async {
    print(_encode(study));
    _snapshot();

    _restore();
    print(_encode(study));

    expect(study.id, "1234");
  });

  /// Test template.
  test('...', () {
    // test template
  });
}