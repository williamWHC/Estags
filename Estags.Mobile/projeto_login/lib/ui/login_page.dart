import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _textUser = TextEditingController();
  TextEditingController _passUser = TextEditingController();

  List _loginSave = [];
  bool _salvarLogin = false;

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        _loginSave = json.decode(data);
        _textUser.text = _loginSave[0]["username"];
        _passUser.text = _loginSave[0]["pass"];
        _salvarLogin = _loginSave[0]["save"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Login",
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 60.0),
                alignment: Alignment.center,
                child: Image.asset("images/logo/logoBRQ.jpg"),
              ),
              textField("Nome de Usuário", _textUser),
              textField("Senha", _passUser, senha: true),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 10.0),
                child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("Lembrar meu Login"),
                    value: _salvarLogin,
                    onChanged: (context) {
                      setState(() {
                        if (_salvarLogin == true) {
                          _salvarLogin = false;
                          if (_loginSave.isEmpty) {
                            Map<String, dynamic> user = new Map();
                            user["username"] = "";
                            user["pass"] = "";
                            user["save"] = false;
                            _loginSave.add(user);
                          } else {
                            _loginSave[0]["username"] = "";
                            _loginSave[0]["pass"] = "";
                            _loginSave[0]["save"] = false;
                          }
                        } else {
                          _salvarLogin = true;
                          if (_loginSave.isEmpty) {
                            Map<String, dynamic> user = new Map();
                            user["username"] = _textUser.text;
                            user["pass"] = _passUser.text;
                            user["save"] = true;
                            _loginSave.add(user);
                          } else {
                            _loginSave[0]["username"] = _textUser.text;
                            _loginSave[0]["pass"] = _passUser.text;
                            _loginSave[0]["save"] = true;
                          }
                        }
                        _saveData();
                      });
                    }),
              ),
//BOTÕES
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildButton("Registrar", function: (){
                      Navigator.pushNamedAndRemoveUntil(context, '/cadastrousuario', (_) => false);
                    } ),
                    buildButton("Login", function: (){
                      if(_formKey.currentState.validate()){
                        Navigator.pushNamedAndRemoveUntil(context, '/homepage', (_) => false);
                      };
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//FUNÇÕES
  Widget textField(String nomeCampo, TextEditingController c,
      {bool senha = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 10.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) return "Preencha o campo";
        },
        obscureText: senha,
        controller: c,
        decoration: InputDecoration(
          labelText: nomeCampo,
          border: OutlineInputBorder(),
        ),
        onChanged: (text) {
          if (_salvarLogin == true) {
            _loginSave[0]["username"] = _textUser.text;
            _loginSave[0]["pass"] = _passUser.text;
            _saveData();
          }
        },
      ),
    );
  }

  Widget buildButton(String nomeBotao, {Function function = null}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Colors.orangeAccent[700],
          onPressed: function,
          child: Text(
            nomeBotao,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_loginSave);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
