part of 'cubit.dart';

@immutable
class ProjectsState extends Equatable {
  final List<Project>? data;
  final String? message;

  const ProjectsState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class ProjectsDefault extends ProjectsState {}

@immutable
class ProjectsFetchLoading extends ProjectsState {
  const ProjectsFetchLoading() : super();
}

@immutable
class ProjectsFetchSuccess extends ProjectsState {
  const ProjectsFetchSuccess({List<Project>? data}) : super(data: data);
}

@immutable
class ProjectsFetchFailed extends ProjectsState {
  const ProjectsFetchFailed({String? message}) : super(message: message);
}
