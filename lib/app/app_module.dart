import 'package:petvac/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:petvac/app/app_widget.dart';
import 'package:petvac/app/pages/pettipos/pettipos_repository.dart';
import 'package:petvac/app/pages/vacinas/vacinas_repository.dart';

import 'pages/pets/pets_repository.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => VacinasRepository()),
    Dependency((i) => PetsRepository()),
    Dependency((i) => PetTiposRepository()),
  ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
