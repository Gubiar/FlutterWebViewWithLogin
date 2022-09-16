import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/UsuarioObj.dart';

class Controller {

  static const bool DEV = true;
  static String url = 'http://192.168.15.19:8080/Contexto/';
  static int resquestDurationSecondsTime = DEV ? 360 : 30;
  static UsuarioObj usuarioLogado = UsuarioObj();

  static Future<String> postLogin(String login, String senha) async {

    String mapToSend = '{"login":"$login","senha":"$senha"}';
    debugPrint('postLogin body $mapToSend');

    try {
      http.Response response = await http.post(
        Uri.parse('${url}app/login.json'),
        headers: {
          "Content-Type": "application/json",
        },
        body: mapToSend,

      ).timeout(
          Duration(seconds: resquestDurationSecondsTime),
          onTimeout: () => http.Response(
            'timeout',
            408,
          )
      );

      debugPrint('postLogin URL-> ${url}app/login.json\n');
      debugPrint('postLogin CODE-> ${response.statusCode}');
      debugPrint('postLogin response->${response.body}');

      Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData['success'].toString() == 'true') {

        usuarioLogado = UsuarioObj(json: jsonData);
        (await SharedPreferences.getInstance()).setString('token', usuarioLogado.token.toString());
        return 'true';

      } else {
        return jsonData['message'].toString();
      }

    } catch (error) {
      debugPrint('erro postLogin: $error');

      return 'catch';
    }
  }


}