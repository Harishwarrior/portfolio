import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/timeline_service.dart';
import '../domain/timeline_model.dart';

part 'timeline_provider.g.dart';

@riverpod
class TimelineDataProvider extends _$TimelineDataProvider {
  @override
  Future<TimelineData> build() async {
    final data = await TimelineService.loadTimelineData();
    return data;
  }
}
