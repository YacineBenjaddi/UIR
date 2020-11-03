import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:toast/toast.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: SendMailFromLocalHost(),
      ),
    );
  }
}


class SendMailFromLocalHost extends StatefulWidget {
  @override
  _SendMailFromLocalHostState createState() => _SendMailFromLocalHostState();
}

class _SendMailFromLocalHostState extends State<SendMailFromLocalHost> {

  sendMail() async {
    String username = "tetsuyakuro13@gmail.com";
    String password = "tetsuyakuro123";//passsword

    final smtpServer = gmail(username, password);
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add('yassine.benjaddi@uir.ac.ma') //recipent email
    //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com']) //cc Recipents emails
    //..bccRecipients.add(Address('bccAddress@example.com')) //bcc Recipents emails
      ..subject =
          'Subject : ${DateTime.now()}' //subject of the email
    //..text =
    //'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h3>Hallllllllloooooooooooooooooooo</h3>\n<p></p>"; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      showToast('Message Send Check your mail',gravity: Toast.CENTER,duration: 3);
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fluter Send Mail '),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.purple,
          child: Text('Send Mail',style: TextStyle(color: Colors.white),),
          onPressed: () {
            sendMail();
          },
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}){
    Toast.show(msg, context,duration: duration,gravity: gravity);
  }
}

