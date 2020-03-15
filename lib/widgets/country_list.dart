import 'package:corona_tracker/models/countrydata.dart';
import 'package:corona_tracker/services/corona_api.dart';
import 'package:corona_tracker/services/number_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CountryList extends StatelessWidget {
  final search;
  const CountryList({Key key, this.search}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getCountryList(search: search),
        builder: (context, snapshot){
        if(snapshot.hasData){
         List<CountryData> countries = snapshot.data;
        return Flexible(
                    child: ListView.builder(
                        itemCount: countries.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: 11, left: 14, right: 14),
                            child: Container(
                              height: 64,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF8EBBE),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0, left: 16),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 90,
                                      child: Text(
                                        countries[index].countryName,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Philosopher',
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 58,
                                          height: 27,
                                          color: Color(0xFFFD8C8C8),
                                          child: Center(
                                              child: Text(
                                            formatNumber(countries[index].cases),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Philosopher',
                                            ),
                                          )),
                                        ),
                                        Container(
                                          width: 58,
                                          height: 27,
                                          color: Color(0xFFF19D236),
                                          child: Center(
                                              child: Text(
                                            formatNumber(countries[index].recoveries),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Philosopher',
                                            ),
                                          )),
                                        ),
                                        Container(
                                          width: 58,
                                          height: 27,
                                          color: Color(0xFFFF22323),
                                          child: Center(
                                            child: Text(
                                              formatNumber(countries[index].deaths),
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Philosopher',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  );
        }else{
          return SpinKitWave(color: Color(0xFFFF8EBBE));
        }
      }),
    );
  }
}
