import 'package:flutter/material.dart';
import 'package:mobx_aula/controller.dart';
import 'package:mobx_aula/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // MaterialApp(
    //   home: Home(),
    // )
    MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
        )
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    )
  );
}
