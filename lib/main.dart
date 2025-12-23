import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'src/domain/portfolio_model.dart';
import 'src/domain/timeline_model.dart';

import 'src/routing/app_router.dart';

void main() {
  // Initialize dart_mappable mappers
  MapperContainer.globals.use(PortfolioDataMapper.ensureInitialized());
  MapperContainer.globals.use(WorkExperienceMapper.ensureInitialized());
  MapperContainer.globals.use(SocialLinkMapper.ensureInitialized());
  MapperContainer.globals.use(TimelineDataMapper.ensureInitialized());
  MapperContainer.globals.use(TimelineItemMapper.ensureInitialized());

  runApp(const ProviderScope(child: PortfolioApp()));
}

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Harish Anbalagan - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFE8F54D),
          secondary: Color(0xFF1A1A1A),
          surface: Color(0xFFFFFFFF),
          error: Colors.red,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFFFFFFF),
          elevation: 0,
          centerTitle: false,
          titleTextStyle: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE8F54D),
            foregroundColor: const Color(0xFF1A1A1A),
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            textStyle: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF1A1A1A),
            side: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            textStyle: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFFF5F5F5),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
