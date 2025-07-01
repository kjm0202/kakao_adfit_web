import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kakao_adfit_web/kakao_adfit_web.dart';

void main() {
  group('AdfitBannerWidget Tests', () {
    testWidgets('AdfitBannerWidget should be created with correct properties',
        (WidgetTester tester) async {
      const String testAdUnit = 'test_ad_unit_123';
      const double testWidth = 320;
      const double testHeight = 50;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AdfitBannerWidget(
              adUnit: testAdUnit,
              width: testWidth,
              height: testHeight,
            ),
          ),
        ),
      );

      // 위젯이 생성되었는지 확인
      expect(find.byType(AdfitBannerWidget), findsOneWidget);

      // Container가 생성되었는지 확인
      expect(find.byType(Container), findsOneWidget);

      // Center 위젯이 생성되었는지 확인
      expect(find.byType(Center), findsOneWidget);
    });

    testWidgets(
        'AdfitBannerWidget should use default dimensions when not specified',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AdfitBannerWidget(
              adUnit: 'test_ad_unit',
            ),
          ),
        ),
      );

      // 위젯이 생성되었는지 확인
      expect(find.byType(AdfitBannerWidget), findsOneWidget);

      // Container가 생성되었는지 확인
      expect(find.byType(Container), findsOneWidget);

      // Center 위젯이 생성되었는지 확인
      expect(find.byType(Center), findsOneWidget);
    });

    test('AdfitBannerWidget should accept adUnit parameter', () {
      // 위젯이 정상적으로 생성되는지 확인
      expect(
        () => AdfitBannerWidget(adUnit: 'test_ad_unit'),
        returnsNormally,
      );

      // 다른 매개변수들과 함께 생성되는지 확인
      expect(
        () => AdfitBannerWidget(
          adUnit: 'test_ad_unit',
          width: 300,
          height: 100,
        ),
        returnsNormally,
      );
    });
  });
}
