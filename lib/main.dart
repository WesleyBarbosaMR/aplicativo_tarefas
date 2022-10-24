// ignore_for_file: library_private_types_in_public_api, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ListaDeTarefas extends StatefulWidget {
  @override
  _ListaDeTarefasState createState() => _ListaDeTarefasState();
}

class _ListaDeTarefasState extends State<ListaDeTarefas> {
  final List<String> _listaDeItens = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),
      body: ListView(children: _pegarItens()),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _mostrarDialogo(context),
          tooltip: 'Adicionando um item',
          child: Icon(Icons.add)),
    );
  }

  List<Widget> _pegarItens() {
    final List<Widget> _listaDeWidgets = <Widget>[];
    for (String title in _listaDeItens) {
      _listaDeWidgets.add(_gerarItem(title));
    }
    return _listaDeWidgets;
  }

  Widget _gerarItem(String title) {
    return ListTile(title: Text(title));
  }

  void _adicionarItem(String title) {
    setState(() {
      _listaDeItens.add(title);
    });
    _textFieldController.clear();
  }

  // Generate a single item widget

  Future _mostrarDialogo(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Adicione uma tarefa à sua lista'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Descreva a tarefa'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Adicionar'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _adicionarItem(_textFieldController.text);
                },
              ),
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ListaDeTarefas(),
    );
  }
}
