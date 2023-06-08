import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_planets/models/json_decode.dart';

class JsonDecodeProvider extends ChangeNotifier {
  String? data;

  List<JsonDecodeModel> galaxyDetails = [];

  Future<void> loadJson() async {
    data = await rootBundle.loadString('lib/json/planet_details.json');

    List decodedList = jsonDecode(data!);

    galaxyDetails = decodedList
        .map(
          (e) => JsonDecodeModel.map(data: e),
        )
        .toList();
  }
}
