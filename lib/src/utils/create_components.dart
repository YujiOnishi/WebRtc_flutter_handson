import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
/*
MIT License

Copyright (c) 2019 Qianze Zhang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

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
