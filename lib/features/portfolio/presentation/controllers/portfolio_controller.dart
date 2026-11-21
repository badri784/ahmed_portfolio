import 'package:flutter/foundation.dart';

import '../../domain/entities/profile.dart';
import '../../domain/entities/project.dart';
import '../../domain/usecases/get_profile.dart';
import '../../domain/usecases/get_projects.dart';

enum LoadStatus { loading, loaded, failure }

class PortfolioController extends ChangeNotifier {
  PortfolioController({required GetProfile getProfile, required GetProjects getProjects})
      : _getProfile = getProfile,
        _getProjects = getProjects;

  final GetProfile _getProfile;
  final GetProjects _getProjects;

  LoadStatus status = LoadStatus.loading;
  Profile? profile;
  List<Project> projects = const [];
  String? error;

  Future<void> load() async {
    status = LoadStatus.loading;
    notifyListeners();
    try {
      profile = await _getProfile();
      projects = await _getProjects();
      status = LoadStatus.loaded;
    } catch (e) {
      error = e.toString();
      status = LoadStatus.failure;
    }
    notifyListeners();
  }
}
