import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickMessage.',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'QuickMessage'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _number='';
  TextEditingController _message_controller = TextEditingController();
  TextEditingController _phone_controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: ListView(
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
               width: 300 ,
                child: TextField(autofocus: false, decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.black38 , width: 1)
                 )
                  ,
                helperText:'Enter a phone number' )
                  ,controller: _phone_controller,
                ),

            ),
          ),
        ),

        SizedBox(height: 40,),


        Container(
          height:300,
          width: 300,
          decoration: BoxDecoration(border: Border.all(color: Colors.black38 ),borderRadius: BorderRadius.circular(12),
              image:  DecorationImage(
                image: NetworkImage('https://i.redd.it/qwd83nc4xxf41.jpg'),
                fit: BoxFit.cover,
          )
          ),
          child:
              TextField(
                expands: true,
                autocorrect: false,
                minLines: null,
                maxLines: null,
                controller: _message_controller,

                decoration: InputDecoration(
                    hintText: 'Enter your message',
                    labelStyle: TextStyle(color: Colors.black),

                    disabledBorder: InputBorder.none,
                    enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.transparent),)
                ),

              )



        )
        ,

        SizedBox(height: 20,),
        Center(
          child: RaisedButton(onPressed:() {
            FlutterOpenWhatsapp.sendSingleMessage(_phone_controller.text, _message_controller.text);
          },
              child: Text('Send!'),
          ),
        ),
      ],
      )

     ,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(_message_controller.text),
        tooltip: 'Contact Us!',
        child: Icon(Icons.email),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
