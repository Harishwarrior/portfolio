import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/timeline_model.dart';

class TimelineService {
  static Future<TimelineData> loadTimelineData() async {
    final String response =
        await rootBundle.loadString('assets/data/timeline.json');
    final data = json.decode(response) as Map<String, dynamic>;
    return TimelineData.fromJson(data);
  }
}
