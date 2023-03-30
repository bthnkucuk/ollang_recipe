import 'my_media_query.dart';

///[WidgetsScale] is a extension on [num] that allows you to scale width and height for compitable with different screen sizes
extension WidgetsScale on num {
  double get w => this * (MyMediaQuery.width / 430);
  double get h => this * (MyMediaQuery.height / 932);
}
