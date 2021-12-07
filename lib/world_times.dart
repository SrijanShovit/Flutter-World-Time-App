import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;         //location name for UI
  String time ='';             //the time in that location
  String flag;             //url to an asset flag icon
  String url;              //location url for an api endpoint
  bool isDay=true;

  WorldTime({required this.url,required this.flag,required this.location});

  //to use await on a custom function Future keyword has to be used
  Future<void> getTime () async {


    //Response object
    //Make Request

    try{

      Response response =await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data =jsonDecode (response.body);      //converting json to map

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDay = now.hour > 5 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print ('caught error :$e');
      time = 'could not get it';

    }


  }
}

