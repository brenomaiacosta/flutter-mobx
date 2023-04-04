import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controller.dart';
import 'package:mobx_aula/principal.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Controller controller;
  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    controller = Provider.of<Controller>(context);

    //É sempre chamado para todos os valores.
    autorun((_) => {
      print(controller.formularioValidado)
    });

    //Só é chamado para valores definidos e quando estes são alterados.
    //O reactionDisposer serve para matar a escuta assim que o widget for descontruido, economizando recursos.
    reactionDisposer = reaction(
      (_) => controller.usuarioLogado, 
      (usuarioLogado) {
        if (usuarioLogado) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => Principal())
          );
        }
      }
    );
  }

  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: controller.setEmail
              )
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Senha"),
                onChanged: controller.setSenha
              )
            ),
            Observer(builder: (_){
              return Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  controller.formularioValidado ? "Validado": "Campos não validados:"
                )
              );
            }),
            Observer(builder: (_){
              return Padding(
                padding: EdgeInsets.all(16),
                child: controller.carregando ?
                  CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue),)
                  : ElevatedButton(
                    onPressed: controller.formularioValidado
                    ? (){ controller.logar();}
                    : null,
                    child: const Text(
                      "Logar",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )
                  ),
              );
            })
          ],
        ),
      ),
    );
  }
}