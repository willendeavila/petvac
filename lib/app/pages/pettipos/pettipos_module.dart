import 'package:petvac/app/pages/pettipos/pettipos_repository.dart';
import 'package:petvac/app/pages/pettipos/pettipos_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PettiposModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PetTiposBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => PetTiposRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<PettiposModule>.of();
}
