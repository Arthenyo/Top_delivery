import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_delivery/models/usuario.models.dart';
import 'package:app_delivery/pages/cadastro.page.dart';
import 'package:app_delivery/pages/home.page.dart';
import 'package:flutter/material.dart';

import '../controllers/autenticacao.controller.dart';
import '../repository/usuario.repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _senhaControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 300,
              child: Image.asset("images/logo.png"),
            ),
            const Center(
              child: Text("LOGIN",style: TextStyle(fontSize: 20),),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailControler,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24)
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                )
              ),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: _senhaControler,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24)
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                )
              ),
              style: TextStyle(fontSize: 15),
            ),
            Container(
              height: 100,
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(300, 50))),
                child: Text("ENTRAR"),
                onPressed: () async {
                  AutenticacaoController autenticadorController = AutenticacaoController();

                    bool dadosValidos = await autenticadorController.validarLogin(
                      _emailControler.text,
                      _senhaControler.text,
                    );
                    if (dadosValidos) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => homePage())
                          ));
                    } else {
                      print("FALHA NA AUTENTICACAO");
                    }
                },
              )
            ),
            Container(
              height: 150,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text("você não tem uma conta ?"),
                  TextButton(
                    child: Text("click aqui"),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => cadastroPage()),
                      ));
                    },
                  )
                ],
              )
              )
          ],
        ),
      ),
    );
  }
}