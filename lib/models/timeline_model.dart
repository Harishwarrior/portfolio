class TimelineItem {
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

  factory TimelineItem.fromJson(Map<String, dynamic> json) {
    return TimelineItem(
      title: json['title'] as String,
      date: json['date'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      links: (json['links'] as List<dynamic>)
          .map((link) => link as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'description': description,
      'category': category,
      'links': links,
    };
  }
}

class TimelineData {
  final List<TimelineItem> timelineItems;

  TimelineData({
    required this.timelineItems,
  });

  factory TimelineData.fromJson(Map<String, dynamic> json) {
    return TimelineData(
      timelineItems: (json['timelineItems'] as List)
          .map((item) => TimelineItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timelineItems': timelineItems.map((item) => item.toJson()).toList(),
    };
  }
}
