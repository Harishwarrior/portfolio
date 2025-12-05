// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'timeline_model.dart';

class TimelineItemMapper extends ClassMapperBase<TimelineItem> {
  TimelineItemMapper._();

  static TimelineItemMapper? _instance;
  static TimelineItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimelineItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TimelineItem';

  static String _$title(TimelineItem v) => v.title;
  static const Field<TimelineItem, String> _f$title = Field('title', _$title);
  static String _$date(TimelineItem v) => v.date;
  static const Field<TimelineItem, String> _f$date = Field('date', _$date);
  static String _$description(TimelineItem v) => v.description;
  static const Field<TimelineItem, String> _f$description =
      Field('description', _$description);
  static String _$category(TimelineItem v) => v.category;
  static const Field<TimelineItem, String> _f$category =
      Field('category', _$category);
  static List<String> _$links(TimelineItem v) => v.links;
  static const Field<TimelineItem, List<String>> _f$links =
      Field('links', _$links);

  @override
  final MappableFields<TimelineItem> fields = const {
    #title: _f$title,
    #date: _f$date,
    #description: _f$description,
    #category: _f$category,
    #links: _f$links,
  };

  static TimelineItem _instantiate(DecodingData data) {
    return TimelineItem(
        title: data.dec(_f$title),
        date: data.dec(_f$date),
        description: data.dec(_f$description),
        category: data.dec(_f$category),
        links: data.dec(_f$links));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin TimelineItemMappable {
  @override
  bool operator ==(Object other) {
    return TimelineItemMapper.ensureInitialized()
        .equalsValue(this as TimelineItem, other);
  }

  @override
  int get hashCode {
    return TimelineItemMapper.ensureInitialized()
        .hashValue(this as TimelineItem);
  }
}

class TimelineDataMapper extends ClassMapperBase<TimelineData> {
  TimelineDataMapper._();

  static TimelineDataMapper? _instance;
  static TimelineDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimelineDataMapper._());
      TimelineItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TimelineData';

  static List<TimelineItem> _$timelineItems(TimelineData v) => v.timelineItems;
  static const Field<TimelineData, List<TimelineItem>> _f$timelineItems =
      Field('timelineItems', _$timelineItems);

  @override
  final MappableFields<TimelineData> fields = const {
    #timelineItems: _f$timelineItems,
  };

  static TimelineData _instantiate(DecodingData data) {
    return TimelineData(timelineItems: data.dec(_f$timelineItems));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin TimelineDataMappable {
  @override
  bool operator ==(Object other) {
    return TimelineDataMapper.ensureInitialized()
        .equalsValue(this as TimelineData, other);
  }

  @override
  int get hashCode {
    return TimelineDataMapper.ensureInitialized()
        .hashValue(this as TimelineData);
  }
}
