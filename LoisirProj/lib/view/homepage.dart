import 'dart:async';
import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/model/Loisir.dart';
import 'package:LoisirProj/view/profile.dart';
import 'package:LoisirProj/view/screens/info.dart';
import 'package:LoisirProj/view/screens/sign/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



int _selectedIndex = 0;
const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
List<Loisir> _loisirs = [];
Set<Marker> marks;

class homepage extends StatefulWidget {
  final String email;

  homepage({this.email});

  @override
  State<homepage> createState() => homepageState();
}

class homepageState extends State<homepage> {
  SharedPreferences logindata;
  String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();

  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
      _getLoisirs();
    });
  }

  Future<List<Loisir>> _getLoisirs() async{

    final response = await http.get(ApiUrl.getAllLoisir);

    final List fetchedData = json.decode(response.body);
    print("getOneLoisir $fetchedData");
    print("Halllllllllllllllllooooooooooooooooo"+fetchedData.toString());

    final List<Loisir> fetchedLoisir = [];
    fetchedData.forEach((lois) {
      Loisir loisirs = Loisir(
          id_loisir: lois["id_loisir"],
          nom: lois["nom"],
          description: lois["description"],
          latitude:lois["latitude"],
          longitude: lois["longitude"],
          type: lois["type"]
      );

      fetchedLoisir.add(loisirs);
    });

    //_markers = fetchedLoisir;
    _loisirs=fetchedLoisir;

  }

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
    _getLoisirs();

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
          marks=Set<Marker>();
          _controller.complete(controller);
          controller.moveCamera(CameraUpdate.newCameraPosition(_uirinit));
          Timer _timer = new Timer(const Duration(milliseconds: 1500), () {
            setState(() {
              controller.animateCamera(CameraUpdate.newCameraPosition(_uir));
            });
          });
          _loisirs.forEach((loi) {
            Marker mark=new Marker(
              markerId: MarkerId(loi.id_loisir),
              position: LatLng(double.parse(loi.latitude),double.parse(loi.longitude)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoPage(id_loisir:loi.id_loisir,type: loi.type)),
                );
              },
              infoWindow: InfoWindow(title: loi.nom),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueBlue,
              ),
            );
            marks.add(mark);
          });
        },
        markers: marks,
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


      ProfilePage(email:username),
      Text(
        'Index 2: Page nan',
        style: optionStyle,
      ),
    ];
    return new Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions:  <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              logindata.setBool('login', true);
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )],),
      body:Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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




