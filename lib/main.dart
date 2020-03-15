
import 'package:corona_tracker/services/corona_api.dart';
import 'package:corona_tracker/widgets/country_list.dart';
import 'package:corona_tracker/widgets/worlwide_data.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _search = '';

  void _setSearch(String toSearch){
    setState(() {
      _search = toSearch;
    });
  }
  @override
  Widget build(BuildContext context) {
    getWorldWideData();
    return Scaffold(
      backgroundColor: Color(0xFFFE5E5E5),
      body: SingleChildScrollView(
              child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(height: 57),
                decoration: BoxDecoration(
                    color: Color(0xFFFD6B545),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10))),
                child: Center(
                  child: Text(
                    'COVID-19 STATISTICS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Philosopher',
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 15),
              WorldWideData(),
              SizedBox(height: 19),
              Container(
                width: 335,
                height: 370,
                decoration: BoxDecoration(
                    color: Color(0xFFFD8D4C7),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 9),
                    Text(
                      'Cases by country',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Philosopher',
                      ),
                    ),
                    SizedBox(height: 11),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 14),
                          width: 187,
                          height: 20,
                          child: TextField(
                            style: TextStyle(
                                fontSize: 14,
                              ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                bottom: 15,
                                left: 10,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 12,
                              ),
                              border: new OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                            ),
                            onChanged:(search){
                              _setSearch(search);
                            } ,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    CountryList(search:'$_search'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
