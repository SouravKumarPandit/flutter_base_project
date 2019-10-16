import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/enums/connectivity_status.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final double opacity;

  NetworkSensitive({
    this.child,
    this.opacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi) {
      return child;
    }

    if (connectionStatus == ConnectivityStatus.Cellular) {
      return Opacity(
        opacity: opacity,
        child: child,
      );
    }
    return Opacity(
      opacity: 0.1,
      child: child,
    );
  }


  /*
  Future disconnectedDialog() async {
    var dialogResult = await _dialogService.showDialog(
        title: 'Whoops!',
        description:
            'No Internet connection found.Check\n Your connectuin and try again.');

    if (dialogResult.confirmed) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
    }
  }*/
}
