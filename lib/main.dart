import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

String text = '';
var start, end;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BigMauji project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'BigMauji'),
    );
  }
}

class Message {
  String message;
  double size;

  Message({
    this.message,
    this.size,
  });
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  double size = 10.0;
  void _sizeChanger() {
    setState(() {
      size += 2;
    });
  }

  ///List of messages
  //static List<Message> elements;
  List elements = List();
  Widget getListView() {
    var listView = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.arrow_forward_ios),
          title: Text(
            text,
            style: TextStyle(
              fontSize: size,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.arrow_forward_ios),
          title: Text("hi"),
        ),
      ],
    );
    return listView;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.0,
                          offset: Offset(0.0, 2.0)),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: (){},
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() {
                          text = val;
                          size = 10;
                        });
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 80.0),
                        hintText: "Enter Text",
                        hintStyle: TextStyle(
                            color: Colors.white54, fontFamily: 'OpenSans'),
                      ),
                    ),
                  ),
                ),

                ///This part for adding
                ///
                GestureDetector(
                  onLongPressStart: (detail) {
                    setState(() {
                      start = DateTime.now();
                    });
                  },
                  onLongPressEnd: (detail) {
                    _sizeChanger();
                    final differnce =
                        DateTime.now().difference(start).inMilliseconds;
                    size = size+(differnce/50);
                    elements.add(Message(
                      message: text,
                      size: size,
                    ));
                  },

                  ///ends here

                  child: RaisedButton(
                    elevation: 10.0,
                    onPressed:() {
                      _sizeChanger();
                      elements.add(Message(
                        message: text,
                        size: size,
                      ));
                    },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white70,
                      child: Text(
                      'REGISTER',
                      style: TextStyle(
                      color: Colors.blue,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      ),
                      ),
                      ),
                      ),
                      ],
                      ),

              Container(
                height: 500.0,
                child: ListView.builder(
                    itemCount: elements.length,
                    itemBuilder: (BuildContext context,int index){
                      return ListTile(
                        title:Text(elements[index].message,
                            style:TextStyle(
                              fontSize:elements[index].size,
                            )
                        ),
                      );
                    }
                ),
              )
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods
  }
}