import '../../domain/entities/profile.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_data_source.dart';
import '../models/profile_model.dart';
import '../models/project_model.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  const PortfolioRepositoryImpl(this._dataSource);
  final PortfolioLocalDataSource _dataSource;

  @override
  Future<Profile> getProfile() async =>
      ProfileModel.fromMap(await _dataSource.fetchProfile()).toEntity();

  @override
  Future<List<Project>> getProjects() async {
    final raw = await _dataSource.fetchProjects();
    return raw.map((m) => ProjectModel.fromMap(m).toEntity()).toList();
  }
}
