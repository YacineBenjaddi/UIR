import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/controller/utilities/Services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MockClient extends Mock implements http.Client {}


main() {
  group('login , signup and forgot password test group', () {


    test('login valid', () async {

      var email = "v.youssef.gahi@uir.ac.ma";
      var password= "123";
      expect(await Services.login(email, password), "success");
    });


    test('login failed', () async {

      var email = "te";
      var password= "1";

      expect(await Services.login(email, password), "error");
    });


    test('Email non-valid so nb_block et date fin de block are null', () async {

      var email = "te";


      expect(await Services.get_nbBlock_DateFin(email), null);
    });


    test('Email valid so nb_block et date fin de block are not null', () async {

      var email = "basma";


      String exp ='[{"id_user":"7","first_name":"basma","last_name":"guermah","email":"basma","password":"","penalty":"0",'
          '"gender":"female","profile":"Personnel","reset":"0","code":"0","year":"2020-2021","branch":"Ingenierie d\'informatique",'
          '"nb_block":"0","date_debut_block":"0000-00-00","date_fin_block":"0000-00-00","photo":""}]';

      expect(await Services.get_nbBlock_DateFin(email), exp);
    });

    test('Check if password not empty', () async {

      var email = "v.youssef.gahi@uir.ac.ma";

      expect(await Services.check(email), 'error');
    });


    test('Check if password is empty', () async {
      var email = "basma";

      expect(await Services.check(email), 'success');
    });


    test('success Updating password ', () async {

      var email = "basma";
      var password = "";

      expect(await Services.UpdatePassword(email, password), 'success');
    });

    test('success email check for forgot password ', () async {

      var email = "v.youssef.gahi@uir.ac.ma";

      expect(await Services.checkEmail(email), 'success');
    });

    test('Failed email check for forgot password ', () async {

      var email = "gahi";


      expect(await Services.checkEmail(email), 'error');
    });

    test('Success verification code  ', () async {

      var email = "basma";
      var code = "0";


      expect(await Services.ValidateCode(email, code), 'success');
    });

    test('Failed verification code  ', () async {

      var email = "v.youssef.gahi@uir.ac.ma";
      var code = "33333";


      expect(await Services.ValidateCode(email, code), 'error');
    });


    test('success update password for forgot password  ', () async {

      var email = "v.youssef.gahi@uir.ac.ma";
      var password = "123";


      expect(await Services.UpdatePass(email, password), 'success');
    });

    test('success password check for update password ', () async {

      var email = "v.youssef.gahi@uir.ac.ma";
      var password = "123";

      expect(await Services.CheckPassword(email, password), 'success');
    });

    test('Failed password check for update password ', () async {

      var email = "v.youssef.gahi@uir.ac.ma";
      var password = "12";

      expect(await Services.CheckPassword(email, password), 'error');
    });

    test('not empty list of hobbies', () async {

      var expec= '[{"id_loisir":"1","nom":"Mini Football","description":"Disponible de 8h30-00h00","latitude":"33.984894",'
          '"longitude":"-6.722248","type":"foot","capacite":"1"},{"id_loisir":"2","nom":"Piscine",'
          '"description":"Disponible selon la semaine","latitude":"33.985081","longitude":" -6.722919","type":"piscine",'
          '"capacite":"5"},{"id_loisir":"3","nom":"Tennis","description":"Disponible de 8h30-00h00","latitude":"33.984440",'
          '"longitude":"-6.722974","type":"tennis","capacite":"1"},{"id_loisir":"4","nom":"Salle de Musculation","'
          'description":"Disponible de 17h-22h","latitude":"33.986215","longitude":"-6.721950","type":"muscu","capacite":"5"},'
          '{"id_loisir":"5","nom":"Basket","description":"Disponible de 8h30-00h00","latitude":"33.984722",'
          '"longitude":"-6.722662","type":"basket","capacite":"1"}]';
      expect(await Services.getAllLoisirs(), expec);
    });

    /* test('get reservation piscine gender male ', () async {

      var type = "piscine";
      DateTime da = DateTime.now();
      var gender="male";
      var profile = "User";
      var exp=  [{"id_horaire":"14","creneau":"14:00 - 15:00"},{"id_horaire":"15","creneau":"15:00 - 16:00"},
        {"id_horaire":"16","creneau":"16:00 - 17:00"},{"id_horaire":"17","creneau":"17:00-18:00"},
        {"id_horaire":"19","creneau":"19:00 - 20:00"},{"id_horaire":"20","creneau":"20:00 - 21:00"}];
      expect(await Services.getDispoPiscine(type, da, gender, profile), exp);
    });
*/
    test('Email valid returns profile informations', () async {

      var email = "basma";

      String exp ='[{"id_user":"7","first_name":"basma","last_name":"guermah","email":"basma","password":"","penalty":"0",'
          '"gender":"female","profile":"Personnel","reset":"0","code":"0","year":"2020-2021","branch":"Ingenierie d\'informatique",'
          '"nb_block":"0","date_debut_block":"0000-00-00","date_fin_block":"0000-00-00","photo":""}]';

      expect(await Services.getOneProfile(email), exp);
    });
  });

  test('Email nom-valid return null for profile', () async {

    var email = "bm";

    expect(await Services.getOneProfile(email), null);
  });


  test('success fetch reservation  ', () async {

    var id = "8";
    var exp= '[{"id_res":"8","id_user":"8","id_horaire":"10","date_res":"2020-11-25","type":"tennis"}]';
    expect(await Services.fetchreservation(id), exp);
  });

  test('failed fetch reservation  ', () async {

    var id = "7";

    expect(await Services.fetchreservation(id), null);
  });

  test('failed remove reservation  ', () async {

    var id = "7";

    expect(await Services.fetchreservation(id), null);
  });



}
