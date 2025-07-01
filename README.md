<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# kakao_adfit_web

[![pub package](https://img.shields.io/pub/v/kakao_adfit_web.svg)](https://pub.dev/packages/kakao_adfit_web)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

카카오 애드핏(Kakao Adfit) 배너 광고를 Flutter Web에서 사용할 수 있게 해주는 **비공식** 패키지입니다.

## 🚨 중요 사항

**⚠️ 이 패키지는 Flutter Web (HTML/CanvasKit)에서만 동작합니다.**
- **WebAssembly(WASM)에서는 작동하지 않습니다.** (원인 분석 중)

  - 해당 패키지는 `package:web`을 사용 중으로 WASM 빌드 자체에는 문제가 없으나,<br> WASM 빌드 실행시에만 '연결을 거부했습니다.' 오류와 함께 빈 위젯이 나타나는 문제가 있습니다.<br> CORS 체크를 비활성화해도 나타나는 것을 보아 다른 헤더의 문제로 추정되나 확인해보지 못했습니다. 

- Android, iOS 등 모바일 플랫폼에서는 빈 위젯이 표시됩니다. (의도됨)

  - 모바일의 경우 `kakao_adfit` 패키지 사용을 고려해주세요.

- Flutter SDK 3.27.4 (HTML/CanvasKit) 및 3.32.5 (CanvasKit)에서 테스트 완료

## 📦 설치

`pubspec.yaml` 파일에 패키지를 추가하세요:

```yaml
dependencies:
  kakao_adfit_web: ^0.0.1
```

그리고 패키지를 설치하세요:

```bash
flutter pub get
```

## 📐 지원되는 배너 사이즈

카카오 애드핏에서 지원하는 표준 배너 사이즈만 사용할 수 있습니다:

| 사이즈 | 설명 | 사용 예시 |
|-------|------|-----------|
| **320 x 50** | 모바일용 작은 띠배너형 | `AdfitBannerWidget(adUnit: 'YOUR_ID', width: 320, height: 50)` |
| **320 x 100** | 모바일용 가로롤 채우는 직사각형 | `AdfitBannerWidget(adUnit: 'YOUR_ID', width: 320, height: 100)` |
| **300 x 250** | PC/M 겸용 정사각형에 가까운 직사각형 | `AdfitBannerWidget(adUnit: 'YOUR_ID', width: 300, height: 250)` |
| **250 x 250** | PC/M 정사각형 | `AdfitBannerWidget(adUnit: 'YOUR_ID', width: 250, height: 250)` |
| **728 x 90** | PC용 가로로 긴 직사각형 | `AdfitBannerWidget(adUnit: 'YOUR_ID', width: 728, height: 90)` |
| **160 x 600** | PC용 세로로 긴 직사각형 | `AdfitBannerWidget(adUnit: 'YOUR_ID', width: 160, height: 600)` |

> **⚠️ 중요**: 위에 명시된 사이즈 외의 값은 사용하지 마십시오.

## 🚀 사용 방법

```dart
import 'package:flutter/material.dart';
import 'package:kakao_adfit_web/kakao_adfit_web.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카카오 애드핏 예제'),
      ),
      body: Center(
        child: AdfitBannerWidget(
          adUnit: 'YOUR_AD_UNIT_ID', // 카카오 애드핏에서 발급받은 광고 단위 ID
          width: 320,
          height: 50,
        ),
      ),
    );
  }
}
```

## 🔧 카카오 애드핏 설정

1. [카카오 애드핏 콘솔](https://adfit.kakao.com/)에 로그인합니다.
2. 새 광고 단위를 생성합니다.
3. **웹** 플랫폼을 선택합니다.
4. 생성된 광고 단위 ID를 `adUnit` 매개변수에 입력합니다.

## 🔍 문제 해결

### 광고가 표시되지 않는 경우

1. **광고 단위 ID 확인**: 올바른 광고 단위 ID를 입력했는지 확인하세요.
2. **웹 환경 확인**: Flutter Web에서 실행 중인지 확인하세요.
3. **네트워크 연결**: 인터넷 연결 상태를 확인하세요.
4. **콘솔 로그**: 브라우저 개발자 도구의 콘솔에서 오류 메시지를 확인하세요.
5. **광고 차단 확인**: 브라우저/DNS 등의 광고 차단 기능이 켜져 있는지 확인하세요.

### 개발자 도구에서 확인 가능한 로그

패키지는 디버깅을 위해 다음과 같은 로그를 디버그 모드에서만 출력합니다:

```
AdfitBannerWidget: 초기화 시작 - tagID: kakao_adfit_12345
AdfitBannerWidget: HTML 컨테이너 생성 완료
AdfitBannerWidget: ba.min.js 로딩 성공
AdfitBannerWidget: ViewFactory 등록 완료
```

## 📝 예제

더 자세한 사용 예제는 [example](example/) 폴더를 참조하세요.

예제 실행 방법:

```bash
cd example
flutter pub get
flutter run -d chrome
```

## 🤝 기여하기

이슈 리포트나 Pull Request는 언제나 환영합니다!

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다.

## 🔗 링크

- [카카오 애드핏 공식 문서](https://developers.kakao.com/docs/latest/ko/adfit/common)
- [Flutter Web 공식 문서](https://docs.flutter.dev/platform-integration/web)
- [패키지 홈페이지](https://github.com/kjm0202/kakao_adfit_web)

## 📄 고지

* 본 패키지의 개발자는 카카오(Kakao)와 관련이 없으며, 카카오(Kakao) 및 애드핏(Adfit)의 모든 상표권은 (주)카카오에 있습니다.
* 본 패키지는 (주)카카오의 공식 패키지가 아니며, 해당 패키지를 사용함으로써 발생하는 모든 문제나 불이익 등의 책임 주체는 사용자임을 명시합니다.

**Made with ❤️ for Flutter Web developers**
