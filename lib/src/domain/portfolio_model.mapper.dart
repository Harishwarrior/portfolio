// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'portfolio_model.dart';

class PortfolioDataMapper extends ClassMapperBase<PortfolioData> {
  PortfolioDataMapper._();

  static PortfolioDataMapper? _instance;
  static PortfolioDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PortfolioDataMapper._());
      WorkExperienceMapper.ensureInitialized();
      SocialLinkMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PortfolioData';

  static String _$name(PortfolioData v) => v.name;
  static const Field<PortfolioData, String> _f$name = Field('name', _$name);
  static String _$availabilityBadge(PortfolioData v) => v.availabilityBadge;
  static const Field<PortfolioData, String> _f$availabilityBadge =
      Field('availabilityBadge', _$availabilityBadge);
  static String _$heroText(PortfolioData v) => v.heroText;
  static const Field<PortfolioData, String> _f$heroText =
      Field('heroText', _$heroText);
  static String _$availabilityMessage(PortfolioData v) => v.availabilityMessage;
  static const Field<PortfolioData, String> _f$availabilityMessage =
      Field('availabilityMessage', _$availabilityMessage);
  static String _$profileImage(PortfolioData v) => v.profileImage;
  static const Field<PortfolioData, String> _f$profileImage =
      Field('profileImage', _$profileImage);
  static List<WorkExperience> _$workExperience(PortfolioData v) =>
      v.workExperience;
  static const Field<PortfolioData, List<WorkExperience>> _f$workExperience =
      Field('workExperience', _$workExperience);
  static List<SocialLink> _$socialLinks(PortfolioData v) => v.socialLinks;
  static const Field<PortfolioData, List<SocialLink>> _f$socialLinks =
      Field('socialLinks', _$socialLinks);

  @override
  final MappableFields<PortfolioData> fields = const {
    #name: _f$name,
    #availabilityBadge: _f$availabilityBadge,
    #heroText: _f$heroText,
    #availabilityMessage: _f$availabilityMessage,
    #profileImage: _f$profileImage,
    #workExperience: _f$workExperience,
    #socialLinks: _f$socialLinks,
  };

  static PortfolioData _instantiate(DecodingData data) {
    return PortfolioData(
        name: data.dec(_f$name),
        availabilityBadge: data.dec(_f$availabilityBadge),
        heroText: data.dec(_f$heroText),
        availabilityMessage: data.dec(_f$availabilityMessage),
        profileImage: data.dec(_f$profileImage),
        workExperience: data.dec(_f$workExperience),
        socialLinks: data.dec(_f$socialLinks));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin PortfolioDataMappable {
  @override
  bool operator ==(Object other) {
    return PortfolioDataMapper.ensureInitialized()
        .equalsValue(this as PortfolioData, other);
  }

  @override
  int get hashCode {
    return PortfolioDataMapper.ensureInitialized()
        .hashValue(this as PortfolioData);
  }
}

class WorkExperienceMapper extends ClassMapperBase<WorkExperience> {
  WorkExperienceMapper._();

  static WorkExperienceMapper? _instance;
  static WorkExperienceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WorkExperienceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WorkExperience';

  static String _$company(WorkExperience v) => v.company;
  static const Field<WorkExperience, String> _f$company =
      Field('company', _$company);
  static String _$location(WorkExperience v) => v.location;
  static const Field<WorkExperience, String> _f$location =
      Field('location', _$location);
  static String _$dateRange(WorkExperience v) => v.dateRange;
  static const Field<WorkExperience, String> _f$dateRange =
      Field('dateRange', _$dateRange);
  static String _$description(WorkExperience v) => v.description;
  static const Field<WorkExperience, String> _f$description =
      Field('description', _$description);
  static String _$icon(WorkExperience v) => v.icon;
  static const Field<WorkExperience, String> _f$icon = Field('icon', _$icon);
  static String _$type(WorkExperience v) => v.type;
  static const Field<WorkExperience, String> _f$type = Field('type', _$type);

  @override
  final MappableFields<WorkExperience> fields = const {
    #company: _f$company,
    #location: _f$location,
    #dateRange: _f$dateRange,
    #description: _f$description,
    #icon: _f$icon,
    #type: _f$type,
  };

  static WorkExperience _instantiate(DecodingData data) {
    return WorkExperience(
        company: data.dec(_f$company),
        location: data.dec(_f$location),
        dateRange: data.dec(_f$dateRange),
        description: data.dec(_f$description),
        icon: data.dec(_f$icon),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin WorkExperienceMappable {
  @override
  bool operator ==(Object other) {
    return WorkExperienceMapper.ensureInitialized()
        .equalsValue(this as WorkExperience, other);
  }

  @override
  int get hashCode {
    return WorkExperienceMapper.ensureInitialized()
        .hashValue(this as WorkExperience);
  }
}

class SocialLinkMapper extends ClassMapperBase<SocialLink> {
  SocialLinkMapper._();

  static SocialLinkMapper? _instance;
  static SocialLinkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SocialLinkMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SocialLink';

  static String _$name(SocialLink v) => v.name;
  static const Field<SocialLink, String> _f$name = Field('name', _$name);
  static String _$url(SocialLink v) => v.url;
  static const Field<SocialLink, String> _f$url = Field('url', _$url);
  static String _$icon(SocialLink v) => v.icon;
  static const Field<SocialLink, String> _f$icon = Field('icon', _$icon);
  static String _$color(SocialLink v) => v.color;
  static const Field<SocialLink, String> _f$color = Field('color', _$color);

  @override
  final MappableFields<SocialLink> fields = const {
    #name: _f$name,
    #url: _f$url,
    #icon: _f$icon,
    #color: _f$color,
  };

  static SocialLink _instantiate(DecodingData data) {
    return SocialLink(
        name: data.dec(_f$name),
        url: data.dec(_f$url),
        icon: data.dec(_f$icon),
        color: data.dec(_f$color));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin SocialLinkMappable {
  @override
  bool operator ==(Object other) {
    return SocialLinkMapper.ensureInitialized()
        .equalsValue(this as SocialLink, other);
  }

  @override
  int get hashCode {
    return SocialLinkMapper.ensureInitialized().hashValue(this as SocialLink);
  }
}
