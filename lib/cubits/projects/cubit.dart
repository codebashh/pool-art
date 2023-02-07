import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poolart/models/project.dart';
part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  static ProjectsCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<ProjectsCubit>(context, listen: listen);

  ProjectsCubit() : super(ProjectsDefault());

  final repo = ProjectsRepository();

  Future<void> fetch() async {
    emit(const ProjectsFetchLoading());
    try {
      final data = await repo.fetch();

      emit(ProjectsFetchSuccess(data: data));
    } catch (e) {
      emit(ProjectsFetchFailed(message: e.toString()));
    }
  }
}
