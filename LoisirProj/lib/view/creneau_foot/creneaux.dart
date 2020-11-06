import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/model/horraire_foot.dart';
import 'package:LoisirProj/view/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class creneaux extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: creneauxPage(),
    );
  }
}
Future<List<horraire_foot>> fetchCreneauxFoot() async {
  final response = await http.post(ApiUrl.getFoot);
  return footFromJson(response.body);
}
class creneauxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder(
            future: fetchCreneauxFoot(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    horraire_foot foot = snapshot.data[index];

                    return new Card(
                        child: InkWell(
                      child: new Container(

                        padding: EdgeInsets.all(8.0),

                        child: new Row(

                          children: <Widget>[

                            new Padding(padding: EdgeInsets.only(right: 10.0)),
                            new Text(foot.creneau,style: TextStyle(fontSize: 20.0),),
                            new Text(foot.disponibilite,style: TextStyle(fontSize: 20.0),)
                          ],
                        ),
                      ),
                            onTap: () {
                              var route = new MaterialPageRoute(
                                  builder: (BuildContext context) => new calendar());
                              Navigator.of(context).push(route);
                            }),
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
