import '../entities/profile.dart';
import '../entities/project.dart';

abstract interface class PortfolioRepository {
  Future<Profile> getProfile();
  Future<List<Project>> getProjects();
}
