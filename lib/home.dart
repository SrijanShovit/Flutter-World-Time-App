import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

//this links State object with below widget

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {

    //receiving actual arguments that will be send from loading
    //set state not used because it's the first time widget is build
    data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;
    print (data);

    //set background image
    String bgImage = data['isDay'] ? 'dayy.jpg' : 'nightt.jpg';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: SafeArea(            //moves the child to safe area
            //AppBar did the work automatically
              child: Column(
                children: [
                  TextButton.icon(
                    //updating map with what we got in choose location
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDay' : result['isDay'],
                            'flag': result['flag']
                          };
                        });
                        },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.amberAccent,
                  ),
                  label: Text(
                      'Edit Location',
                       style: TextStyle(
                         color: Colors.amberAccent,
                         fontSize: 20.0
                       ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Text(
                          data['location'],
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: Colors.amberAccent
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['time'],
                        style: TextStyle(
                            fontSize: 60.0,
                            letterSpacing: 2.0,
                            color: Colors.amberAccent,
                        ),
                      ),
                    ],
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
