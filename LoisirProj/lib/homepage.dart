import 'dart:async';
import 'package:LoisirProj/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int _selectedIndex = 0;
const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

class homepage extends StatefulWidget {
  final String email;

  homepage({this.email});

  @override
  State<homepage> createState() => homepageState();
}

class homepageState extends State<homepage> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _uir = CameraPosition(
    target: LatLng(33.985164, -6.723864),
    zoom: 17.35,
    bearing: 49,
  );
  static final CameraPosition _uirinit = CameraPosition(
    target: LatLng(33.985164, -6.723864),
    bearing: 49,
    zoom: 5,
  );



  Widget _buildGoogleMap(BuildContext context) {

    Marker PiscineMarker = Marker(
      markerId: MarkerId('piscine'),
      position: LatLng(33.985081, -6.722919),



      infoWindow: InfoWindow(title: 'Piscine'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueAzure,
      ),
    );

    Marker Basket1Marker = Marker(
      markerId: MarkerId('basket 1'),
      position: LatLng(33.984722, -6.722662),
      infoWindow: InfoWindow(title: 'Basket 1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    );

    Marker MiniFootMarker = Marker(
      markerId: MarkerId('minifoot'),
      position: LatLng(33.984894, -6.722248),
      infoWindow: InfoWindow(title: 'MiniFoot'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ),

    );


/*Marker Basket2Marker = Marker(
  markerId: MarkerId('basket 1'),
  position: LatLng(33.984722, -6.722662),
  infoWindow: InfoWindow(title: 'Basket 2'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);*/

    Marker Tennis1Marker = Marker(
      markerId: MarkerId('tennis 1'),
      onTap: () => {},
      position: LatLng(33.984440, -6.722974),
      infoWindow: InfoWindow(title: 'Tennis 1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueYellow,
      ),
    );

    Marker SalleDeMuscuMarker = Marker(
      markerId: MarkerId('sallemuscu'),
      position: LatLng(33.986215, -6.721950),
      infoWindow: InfoWindow(title: 'Gym'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:  GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: _uir,
        cameraTargetBounds: new CameraTargetBounds(new LatLngBounds(southwest: new LatLng(33.985164, -6.723864), northeast: new LatLng(33.985164, -6.723864))),
        zoomControlsEnabled: false,
        scrollGesturesEnabled: false,
        compassEnabled: false,
        buildingsEnabled: false,
        zoomGesturesEnabled: false,
        rotateGesturesEnabled: false,
        tiltGesturesEnabled: false,
        mapToolbarEnabled: false,
        myLocationButtonEnabled: false,
        trafficEnabled: false,

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          controller.moveCamera(CameraUpdate.newCameraPosition(_uirinit));
          Timer _timer = new Timer(const Duration(milliseconds: 1500), () {
            setState(() {
              controller.animateCamera(CameraUpdate.newCameraPosition(_uir));
            });
          });
        },
        markers: {
          PiscineMarker,MiniFootMarker,Basket1Marker,Tennis1Marker,SalleDeMuscuMarker
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Stack(
        children: <Widget>[
          _buildGoogleMap(context),
        ],
      ),


     ProfilePage(email:widget.email),
      Text(
        'Index 2: Page nan',
        style: optionStyle,
      ),
    ];
    return new Scaffold(
      body:Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      appBar: AppBar(title: Text("Home Page"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_outlined),
            label: 'NAN',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}




