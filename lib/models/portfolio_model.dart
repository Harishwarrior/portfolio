class PortfolioData {
  final String name;
  final String availabilityBadge;
  final String heroText;
  final String availabilityMessage;
  final String profileImage;
  final List<WorkExperience> workExperience;
  final List<SocialLink> socialLinks;

  PortfolioData({
    required this.name,
    required this.availabilityBadge,
    required this.heroText,
    required this.availabilityMessage,
    required this.profileImage,
    required this.workExperience,
    required this.socialLinks,
  });

  factory PortfolioData.fromJson(Map<String, dynamic> json) {
    return PortfolioData(
      name: json['name'] as String,
      availabilityBadge: json['availabilityBadge'] as String,
      heroText: json['heroText'] as String,
      availabilityMessage: json['availabilityMessage'] as String,
      profileImage: json['profileImage'] as String,
      workExperience: (json['workExperience'] as List)
          .map((exp) => WorkExperience.fromJson(exp as Map<String, dynamic>))
          .toList(),
      socialLinks: (json['socialLinks'] as List)
          .map((link) => SocialLink.fromJson(link as Map<String, dynamic>))
          .toList(),
    );
  }
}

class WorkExperience {
  final String company;
  final String location;
  final String dateRange;
  final String description;
  final String icon;
  final String type;

  WorkExperience({
    required this.company,
    required this.location,
    required this.dateRange,
    required this.description,
    required this.icon,
    required this.type,
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) {
    return WorkExperience(
      company: json['company'] as String,
      location: json['location'] as String,
      dateRange: json['dateRange'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      type: json['type'] as String,
    );
  }
}

class SocialLink {
  final String name;
  final String url;
  final String icon;
  final String color;

  SocialLink({
    required this.name,
    required this.url,
    required this.icon,
    required this.color,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      name: json['name'] as String,
      url: json['url'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
    );
  }
}
