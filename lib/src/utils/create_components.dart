import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

/// Video view wrapper
Widget _videoView(view) {
  return Expanded(child: Container(child: view));
}

/// Video view row wrapper
Widget _expandedVideoRow(List<Widget> views) {
  final wrappedViews = views.map<Widget>(_videoView).toList();
  return Expanded(
    child: Row(
      children: wrappedViews,
    ),
  );
}

/// Video layout wrapper
Widget viewRows(var users) {
  final List<AgoraRenderWidget> views = [
    AgoraRenderWidget(0, local: true, preview: true),
  ];
  users.forEach((int uid) => views.add(AgoraRenderWidget(uid)));
  switch (views.length) {
    case 1:
      return Container(
          child: Column(
        children: <Widget>[_videoView(views[0])],
      ));
    case 2:
      return Container(
          child: Column(
        children: <Widget>[
          _expandedVideoRow([views[0]]),
          _expandedVideoRow([views[1]])
        ],
      ));
    case 3:
      return Container(
          child: Column(
        children: <Widget>[
          _expandedVideoRow(views.sublist(0, 2)),
          _expandedVideoRow(views.sublist(2, 3))
        ],
      ));
    case 4:
      return Container(
          child: Column(
        children: <Widget>[
          _expandedVideoRow(views.sublist(0, 2)),
          _expandedVideoRow(views.sublist(2, 4))
        ],
      ));
    default:
  }
  return Container();
}
