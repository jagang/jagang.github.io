library platelist;

import 'package:angular/angular.dart';
import 'dart:html';
import 'dart:convert';

@Component(selector: 'platelist', templateUrl: 'packages/platelist/platelist.html', cssUrl: 'packages/platelist/platelist.css')
class PlateListComponent {
  List<Map> plates;
  @NgOneWay('limit')
  int limit;
  @NgOneWay('bottom')
  bool bottom;

  PlateListComponent() {
    plates = new List();
    if(bottom==null)
      bottom=false;
    new WebsocketUpdate((Map message) {
      if (bottom) {
        if (limit != null && limit <= plates.length)
          plates.removeAt(0);
        plates.add(message);
      } else {
        if (limit != null && limit <= plates.length)
          plates.removeLast();
        plates.insert(0, message);
      }
    });
  }
}

class WebsocketUpdate {
  WebsocketUpdate(void eventHandler(Map)) {
    var ws = new WebSocket("wss://test-arjun.rhcloud.com:8443/plates");
    ws.onMessage.listen((MessageEvent message) => handler(message, eventHandler));
  }
  void handler(MessageEvent message, void eventHandler(Map)) {
    Map messageMap = JSON.decode(message.data);
    eventHandler(messageMap);
  }
}
