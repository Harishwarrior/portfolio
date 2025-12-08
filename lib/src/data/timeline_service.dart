import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:dart_mappable/dart_mappable.dart';
import '../domain/timeline_model.dart';
import '../gen/assets.gen.dart';

class TimelineService {
  static Future<TimelineData> loadTimelineData() async {
    final String response = await rootBundle.loadString(Assets.data.timeline);
    final data = json.decode(response) as Map<String, dynamic>;
    return MapperContainer.globals.fromMap<TimelineData>(data);
  }
}
