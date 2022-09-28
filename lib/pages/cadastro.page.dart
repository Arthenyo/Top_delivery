import 'package:app_delivery/models/usuario.models.dart';
import 'package:app_delivery/pages/login.page.dart';
import 'package:flutter/material.dart';
import '../controllers/autenticacao.controller.dart';
import '../repository/usuario.repository.dart';

class cadastroPage extends StatefulWidget {
  const cadastroPage({Key? key}) : super(key: key);

  @override
  State<cadastroPage> createState() => _cadastroPageState();
}

class _cadastroPageState extends State<cadastroPage> {
  TextEditingController _nomeControler = TextEditingController();
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _senhaControler = TextEditingController();
  TextEditingController _senha2Controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Text("voltar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // IconButton

          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        // AppBar

        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("BEM VINDO AO \nTOP DELIVERY",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontSize: 30)),
            // TextStyle // Text

            const Text("CADASTRO",
                overflow: TextOverflow.clip,
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            // TextStyle // Text

            Container(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nomeControler,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Nome Completo",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24)
                        ),
                        // OutlineInputBorder

                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        )),
                        // TextStyle // InputDecoration

                    style: const TextStyle(fontSize: 15),
                  ),
                  // TextFormField

                  const SizedBox(
                    height: 5,
                  ),
                  // SizedBox

                  TextFormField(
                    controller: _emailControler,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24)
                        ),
                        // OutlineInputBorder

                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        )),
                        // TextStyle // InputDecoration

                    style: const TextStyle(fontSize: 15),
                  ),
                  // TextFormField

                  const SizedBox(
                    height: 5,
                  ),
                  // SizedBox

                  TextFormField(
                    controller: _senhaControler,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Senha",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24)
                        ),
                        // OutlineInputBorder

                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        )),
                        // TextStyle // InputDecoration

                    style: const TextStyle(fontSize: 15),
                  ),
                  // TextFormField

                  const SizedBox(
                    height: 5,
                  ),
                  // SizedBox

                  TextFormField(
                    controller: _senha2Controler,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Confirma Senha",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24)
                        ),
                        // OutlineInputBorder

                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        )),
                        //
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
                height: 60,
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(300, 50))),
                  child: const Text("SALVAR"),
                  onPressed: () async {
                    AutenticacaoController autenticadorController = AutenticacaoController();

                    bool senhasIguais = autenticadorController.verificarSeAsSenhasSaoIguais(
                      _senhaControler.text,
                      _senha2Controler.text,
                    );

                    bool emailValido = autenticadorController.validarEmail(_emailControler.text);
                    bool senhaValida = autenticadorController.validarSenha(_senhaControler.text);

                    if (senhasIguais && emailValido && senhaValida) {
                      UsuarioModel usuario = UsuarioModel(
                        nome: _nomeControler.text,
                        email: _emailControler.text,
                        senha: _senhaControler.text,
                      );

                      await autenticadorController.cadastrarUsuario(usuario);

                      Navigator.pop(context);
                    } else {
                      print("Senhas iguais $senhasIguais");
                      print("Email valido $emailValido");
                      print("Senha valida $senhaValida");
                    };


                    }
                  ,
                ))
          ],
        )));
  }
}
