import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/pettipos/pettipos_page.dart';

main() {
  testWidgets('PettiposPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(PetTiposPage(title: 'Pettipos')));
    final titleFinder = find.text('Pettipos');
    expect(titleFinder, findsOneWidget);
  });
}
