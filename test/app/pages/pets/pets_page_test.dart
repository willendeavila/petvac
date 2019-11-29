import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/pages/pets/pets_page.dart';

main() {
  testWidgets('PetsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PetsPage(title: 'Pets')));
    final titleFinder = find.text('Pets');
    expect(titleFinder, findsOneWidget);
  });
}
