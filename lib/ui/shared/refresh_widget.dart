import 'package:flutter/material.dart';

class RefreshWidget extends StatelessWidget {
  final Widget child;

  RefreshWidget({this.child});

  Widget build(context) {
//    final bloc = locator<DialogService>();

    return RefreshIndicator(
      child: child,
      onRefresh: () async {
//        await bloc.clearCache();
//        await bloc.fetchTopIds();
      },
    );
  }
}
