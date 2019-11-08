import 'package:petvac/app/pages/vacinas/vacinas_repository.dart';
import 'package:petvac/app/pages/vacinas/vacinas_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class VacinasModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => VacinasBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => VacinasRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<VacinasModule>.of();
}
