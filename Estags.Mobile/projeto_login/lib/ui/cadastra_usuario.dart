import 'package:flutter/material.dart';

//import 'package:projeto_login/ui/cadastra_vaga.dart';
import 'package:projeto_login/ui/home.dart';
import 'package:projeto_login/ui/login_page.dart';

class CadastraUsuario extends StatefulWidget {
  @override
  _CadastraUsuarioState createState() => _CadastraUsuarioState();
}

class _CadastraUsuarioState extends State<CadastraUsuario> {
  //Declarando os controladores para manipular os dados das caixas de texto
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailLoginController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _confirmaSenhaController = TextEditingController();

  GlobalKey<FormState> _formUserKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //--Cria e personaliza a barra no topo da tela
      appBar: AppBar(
        backgroundColor: Colors.white,
        //--Cria uma barra de altura 2.0 na cor azul na parte de baixo da Appbar
        bottom: PreferredSize(
          child: Container(
            color: Colors.blue,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
        //--titulo da página
        title: Text(
          "Cadastro",
          style: TextStyle(color: Colors.blue),
        ),
        //--centraliza o titulo
        centerTitle: true,
        //--acrescenta o botao voltar no lado direito da appbar
        leading:
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.orangeAccent[700],
            ),
            onPressed: () {
              //--redireciona para a pagina HomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),)

      ),
      //--inicio do corpo do app (igual no html)
      body: SingleChildScrollView(
        //permite o scrool na página
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
          child: Form(
            key: _formUserKey,
            child: Column(
              children: <Widget>[
                buildTextField("Nome", "Insira o nome", _nomeController),
                Divider(),
                buildTextField(
                    "E-mail", "Insira o e-mail", _emailLoginController),
                Divider(),
                buildTextField("Senha", "Insira uma senha", _senhaController),
                Divider(),
                buildTextField("Confirmação de senha", "Confirme sua senha",
                    _confirmaSenhaController),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Container(
                    width: double.infinity,
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formUserKey.currentState.validate()) {
                          resetaCampos();
                        }
                      },
                      color: Colors.orangeAccent[700],
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, String valida, TextEditingController controller) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 18.0, color: Colors.blueAccent),
      ),
      style: TextStyle(
        color: Colors.orangeAccent[700],
      ),
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return "$valida";
        }
      },
    );
  }

  void resetaCampos() {
    _confirmaSenhaController.text = "";
    _senhaController.text = "";
    _emailLoginController.text = "";
    _nomeController.text = "";
  }
} // end class CadastraUsuario
