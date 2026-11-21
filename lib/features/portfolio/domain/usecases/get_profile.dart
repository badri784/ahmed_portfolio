import '../entities/profile.dart';
import '../repositories/portfolio_repository.dart';

class GetProfile {
  const GetProfile(this._repository);
  final PortfolioRepository _repository;

  Future<Profile> call() => _repository.getProfile();
}
