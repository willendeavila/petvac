import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/modules/pettipos/pettipos_bloc.dart';
import 'package:petvac/app/modules/pettipos/pettipos_module.dart';

void main() {
  initModule(PettiposModule());
  PettiposBloc bloc;

  // setUp(() {
  //     bloc = PettiposModule.to.bloc<PettiposBloc>();
  // });

  // group('PettiposBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<PettiposBloc>());
  //   });
  // });
}
