part of 'cubit.dart';

class ProjectsDataProvider {
  static final firebase = FirebaseFirestore.instance;

  static Future<List<Project>> fetch() async {
    try {
      final projectRef = firebase.collection('projects');
      final raw = await projectRef.get();

      List data = raw.docs;
      List<Project> projects = List.generate(
        data.length,
        (index) => Project.fromMap(data[index].data(), data[index].id),
      );
      return projects;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
