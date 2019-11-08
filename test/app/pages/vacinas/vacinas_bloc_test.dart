import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/vacinas/vacinas_bloc.dart';
import 'package:petvac/app/pages/vacinas/vacinas_module.dart';

void main() {
  initModule(VacinasModule());
  VacinasBloc bloc;

  setUp(() {
    bloc = VacinasModule.to.bloc<VacinasBloc>();
  });

  group('VacinasBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<VacinasBloc>());
    });
  });
}
