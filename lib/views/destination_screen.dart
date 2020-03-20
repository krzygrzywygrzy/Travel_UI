import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/activity_model.dart';
import 'package:travel_ui/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  DestinationScreen({this.destination});
  final Destination destination;

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Hero(
            tag: widget.destination.imageUrl,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back),
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.search),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              FontAwesomeIcons.sortAmountDown,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.destination.city,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Colors.white70,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.destination.country,
                            style:
                                TextStyle(color: Colors.white70, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              itemCount: widget.destination.activities.length,
              itemBuilder: (context, index) {
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      height: 170,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  child: Text(
                                    activity.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '\$${activity.price}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(
                                      'per pax',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              activity.type,
                              style: TextStyle(color: Colors.grey),
                            ),
                            _buildRatingStars(activity.rating),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[0]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[1]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 15,
                      bottom: 15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage(activity.imageUrl),
                          width: 110,
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
    );
  }
}
