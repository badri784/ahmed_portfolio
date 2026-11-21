import '../../features/portfolio/data/datasources/portfolio_local_data_source.dart';
import '../../features/portfolio/data/repositories/portfolio_repository_impl.dart';
import '../../features/portfolio/domain/usecases/get_profile.dart';
import '../../features/portfolio/domain/usecases/get_projects.dart';
import '../../features/portfolio/presentation/controllers/portfolio_controller.dart';

/// The only place that knows about every layer.
PortfolioController buildPortfolioController() {
  const dataSource = PortfolioLocalDataSource();
  const repository = PortfolioRepositoryImpl(dataSource);
  return PortfolioController(
    getProfile: const GetProfile(repository),
    getProjects: const GetProjects(repository),
  );
}
