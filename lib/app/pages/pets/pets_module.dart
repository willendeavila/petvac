import 'package:petvac/app/pages/pets/pets_repository.dart';
import 'package:petvac/app/pages/pets/pets_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PetsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PetsBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => PetsRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<PetsModule>.of();
}
