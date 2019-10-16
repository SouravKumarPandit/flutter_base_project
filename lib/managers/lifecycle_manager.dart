import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/services/stoppable_service.dart';
/// Stop and start long running services
class LifeCycleManager extends StatefulWidget {
  final Widget child;
  LifeCycleManager({Key key, this.child}) : super(key: key);

  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  List<StoppableService> servicesToManage = [
//todo add services here and extend to stoppable service eg. $BackgroundFetchService
//    locator<>(),
//    locator<BackgroundFetchService>(),
  ];

  // Get all services

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    servicesToManage.forEach((service) {
      if (state == AppLifecycleState.resumed) {
        service.start();
      } else {
        service.stop();
      }
    });
  }
}


/*
*
class BackgroundFetchService extends StoppableService {
  @override
  void start() {
    super.start();

    // Start listeneing
    print('BackgroundFetchService Started $serviceStopped');
  }

  @override
  void stop() {
    super.stop();

    // stop listening
    print('BackgroundFetchService Stopped $serviceStopped');
  }
}*/