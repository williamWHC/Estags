import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:projeto_login/ui/home.dart';

class CadastrarVaga extends StatefulWidget {
  @override
  _CadastrarVagaState createState() => _CadastrarVagaState();
}

class _CadastrarVagaState extends State<CadastrarVaga> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  GlobalKey<FormState> _formVagaKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            child: Container(
              color: Colors.blue,
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(2.0),
          ),
          title: Text(
            "Cadastrar Vaga",
            style: TextStyle(color: Colors.blue),
          ),
          centerTitle: true,
          leading:
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.orangeAccent[700],),
              onPressed: () {
                verificacaoDeCamposNaSaida(context);
              },
            )
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),)

        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
            child: Form(
              key: _formVagaKey,
              child: Column(
                children: <Widget>[
                  buildTextField(
                      "Título da Vaga", _tituloController, "Insira o título"),
                  Divider(),
                  buildTextField("Quantidades de vagas", _quantidadeController,
                      "Insira a quantidade de vagas"),
                  Divider(),
//                  buildTextField("Status da Vaga",
//                      _responsavelController, "Especifique o responsável"),
//                  Divider(),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: ("Descrição"),
                      contentPadding: EdgeInsets.all(10.0),
                      labelStyle: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18.0
                      )
                    ),
                    maxLines: 12,
                      style: (TextStyle(color: Colors.orangeAccent[700], fontSize: 18.0)),
                      controller: _descricaoController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Preencha a descrição da vaga.";
                        }
                      }
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: RaisedButton(
                          onPressed: () {
                            if (_formVagaKey.currentState.validate()) {
                              resetaCampos();
                            }
                          },
                          color: Colors.orangeAccent[700],
                          child: Text(
                            "Cadastrar",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  //VERIFICA SE O FORM ESTA PREENCHIDO ANTES DE SAIR DO FORM
  verificacaoDeCamposNaSaida(BuildContext context,) {
    if (VerifyFilledFields()) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Cancelar o cadastro de vaga?"),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Sim",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
                  ),
                  onPressed: () {
                    direcionaHomePage(context);
                  },
                ),
                FlatButton(
                  child: Text(
                    "Não",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    } else {
      direcionaHomePage(context);
    }
  }

  // CONSTROI CAMPOS DO FORMULARIO
  Widget buildTextField(String label, TextEditingController controller,
      String valida) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: label,

            labelStyle: TextStyle(fontSize: 18.0, color: Colors.blue)),
        style: TextStyle(color: Colors.orangeAccent[700]),
        controller: controller,
        validator: (value) {
          if (value.isEmpty) {
            return "$valida";
          }
        });
  }

  //VERIFICA SE HÁ CAMPOS PREENCHIDOS
  bool VerifyFilledFields() {
    if (_tituloController.text.length > 0 ||
        _quantidadeController.text.length > 0 ||
        _descricaoController.text.length > 0) {
      return true;
    }
    return false;
  }

    direcionaHomePage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/homepage", (_) => false);
  }

  void resetaCampos() {
    _tituloController.text = "";
    _quantidadeController.text = "";
    _descricaoController.text = "";
  }














}//END class _CadastrarVaga
