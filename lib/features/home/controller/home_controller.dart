import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenDotsBanner extends _$HomeScreenDotsBanner {
  @override
  int build() => 0;
  void setIndex(int index) {
    state = index;
  }
}
