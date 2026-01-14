import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import '../domain/portfolio_model.dart' as portfolio_models;
import '../providers/portfolio_provider.dart';
import '../gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Consumer(
        builder: (context, ref, child) {
          final portfolioAsync = ref.watch(portfolioDataProviderProvider);

          return portfolioAsync.when(
            loading: () => const _LoadingIndicator(),
            error: (error, stack) => _ErrorDisplay(error: error),
            data: (portfolioData) {
              return _PortfolioView(
                portfolioData: portfolioData,
                scrollController: _scrollController,
              );
            },
          );
        },
      ),
    );
  }

  String _calculateExperience() {
    final startDate = DateTime(2021, 8); // August 2021
    final currentDate = DateTime.now();

    int years = currentDate.year - startDate.year;
    int months = currentDate.month - startDate.month;

    if (months < 0) {
      years--;
      months += 12;
    }

    if (months == 0) {
      return '$years';
    } else {
      return '$years.$months';
    }
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE8F54D)),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading Portfolio...',
            style: GoogleFonts.inter(
              color: const Color(0xFF6B7280),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorDisplay extends StatelessWidget {
  final Object error;

  const _ErrorDisplay({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text(
            'Error loading portfolio data',
            style: GoogleFonts.inter(color: Colors.red),
          ),
          Text(
            error.toString(),
            style: GoogleFonts.inter(color: Colors.red, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _PortfolioView extends StatelessWidget {
  final portfolio_models.PortfolioData portfolioData;
  final ScrollController scrollController;

  const _PortfolioView({
    required this.portfolioData,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return WebSmoothScroll(
      controller: scrollController,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            _Header(portfolioData: portfolioData),
            _HeroSection(
              portfolioData: portfolioData,
              experienceCalculator: () =>
                  _HomeScreenState()._calculateExperience(),
            ),
            _ProjectShowcaseSection(portfolioData: portfolioData),
            _SocialLinksSection(portfolioData: portfolioData),
            _Footer(portfolioData: portfolioData),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final portfolio_models.PortfolioData portfolioData;

  const _Header({required this.portfolioData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                portfolioData.name,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F54D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('⚡', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 6),
                    Text(
                      portfolioData.availabilityBadge,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => context.go('/journey'),
                child: Text(
                  'Journey',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () async {
                  final uri = Uri.parse('mailto:harishanbalagandev@gmail.com');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                ),
                child: Text(
                  'Send me an email',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final portfolio_models.PortfolioData portfolioData;
  final String Function() experienceCalculator;

  const _HeroSection({
    required this.portfolioData,
    required this.experienceCalculator,
  });

  @override
  Widget build(BuildContext context) {
    final experienceYears = experienceCalculator();
    final heroText = portfolioData.heroText.replaceAll(
      '{experience}',
      experienceYears,
    );

    return Container(
      color: const Color(0xFFF8F8F8),
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFE0E0E0), width: 2),
                image: DecorationImage(
                  image: AssetImage(Assets.images.harish.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 48),
            Text(
              heroText,
              style: GoogleFonts.inter(
                fontSize: 48,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF1A1A1A),
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () => context.go('/journey'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A1A),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                'My Journey',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialLinksSection extends StatelessWidget {
  final portfolio_models.PortfolioData portfolioData;

  const _SocialLinksSection({required this.portfolioData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F8F8),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
      child: Column(
        children: [
          Text(
            'Find me elsewhere',
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 80),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: portfolioData.socialLinks.map((link) {
              return _SocialLinkCard(link: link);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectShowcaseSection extends StatelessWidget {
  final portfolio_models.PortfolioData portfolioData;

  const _ProjectShowcaseSection({required this.portfolioData});

  @override
  Widget build(BuildContext context) {
    // Filter only work experiences (not education)
    final projects = portfolioData.workExperience
        .where((exp) => exp.type == 'work')
        .take(3)
        .toList();

    return Container(
      color: const Color(0xFFF8F8F8),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
      child: Column(
        children: [
          Text(
            'Recent Work',
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 80),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: projects.map((project) {
              return _ProjectCard(project: project);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final portfolio_models.PortfolioData portfolioData;

  const _Footer({required this.portfolioData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1F1F1F),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
      child: Center(
        child: Column(
          children: [
            Text(
              'Get in touch',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF9CA3AF),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                final messenger = ScaffoldMessenger.of(context);
                await Clipboard.setData(
                  const ClipboardData(text: 'harishanbalagandev@gmail.com'),
                );
                messenger.showSnackBar(
                  SnackBar(
                    content: Text(
                      'Email copied to clipboard',
                      style: GoogleFonts.inter(),
                    ),
                    backgroundColor: const Color(0xFF1A1A1A),
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 18,
                      color: Color(0xFF9CA3AF),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'harishanbalagandev@gmail.com',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF9CA3AF),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.content_copy,
                      size: 16,
                      color: Color(0xFF9CA3AF),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF2B2B2B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F54D),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.flag,
                      size: 24,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current availability',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        portfolioData.availabilityMessage,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF9CA3AF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final portfolio_models.WorkExperience project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 360,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.15 : 0.08),
              blurRadius: _isHovered ? 30 : 20,
              offset: Offset(0, _isHovered ? 12 : 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.project.icon == 'work' ? Icons.business : Icons.school,
                size: 28,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.project.company,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.project.location,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F54D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.project.dateRange,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
            ),
            if (widget.project.description.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                widget.project.description,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6B7280),
                  height: 1.6,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SocialLinkCard extends StatefulWidget {
  final portfolio_models.SocialLink link;

  const _SocialLinkCard({required this.link});

  @override
  State<_SocialLinkCard> createState() => _SocialLinkCardState();
}

class _SocialLinkCardState extends State<_SocialLinkCard> {
  bool _isHovered = false;

  SvgGenImage _getSocialIcon(String iconName) {
    switch (iconName) {
      case 'github':
        return Assets.icons.github;
      case 'linkedin':
        return Assets.icons.linkedin;
      case 'x':
        return Assets.icons.x;
      default:
        return Assets.icons.github; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(widget.link.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          decoration: BoxDecoration(
            color: _isHovered
                ? const Color(0xFFEEEEEE)
                : const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _isHovered ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AnimatedScale(
                  scale: _isHovered ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: _getSocialIcon(widget.link.icon).svg(
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Color(
                        int.parse(widget.link.color.replaceFirst('#', '0xFF')),
                      ),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                widget.link.name,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
