import '../entities/project.dart';
import '../repositories/portfolio_repository.dart';

class GetProjects {
  const GetProjects(this._repository);
  final PortfolioRepository _repository;

  Future<List<Project>> call() => _repository.getProjects();
}
