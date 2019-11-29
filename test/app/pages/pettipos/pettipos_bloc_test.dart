import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/pettipos/pettipos_bloc.dart';
import 'package:petvac/app/pages/pettipos/pettipos_module.dart';

void main() {
  initModule(PettiposModule());
  PetTiposBloc bloc;

  setUp(() {
    bloc = PettiposModule.to.bloc<PetTiposBloc>();
  });

  group('PettiposBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<PetTiposBloc>());
    });
  });
}
