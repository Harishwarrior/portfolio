import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/portfolio_model.dart';

class PortfolioService {
  static Future<PortfolioData> loadPortfolioData() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/portfolio.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      return PortfolioData.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to load portfolio data: $e');
    }
  }
}
