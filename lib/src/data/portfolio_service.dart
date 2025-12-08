import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:dart_mappable/dart_mappable.dart';
import '../domain/portfolio_model.dart';
import '../gen/assets.gen.dart';

class PortfolioService {
  static Future<PortfolioData> loadPortfolioData() async {
    try {
      final String jsonString = await rootBundle.loadString(
        Assets.data.portfolio,
      );
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      return MapperContainer.globals.fromMap<PortfolioData>(jsonData);
    } catch (e) {
      throw Exception('Failed to load portfolio data: $e');
    }
  }
}
