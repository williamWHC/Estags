import 'package:flutter/material.dart';
import 'package:projeto_login/ui/cadastra_usuario.dart';
import 'package:projeto_login/ui/cadastra_vaga.dart';
import 'package:projeto_login/ui/home.dart';
import 'package:projeto_login/ui/login_page.dart';

void main() => runApp(MaterialApp(
      home: LoginPage(),
      routes: {
        "/loginpage": (_) => LoginPage(),
        "/homepage": (_) => HomePage(),
        "/cadastrovaga": (_) => CadastrarVaga(),
        "/cadastrousuario": (_) => CadastraUsuario(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        backgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      ),
    ));
