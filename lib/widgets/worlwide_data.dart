import 'package:corona_tracker/services/corona_api.dart';
import 'package:corona_tracker/services/number_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class WorldWideData extends StatelessWidget {
  const WorldWideData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  getWorldWideData(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          var data = snapshot.data;
          return Container(
              width: 335,
              height: 189,
              decoration: BoxDecoration(
                  color: Color(0xFFFF8EBBE),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 11.0),
                    child: Text(
                      'World Wide Stats',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Philosopher'),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Cases',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSerif',
                            color: Color(0xFFF3652B4),
                          ),
                        ),
                        Spacer(),
                        Text(
                          formatNumber(data.cases),
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Rubik',
                            color: Color(0xFFF3652B4),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Recoveries',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'NotoSerif',
                            color: Color(0xFFF19D236),
                          ),
                        ),
                        Spacer(),
                        Text(
                          formatNumber(data.recoveries),
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Rubik',
                            color: Color(0xFFF19D236),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Deaths',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'NotoSerif',
                            color: Color(0xFFFF22323),
                          ),
                        ),
                        Spacer(),
                        Text(
                          formatNumber(data.deaths),
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Rubik',
                            color: Color(0xFFFF22323),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Click to view pie chart',
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Philosopher',
                      color: Color(0xFFF3652B4),
                    ),
                  ),
                ],
              ),
            );
        } else {
          return SpinKitWave(
            color: Color(0xFFFF8EBBE),
          );
        }
      });
  }
}
