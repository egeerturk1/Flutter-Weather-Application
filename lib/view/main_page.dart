import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hava_durumu/model/weather.dart';
import 'package:http/http.dart' as http;


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  TextEditingController controller1 = TextEditingController();
  final String _apiUrl = "https://api.weatherapi.com/v1/current.json?key=d079cea214d643ae89d140128242606&q=";
  Weather weather = Weather("Istanbul",25.0,"Cloudy","//cdn.weatherapi.com/weather/64x64/day/116.png");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getWeatherFromInternet("Istanbul");
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hava Durumu"),),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: controller1,
                decoration: InputDecoration(
                  hintText: "Şehir ismi giriniz.",
                  hintStyle: TextStyle(color: Colors.white24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.indigo, width: 2.0),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: ElevatedButton(onPressed: (){
                  _getWeatherFromInternet(controller1.text);
                },
                  child: Text("Göster",style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(weather.name, style: TextStyle(fontSize: 40)),
                Image.network("https:"+weather.icon,height: 100,width: 100,),
              ]
              ),
              Text(weather.temp_c.toString() + "°",style: TextStyle(fontSize: 50),),
              Text(weather.text,style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
      ),
    );
  }

  void _getWeatherFromInternet(String name)async{
    Uri uri = Uri.parse(_apiUrl+name);
    http.Response response = await http.get(uri);
    dynamic parsedResponse = jsonDecode(response.body);
    Map<String,dynamic> weatherMap = parsedResponse;
    weather = Weather.fromMap(weatherMap);
    setState(() {
      
    });
  }
}
