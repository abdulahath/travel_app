import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/location_model.dart';
import 'package:travel_app/providers/location_data_provider.dart';


class LocationListScreen extends StatefulWidget {
  @override
  _LocationListScreenState createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {

  @override
  void initState() {
    super.initState();
    final mdl = Provider.of<LocationDataProvider>(context, listen: false);
    mdl.loadLocations();
  }

  @override
  Widget build(BuildContext context) {
    final mdl = Provider.of<LocationDataProvider>(context);


    return Scaffold(
        appBar: AppBar(
          title: Text("Travel App"),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(20),
            itemCount: mdl.locationList.length,
            itemBuilder: (context, index){
            LocationModel location = mdl.locationList[index];
             return LocationViewCard(
               name: location.name ,
               shortDetail: location.shortDetail ,
               image: location.image,);
            })
        );
  }
}

class LocationViewCard extends StatelessWidget {
  final String image;
  final String name;
  final String shortDetail;


  LocationViewCard(
      {required this.image, required this.name, required this.shortDetail});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 15 ),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                shortDetail,
                style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}


