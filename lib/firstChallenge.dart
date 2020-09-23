import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class FirstChallenge extends StatelessWidget {
  GoogleMapController mapController;
  String _mapStyle;

  final LatLng _center = const LatLng(44.179249, 28.649940);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    rootBundle.loadString('assets/mapstyle.txt').then((string) {
      _mapStyle = string;
    });
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black54,
              automaticallyImplyLeading: false,
              title: Text("Mission No. #89273",
                  style: GoogleFonts.ptMono(
                    textStyle: TextStyle(color: Colors.white54, letterSpacing: 0.5, fontSize: 20,),
                  )
              ),
              leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context, false),
              )
          ),
          body: TabBarView(
            children: [
              new Container(
                color: Colors.white70,
              ),
              new Container(
                color: Colors.orange,
              ),
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 13.0,
                ),
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.assignment),
              ),
              Tab(
                icon: new Icon(Icons.camera_alt),
              ),
              Tab(
                icon: new Icon(Icons.gps_fixed),
              ),
            ],
            labelColor: Colors.white70,
            unselectedLabelColor: Colors.blueGrey,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.black38,
          ),
          backgroundColor: Colors.black54,
        ),
      ),
    );
  }
}