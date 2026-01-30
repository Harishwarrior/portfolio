import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return header([
      // Top status bar
      div(classes: 'status-bar', [
        div(classes: 'status-content', [
          div(classes: 'status-indicator', [
            div(classes: 'status-dot', []),
            .text('Available for Work'),
          ]),
          div(classes: 'status-links', [
            a(href: '#contact', [.text('Contact')]),
            .text(' — '),
            a(href: '/resume.pdf', [.text('Resume')]),
          ]),
        ]),
      ]),

      // Hero section
      div(classes: 'hero-section', [
        // Profile info
        div(classes: 'profile-container', [
          div(classes: 'profile-wrapper', [
            img(src: 'images/profile.jpg', alt: 'Profile', classes: 'profile-image'),
            div(classes: 'profile-status-dot', []),
          ]),
          h1(classes: 'profile-name', [.text('Harish Warrior')]),
          p(classes: 'profile-title', [.text('Flutter Developer')]),
        ]),

        // Tagline
        div(classes: 'tagline', [
          p([
            span(classes: 'text-light', [.text('I was ')]),
            span(classes: 'text-bold', [.text('10x developer')]),
            span(classes: 'text-light', [.text(' before ')]),
            span(classes: 'text-bold', [.text('AI')]),
            span(classes: 'text-light', [.text(': built ')]),
            span(classes: 'text-bold', [.text('80+ mobile apps')]),
            span(classes: 'text-light', [.text('.')]),
          ]),
          p([
            span(classes: 'text-light', [.text('Now with ')]),
            span(classes: 'text-bold', [.text('AI')]),
            span(classes: 'text-light', [.text('? I\'m ')]),
            span(classes: 'text-bold', [.text('100x')]),
            span(classes: 'text-light', [.text('.')]),
          ]),
        ]),

        // Social links
        div(classes: 'social-links', [
          a(href: 'https://instagram.com', classes: 'social-link', [
            span(classes: 'social-icon', [.text('📷')]),
            .text('Instagram'),
          ]),
          a(href: 'https://twitter.com', classes: 'social-link', [
            span(classes: 'social-icon', [.text('🐦')]),
            .text('Twitter'),
          ]),
          a(href: 'https://linkedin.com', classes: 'social-link', [
            span(classes: 'social-icon', [.text('💼')]),
            .text('LinkedIn'),
          ]),
          a(href: 'https://youtube.com', classes: 'social-link', [
            span(classes: 'social-icon', [.text('▶️')]),
            .text('YouTube'),
          ]),
          a(href: 'https://github.com/Harishwarrior', classes: 'social-link', [
            span(classes: 'social-icon', [.text('⚙️')]),
            .text('GitHub'),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Base header
    css('header').styles(
      display: .flex,
      flexDirection: .column,
      width: 100.percent,
    ),

    // Status bar
    css('.status-bar').styles(
      backgroundColor: const Color('#D8E8E0'),
      padding: .symmetric(horizontal: 2.rem, vertical: 1.rem),
    ),
    css('.status-content').styles(
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: .center,
      maxWidth: 1200.px,
      margin: .symmetric(horizontal: .auto),
      width: 100.percent,
    ),
    css('.status-indicator').styles(
      display: .flex,
      alignItems: .center,
    ),
    css('.status-dot').styles(
      width: 10.px,
      height: 10.px,
      backgroundColor: const Color('#22C55E'),
      radius: .circular(50.percent),
      margin: .only(right: 8.px),
    ),
    css('.status-links').styles(
      display: .flex,
      alignItems: .center,
    ),
    css('.status-links a').styles(
      color: const Color('#333'),
      textDecoration: TextDecoration(line: .none),
      fontWeight: .w500,
      padding: .symmetric(horizontal: 8.px),
    ),
    css('.status-links a:hover').styles(
      textDecoration: TextDecoration(line: .underline),
    ),

    // Hero section
    css('.hero-section').styles(
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      padding: .all(4.rem),
    ),

    // Profile
    css('.profile-container').styles(
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      padding: .only(bottom: 2.rem),
    ),
    css('.profile-wrapper').styles(
      width: 80.px,
      height: 80.px,
      padding: .only(bottom: 1.rem),
    ),
    css('.profile-image').styles(
      width: 100.percent,
      height: 100.percent,
      radius: .circular(50.percent),
    ),
    css('.profile-status-dot').styles(
      width: 14.px,
      height: 14.px,
      backgroundColor: const Color('#22C55E'),
      radius: .circular(50.percent),
      border: .all(width: 2.px, color: Colors.white),
    ),
    css('.profile-name').styles(
      margin: .zero,
      fontSize: 1.5.rem,
      fontWeight: .w600,
      textAlign: .center,
    ),
    css('.profile-title').styles(
      margin: .symmetric(vertical: 0.25.rem),
      fontSize: 1.rem,
      color: const Color('#666'),
      textAlign: .center,
    ),

    // Tagline
    css('.tagline').styles(
      textAlign: .center,
      fontSize: 1.125.rem,
      maxWidth: 700.px,
      padding: .only(bottom: 2.rem),
    ),
    css('.tagline p').styles(
      margin: .zero,
    ),
    css('.text-light').styles(
      color: const Color('#666'),
    ),
    css('.text-bold').styles(
      color: const Color('#000'),
      fontWeight: .w600,
    ),

    // Social links
    css('.social-links').styles(
      display: .flex,
      flexWrap: .wrap,
      justifyContent: .center,
    ),
    css('.social-link').styles(
      display: .flex,
      alignItems: .center,
      color: const Color('#333'),
      textDecoration: TextDecoration(line: .none),
      fontWeight: .w500,
      fontSize: 0.95.rem,
      padding: .symmetric(horizontal: 16.px, vertical: 10.px),
      backgroundColor: const Color('#F3F4F6'),
      radius: .circular(50.px),
      margin: .symmetric(horizontal: 6.px, vertical: 4.px),
    ),
    css('.social-link:hover').styles(
      backgroundColor: const Color('#E5E7EB'),
    ),
    css('.social-icon').styles(
      fontSize: 1.2.rem,
      margin: .only(right: 8.px),
    ),
  ];
}
