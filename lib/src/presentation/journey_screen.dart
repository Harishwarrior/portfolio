import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import '../domain/portfolio_model.dart' as portfolio_models;
import '../domain/timeline_model.dart' as timeline_models;
import 'package:intl/intl.dart';
import '../providers/portfolio_provider.dart';
import '../providers/timeline_provider.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
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
              final timelineAsync = ref.watch(timelineDataProviderProvider);

              return timelineAsync.when(
                loading: () => _JourneyLoadingView(
                  portfolioData: portfolioData,
                  scrollController: _scrollController,
                ),
                error: (error, stack) => _JourneyErrorView(
                  portfolioData: portfolioData,
                  scrollController: _scrollController,
                  error: error,
                ),
                data: (timelineData) {
                  return _JourneyCompleteView(
                    portfolioData: portfolioData,
                    timelineData: timelineData,
                    scrollController: _scrollController,
                  );
                },
              );
            },
          );
        },
      ),
    );
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
            'Loading Journey...',
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
            'Error loading data',
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

class _JourneyLoadingView extends StatelessWidget {
  final portfolio_models.PortfolioData portfolioData;
  final ScrollController scrollController;

  const _JourneyLoadingView({
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
            const Center(
              child: Padding(
                padding: EdgeInsets.all(80.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE8F54D)),
                ),
              ),
            ),
            _Footer(portfolioData: portfolioData),
          ],
        ),
      ),
    );
  }
}

class _JourneyErrorView extends StatelessWidget {
  final portfolio_models.PortfolioData portfolioData;
  final ScrollController scrollController;
  final Object error;

  const _JourneyErrorView({
    required this.portfolioData,
    required this.scrollController,
    required this.error,
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
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: _ErrorDisplay(error: error),
            ),
            _Footer(portfolioData: portfolioData),
          ],
        ),
      ),
    );
  }
}

class _JourneyCompleteView extends StatelessWidget {
  final portfolio_models.PortfolioData portfolioData;
  final timeline_models.TimelineData timelineData;
  final ScrollController scrollController;

  const _JourneyCompleteView({
    required this.portfolioData,
    required this.timelineData,
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
            _JourneyHeroSection(),
            _TimelineSection(timelineData: timelineData),
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
              InkWell(
                onTap: () => context.go('/'),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Color(0xFF1A1A1A),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        portfolioData.name,
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                    ],
                  ),
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
          OutlinedButton(
            onPressed: () async {
              final uri = Uri.parse('mailto:harishanbalagandev@gmail.com');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
    );
  }
}

class _JourneyHeroSection extends StatelessWidget {
  const _JourneyHeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F8F8),
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: Column(
          children: [
            Text(
              'My Journey',
              style: GoogleFonts.inter(
                fontSize: 64,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A1A1A),
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'A timeline of my professional milestones and achievements',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF6B7280),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _TimelineSection extends StatelessWidget {
  final timeline_models.TimelineData timelineData;

  const _TimelineSection({required this.timelineData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F8F8),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              for (int i = 0; i < timelineData.timelineItems.length; i++)
                _TimelineCard(
                  item: timelineData.timelineItems[i],
                  isLast: i == timelineData.timelineItems.length - 1,
                  index: i,
                ),
            ],
          ),
        ),
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

class _TimelineCard extends StatefulWidget {
  final timeline_models.TimelineItem item;
  final bool isLast;
  final int index;

  const _TimelineCard({
    required this.item,
    required this.isLast,
    required this.index,
  });

  @override
  State<_TimelineCard> createState() => _TimelineCardState();
}

class _TimelineCardState extends State<_TimelineCard> {
  final GlobalKey _contentKey = GlobalKey();
  double _contentHeight = 0;

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'work':
        return Icons.work;
      case 'learning':
        return Icons.school;
      case 'opensource':
        return Icons.code;
      case 'community':
        return Icons.groups;
      case 'content':
        return Icons.article;
      case 'event':
        return Icons.event;
      case 'speaking':
        return Icons.mic;
      case 'experiment':
        return Icons.science;
      case 'achievement':
        return Icons.emoji_events;
      case 'milestone':
        return Icons.flag;
      case 'research':
        return Icons.search;
      default:
        return Icons.circle;
    }
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('MMM d, yyyy').format(date);
    } catch (e) {
      return dateStr;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateHeight());
  }

  void _updateHeight() {
    final RenderBox? renderBox =
        _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && mounted) {
      setState(() {
        _contentHeight = renderBox.size.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryIcon = _getCategoryIcon(widget.item.category);
    final double lineHeight = _contentHeight > 0
        ? (_contentHeight + 60).toDouble()
        : 100.0;

    return Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 32),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F54D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _formatDate(widget.item.date),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 56,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        categoryIcon,
                        size: 28,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                    if (!widget.isLast)
                      Container(
                        width: 2,
                        height: lineHeight,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        color: const Color(0xFFE0E0E0),
                      ),
                    if (widget.isLast)
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1A1A1A),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  key: _contentKey,
                  margin: const EdgeInsets.only(left: 32, bottom: 60),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.item.description,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                      if (widget.item.links.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: widget.item.links.map((link) {
                            return InkWell(
                              onTap: () async {
                                final uri = Uri.tryParse(link);
                                if (uri != null && await canLaunchUrl(uri)) {
                                  await launchUrl(
                                    uri,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8F54D),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.link,
                                      size: 14,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'View Post',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF1A1A1A),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
  }
}
