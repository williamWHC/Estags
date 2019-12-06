import 'package:flutter/material.dart';
import 'package:projeto_login/ui/cadastra_usuario.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

//import 'package:projeto_login/main.dart';
//import 'package:projeto_login/ui/cadastra_vaga.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.blue,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
      ),
      body: null,
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.orangeAccent[700],
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              backgroundColor: Colors.red,
              child: Icon(Icons.exit_to_app),
              label: "Logout",
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/loginpage', (_) => false);
              }),
          SpeedDialChild(
              backgroundColor: Colors.orangeAccent[700],
              child: Icon(Icons.assignment),
              label: "Cadastrar Vaga",
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/cadastrovaga', (_) => false);
              }),
        ],
      ),
    );
  }
}
