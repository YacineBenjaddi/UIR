import 'dart:convert';

import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/model/Loisir.dart';
import 'package:LoisirProj/model/Photo.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:http/http.dart' as http;

import '../Picker.dart';

List<Photo> _photos = [];
class InfoPage extends StatefulWidget {
  final String id_loisir,type;


  InfoPage({this.id_loisir,this.type});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool _isOpen = false;
  PanelController _panelController = PanelController();

  List imgList = [];
  CarouselSlider carouselSlider;
  int _current = 0;

  var id_loisir,nom,description,latitude,longitude,id_photo,nomphoto;

  @override
  void initState(){
    id_loisir=widget.id_loisir;
    nom="";
    description="";
    latitude="";
    longitude="";
    _getOneLoisir();
    _getPhotos();

  }

  Future<List<Loisir>> _getOneLoisir() async {
    var msg = "";
    print("getOneLoisir $id_loisir");
    final response = await http.post(ApiUrl.getLoisir, body: {
      "id_loisir": id_loisir,
    });
    var dataloisir = json.decode(response.body);



    if (dataloisir.length == 0) {
      setState(() {
        msg = "loisir not found";
      });
    }

    if (dataloisir.length > 0) {
      setState(() {
        print(dataloisir);
        id_loisir = dataloisir[0]['id_loisir'];
        nom = dataloisir[0]['nom'];
        description = dataloisir[0]['description'];
        latitude = dataloisir[0]['latitude'];
        longitude = dataloisir[0]['longitude'];
      });
    }
    return dataloisir;
  }

  Future<List<Photo>> _getPhotos() async {
    var msg = "";
    final response = await http.post(ApiUrl.getPhotosTerrains, body: {
      "id_loisir": id_loisir,
    });

    final List fetchedData = json.decode(response.body);

    final List<Photo> fetchedPhotos = [];
    fetchedData.forEach((lois) {
      Photo photos = Photo(
          id_photo: lois["id_photo"],
          nom: lois["nom"]
      );
      imgList.add(ApiUrl.imagesTerrain+photos.nom);
      fetchedPhotos.add(photos);
    });

    //_markers = fetchedLoisir;
    _photos=fetchedPhotos;

  }


  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          carouselSlider = CarouselSlider(
            options: CarouselOptions(
              height: 650.0,
              initialPage: 0,

              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) => {
                setState(() {
                  _current = index;
                })
              },
              /* onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },*/
            ),
            items: imgList.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(

                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                    ),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),

          /// Sliding Panel
          SlidingUpPanel(
            controller: _panelController,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.35,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(controller),
            onPanelSlide: (value) {
              if (value >= 0.2) {
                if (!_isOpen) {
                  setState(() {
                    _isOpen = true;
                  });
                }
              }
            },
            onPanelClosed: () {
              setState(() {
                _isOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// Panel Body
  SingleChildScrollView _panelBody(ScrollController controller) {
    double hPadding = 40;

    return SingleChildScrollView(
      controller: controller,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _titleSection(),
                _infoSection(),
                _actionSection(hPadding: hPadding),
              ],
            ),
          ),

        ],
      ),
    );
  }

  /// Action Section
  Row _actionSection({double hPadding}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        /*  Visibility(
          visible: !_isOpen,
          child: Expanded(
            child: OutlineButton(
              onPressed: () => _panelController.open(),
              borderSide: BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'MORE INFO',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'NimbusSanL',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),*/
        Visibility(
          visible: !_isOpen,
          child: SizedBox(
            width: 16,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: _isOpen
                  ? (MediaQuery.of(context).size.width - (2 * hPadding)) / 1.6
                  : double.infinity,
              child: FlatButton(

                onPressed: () => _reserver(),
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  '+',
                  style: TextStyle(
                    fontFamily: 'NimbusSanL',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  /// Info Section
  Row _infoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _infoCell(value: "$description"),
      ],
    );
  }

  Column _infoCell({String value}) {
    return Column(
      children: <Widget>[
        Text(
          value,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  /// Title Section
  Column _titleSection() {
    return Column(
      children: <Widget>[
        Text(
          '$nom',
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontWeight: FontWeight.w600,
            fontSize: 30,
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 10,
        ),


      ],
    );
  }

  _reserver() {

    Navigator.push(
      context,
     // MaterialPageRoute(builder: (context) => creneau(widget.type)),
      MaterialPageRoute(builder: (context) => Picker(widget.type)),
    );
  }
}








