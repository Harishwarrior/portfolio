import 'package:dart_mappable/dart_mappable.dart';

part 'portfolio_model.mapper.dart';

@MappableClass()
class PortfolioData with PortfolioDataMappable {
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
}

@MappableClass()
class WorkExperience with WorkExperienceMappable {
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
}

@MappableClass()
class SocialLink with SocialLinkMappable {
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
}
