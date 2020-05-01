import 'package:petvac/app/modules/pettipos/pettipos_repository.dart';
import 'package:petvac/app/modules/pettipos/pettipos_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PettiposModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PettiposBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => PettiposRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<PettiposModule>.of();
}
