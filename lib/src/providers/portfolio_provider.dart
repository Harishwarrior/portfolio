import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/portfolio_service.dart';
import '../domain/portfolio_model.dart';

part 'portfolio_provider.g.dart';

@riverpod
class PortfolioDataProvider extends _$PortfolioDataProvider {
  @override
  Future<PortfolioData> build() async {
    final data = await PortfolioService.loadPortfolioData();
    return data;
  }
}
