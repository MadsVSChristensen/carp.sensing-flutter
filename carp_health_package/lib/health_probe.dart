part of health_lib;

class HealthProbe extends StreamProbe {
  StreamController<HealthDatum> streamController = StreamController<HealthDatum>.broadcast();
  List<HealthDataType> dataTypes;

  Stream<HealthDatum> get stream => streamController.stream;
  List<HealthDataPoint> healthData = List<HealthDataPoint>();

  Future<void> _makeApiCall(DateTime start, DateTime end) async {
    /// Make API call and fetch data points
    for (HealthDataType type in dataTypes) {
      /// Calls to 'Health.getHealthDataFromType'
      /// must be wrapped in a try catch block.
      try {
        List<HealthDataPoint> healthData = await Health.getHealthDataFromType(start, end, type);
        healthData.addAll(healthData);
      } catch (exception) {
        print(exception.toString());
      }

      /// Convert [HealthDataPoint] to Datums and add them to the stream.
      for (HealthDataPoint h in healthData) {
        streamController.add(HealthDatum.fromHealthDataPoint(h));
      }
    }

    Future<void> onInitialize(Measure measure) async {
      assert(measure is HealthMeasure);
      super.onInitialize(measure);

      /// Extract interval and start time
      HealthMeasure m = measure as HealthMeasure;
      DateTime start = m.startTime;
      DateTime end = start.add(m.interval);

      /// Start periodic API queries
      new Timer.periodic(m.interval, (Timer t) {
        _makeApiCall(start, end);
        start = DateTime.now();
        end = start.add(m.interval);
      });
    }
  }
}
