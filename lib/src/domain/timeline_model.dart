import 'package:dart_mappable/dart_mappable.dart';

part 'timeline_model.mapper.dart';

@MappableClass()
class TimelineItem with TimelineItemMappable {
  final String title;
  final String date;
  final String description;
  final String category;
  final List<String> links;

  TimelineItem({
    required this.title,
    required this.date,
    required this.description,
    required this.category,
    required this.links,
  });
}

@MappableClass()
class TimelineData with TimelineDataMappable {
  final List<TimelineItem> timelineItems;

  TimelineData({required this.timelineItems});
}
