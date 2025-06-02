import 'package:coach/art_core/widgets/loading_view.dart';
import 'package:flutter/cupertino.dart';

class AppLoading extends StatelessWidget {
  final Color? color;

  const AppLoading({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoadingView();
  }
}
