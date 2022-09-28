import 'package:app_delivery/pages/login.page.dart';
import 'package:app_delivery/repository/usuario.repository.dart';
import 'package:flutter/material.dart';

import '../controllers/home.controller.dart';
import '../models/usuario.models.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  
  UsuarioModel? dadosDoUsuario;

  HomeController homeController = HomeController();

  carregarDadosDoUsuario() async {
    UsuarioModel usuarioLocal = await homeController.popularUsuario();
    setState(() {
      dadosDoUsuario = usuarioLocal;
    });
  }

  @override
  void initState() {
    carregarDadosDoUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.orange,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.orange,
              tabs: const [
                Tab(icon: Icon(Icons.fastfood_rounded),text: "FastFood"),
                Tab(icon: Icon(Icons.medical_services),text: "Farmacia"),
                Tab(icon: Icon(Icons.store),text: "Mercado"),
              ],
            ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {},
            )
          ],
          centerTitle: true,
          title: const Text(
            "TOP DELIVERY",
            style: const TextStyle(fontSize: 15),
          ),
          backgroundColor: Colors.white70,
        ),
        drawer: Drawer(
          
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
               UserAccountsDrawerHeader(
                accountName: Text("Seu Nome"),
                accountEmail: Text("email@seuemail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text("SN"),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Minha conta"),
                onTap: () {
                  Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_basket),
                title: const Text("Meus pedidos"),
                onTap: () {
                  Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text("Favoritos"),
                onTap: () {
                  Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Sair"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
            ],
          ),
        ),
          body: TabBarView(
            children: [
              Container(
              color: Colors.white,
              child: Container(
                child: ListView(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        ),
                      onPressed: (){},
                      child: ListTile(
                        leading: Image.asset("images/lojas.png"),
                        title: Text("Pizzaria Expressy",style: TextStyle(fontSize: 25)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Comprar",style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                        )],)
                      )
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        ),
                      onPressed: (){},
                      child: ListTile(
                        leading: Image.asset("images/lojas.png"),
                        title: Text("HamburDog",style: TextStyle(fontSize: 25)),
                        subtitle: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Comprar",style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                              )
                            ],
                            )
                      )
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white
                        ),
                      onPressed: (){},
                      child: ListTile(
                        leading: Image.asset("images/lojas.png"),
                        title: Text("Pizzaria Alinne",style: TextStyle(fontSize: 25)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Comprar",style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                              )
                            ],
                            )
                      )
                    ),
                  ]
                ),
              )
            ),
            Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        ),
                      onPressed: (){},
                      child: ListTile(
                        leading: Image.asset("images/lojas.png"),
                        title: Text("Farmacia Fragoso",style: TextStyle(fontSize: 25)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Comprar",style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                              )
                            ],
                            )
                      )
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        ),
                      onPressed: (){},
                      child: ListTile(
                        leading: Image.asset("images/lojas.png"),
                        title: Text("Farmacia Central",style: TextStyle(fontSize: 25)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Comprar",style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                              )
                            ],
                            )
                      )
                    ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        ),
                      onPressed: (){},
                      child: ListTile(
                        leading: Image.asset("images/lojas.png"),
                        title: Text("Supermercado Eneas",style: TextStyle(fontSize: 25)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Comprar",style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                              )
                            ],
                            )
                      )
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        ),
                      onPressed: (){},
                      child: ListTile(
                        leading: Image.asset("images/lojas.png"),
                        title: Text("Armazem Galdino",style: TextStyle(fontSize: 25)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Comprar",style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                              )
                            ],
                            )
                      )
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        ),
                      onPressed: (){},
                      child: ListTile(
                        leading: Image.asset("images/lojas.png"),
                        title: Text("Super Amigo",style: TextStyle(fontSize: 25)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Comprar",style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                              )
                            ],
                            )
                      )
                    ),
                ],
              ),
            ), 
           ],
          ),
        ),
    );
  }
}
