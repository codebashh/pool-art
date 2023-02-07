part of 'cubit.dart';

class ProjectsRepository {
  Future<List<Project>> fetch() => ProjectsDataProvider.fetch();
}
