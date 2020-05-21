import 'dart:convert';

import 'package:xml2json/xml2json.dart';

class HelperModel {
  converxmltojson(String body) {
    final xml2json = Xml2Json();
    xml2json.parse(body);
    var jsonData = xml2json.toParker();
    return json.decode(jsonData)["soap-env:Envelope"]["soap-env:Body"];
  }
}
