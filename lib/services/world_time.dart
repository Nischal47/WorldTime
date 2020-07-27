import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //Name for UI
  String time; //Time in that location
  String flag; //URL to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offsetHour = data['utc_offset'].substring(1, 3);
      String offsetMinutes = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(
          hours: int.parse(offsetHour), minutes: int.parse(offsetMinutes)));
      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 5 && now.hour < 20 ? true : false;
    } catch (e) {
      print("Error : $e");
    }
  }
}
