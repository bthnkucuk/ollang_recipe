import 'my_media_query.dart';

/// Yatay uzunluklar için w:
/// Dikey uzunluklat için h:
/// BorderRadius için w:
extension WidgetsScale on num {
  double get w => this * (MyMediaQuery.width / 430);
  double get h => this * (MyMediaQuery.height / 932);
}
