import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

import '../common/text.dart';
import '../utils/create_components.dart';

class Build {
  var _users;
  var _infoStrings;
  var muted;
  final _onToggleMute;
  final _onCallEnd;
  final _onSwitchCamera;

  Build(this._users, this._infoStrings, this.muted, this._onToggleMute,
      this._onCallEnd, this._onSwitchCamera);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(barTitle),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            viewRows(_users),

            //ボタンの表示
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //ミュートボタン
                  RawMaterialButton(
                    onPressed: _onToggleMute,
                    child: Icon(
                      muted ? Icons.mic_off : Icons.mic,
                      color: muted ? Colors.white : Colors.blueAccent,
                      size: 20.0,
                    ),
                    shape: CircleBorder(),
                    elevation: 2.0,
                    fillColor: muted ? Colors.blueAccent : Colors.white,
                    padding: const EdgeInsets.all(12.0),
                  ),

                  //通話終了ボタン
                  RawMaterialButton(
                    onPressed: () => _onCallEnd(context),
                    child: Icon(
                      Icons.call_end,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    shape: CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.redAccent,
                    padding: const EdgeInsets.all(15.0),
                  ),

                  //フロントカメラ・バックカメラ切り替えボタン
                  RawMaterialButton(
                    onPressed: _onSwitchCamera,
                    child: Icon(
                      Icons.switch_camera,
                      color: Colors.blueAccent,
                      size: 20.0,
                    ),
                    shape: CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.white,
                    padding: const EdgeInsets.all(12.0),
                  )
                ],
              ),
            ),

            //情報の表示
            Container(
              padding: const EdgeInsets.symmetric(vertical: 120),
              child: ListView.builder(
                reverse: true,
                itemCount: _infoStrings.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_infoStrings.isEmpty) {
                    return null;
                  }
                  return Text(
                    _infoStrings[index],
                    style: TextStyle(
                        color: Colors.black,
                        backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
