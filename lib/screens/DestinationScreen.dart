import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iphonexsocialapp/models/activity_model.dart';
import 'package:iphonexsocialapp/models/destination_model.dart';
import 'package:iphonexsocialapp/widgets/custom_text.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  const DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
//Append string
//  Text _buildTextRatingStars(int rating) {
//    String stars = '';
//    for (int i = 0; i < rating; i++) {
//      stars += '⭐ ';
//    }
//    stars.trim();
//    return Text(stars);
//  }

  Widget _buildRatingStars(int _rating) {
    final _stars = <Widget>[];
    for (int i = 0; i < 5; i++) {
      _stars.add(
        Icon(Icons.star,
            color: i < _rating ? Colors.amber : Colors.grey, size: 16),
      );
    }
    return Row(
      children: _stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 5),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  child: Hero(
                    tag: widget.destination.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        widget.destination.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 30.0,
                            color: Colors.black,
                            onPressed: () => Navigator.pop(context),
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.sortAmountDown),
                            iconSize: 30.0,
                            color: Colors.black,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.destination.city,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 15.0,
                            color: Colors.white70,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            widget.destination.country,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white70,
                    size: 25.0,
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, i) {
                  Activity _activities = widget.destination.activities[i];
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 170.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    child: CustomText(
                                      text: _activities.name,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      maxLine: 2,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CustomText(
                                        text: '\$${_activities.price}',
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CustomText(
                                        text: 'per pax',
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CustomText(
                                text: _activities.type,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                              _buildRatingStars(_activities.rating),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 70,
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    alignment: Alignment.center,
                                    child: Text(_activities.startTimes[0]),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Container(
                                    width: 70,
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    alignment: Alignment.center,
                                    child: Text(_activities.startTimes[1]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 15.0,
                        bottom: 15.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            _activities.imageUrl,
                            width: 110.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
