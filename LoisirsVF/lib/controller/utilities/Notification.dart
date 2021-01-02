import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' show File, Platform;
import 'package:http/http.dart' as http;

import 'package:rxdart/subjects.dart';

class NotificationPlugin {
  //
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final BehaviorSubject<ReceivedNotification>
  didReceivedLocalNotificationSubject =
  BehaviorSubject<ReceivedNotification>();
  var initializationSettings;

  NotificationPlugin._() {
    init();
  }

  init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _requestIOSPermission();
    }
    initializePlatformSpecifics();
  }

  initializePlatformSpecifics() {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        ReceivedNotification receivedNotification = ReceivedNotification(
            id: id, title: title, body: body, payload: payload);
        didReceivedLocalNotificationSubject.add(receivedNotification);
      },
    );

    initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
  }

  _requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(
      alert: false,
      badge: true,
      sound: true,
    );
  }

  setListenerForLowerVersions(Function onNotificationInLowerVersions) {
    didReceivedLocalNotificationSubject.listen((receivedNotification) {
      onNotificationInLowerVersions(receivedNotification);
    });
  }

  setOnNotificationClick(Function onNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
          onNotificationClick(payload);
        });
  }

  Future<void> showNotification() async {
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID 1',
      'Notification Reservation',
      "CHANNEL_DESCRIPTION 1",
      enableLights: true,
      color: const Color.fromARGB(100, 250, 250, 250),
      ledColor: const Color.fromARGB(255, 255, 255, 0),
      ledOnMs: 1000,
      ledOffMs: 500,
      importance: Importance.Max,
      priority: Priority.High,
      playSound: true,
      timeoutAfter: 300000,
      styleInformation: BigTextStyleInformation(''),
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
    NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Reservation',
      'Il vous reste 5min pour annuler votre reservation, Au dela de ces 5min vous serez pénalisé si vous ne vous presentez pas!',
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }Future<void> scheduleNotificationAlert(DateTime dateTime,String cre) async {
    String datestr=dateTime.toString().split(" ")[0];
    datestr=datestr.replaceAll("-", "");
    print("datetimeeee $datestr");
    cre = cre +"0000";
    print("creneauuu $cre");
    String temp=datestr+"T"+cre;
    dateTime=DateTime.parse(temp);
    print("datetimefinall : $dateTime");
    var scheduleNotificationDateTime =dateTime.subtract(Duration(minutes: 5));
    print("scheduled : $scheduleNotificationDateTime");
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID 1',
      'Notification Reservation',
      "CHANNEL_DESCRIPTION 1",
      enableLights: true,
      color: const Color.fromARGB(100, 250, 250, 250),
      ledColor: const Color.fromARGB(255, 255, 255, 0),
      ledOnMs: 1000,
      ledOffMs: 500,
      importance: Importance.Max,
      priority: Priority.High,
      playSound: true,
      timeoutAfter: 300000,
      styleInformation: BigTextStyleInformation(''),
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      androidChannelSpecifics,
      iosChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.schedule(
      0,
      'Reservation',
      'Il vous reste 5min pour votre reservation!',
      scheduleNotificationDateTime,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }

  Future<void> scheduleNotificationCancel(DateTime dateTime,String cre) async {
    String datestr=dateTime.toString().split(" ")[0];
    datestr=datestr.replaceAll("-", "");
    print("datetimeeee $datestr");
    cre = cre +":00:00";
    print("creneauuu $cre");
    String temp=datestr+" "+cre;
    dateTime=DateTime.parse(temp);
    print("datetimefinall : $dateTime");
    var scheduleNotificationDateTime =dateTime.subtract(Duration(hours: 1,minutes: 5));
    print("scheduled : $scheduleNotificationDateTime");
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID 2',
      'Notification Reservation Cancel',
      "CHANNEL_DESCRIPTION 2",
      enableLights: true,
      color: const Color.fromARGB(100, 250, 250, 250),
      ledColor: const Color.fromARGB(255, 255, 255, 0),
      ledOnMs: 1000,
      ledOffMs: 500,
      importance: Importance.Max,
      priority: Priority.High,
      playSound: true,
      timeoutAfter: 300000,
      styleInformation: BigTextStyleInformation(''),
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      androidChannelSpecifics,
      iosChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.schedule(
      1,
      'Reservation',
      'Il vous reste 5min pour annuler votre reservation, Au dela de ces 5min vous serez pénalisé si vous ne vous presentez pas!',
      scheduleNotificationDateTime,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }
}

NotificationPlugin notificationPlugin = NotificationPlugin._();

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}
