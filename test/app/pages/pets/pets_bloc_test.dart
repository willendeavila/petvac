import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/pets/pets_bloc.dart';
import 'package:petvac/app/pages/pets/pets_module.dart';

void main() {
  initModule(PetsModule());
  PetsBloc bloc;

  setUp(() {
    bloc = PetsModule.to.bloc<PetsBloc>();
  });

  group('PetsBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<PetsBloc>());
    });
  });
}
