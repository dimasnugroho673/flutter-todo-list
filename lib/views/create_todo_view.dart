import 'package:flutter/material.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({Key? key}) : super(key: key);

  @override
  _CreateTodoViewState createState() => _CreateTodoViewState();
}

// state class
class _CreateTodoViewState extends State<CreateTodoView> {
  List<String> _todo = [];

  void _addTodo() {
    setState(() {
      // Use setState to update the state and trigger a UI rebuild
      if (etInput.text.isNotEmpty) {
        Navigator.of(context).pop();
        etInput.clear();
      }
    });
  }

  TextEditingController etInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // MaterialApp disini merupakan komponen material design (UI Kit) yang berhubungan dengan import package diatas
    return MaterialApp(
      title: "Hello world app",
      theme: ThemeData.light(useMaterial3: true),
      // Scaffold disini juga merupakan komponen dari material design (UI Kit)
      home: Scaffold(
        appBar: AppBar(title: const Text("Create todo")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: etInput,
                onTapOutside: (PointerDownEvent event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: const InputDecoration(
                  labelText: "Nama kegiatan",
                  hintText: "Masukkan nama kegiatan yang akan dilakukan"
                ),
              ),
              const SizedBox(height: 10, width: 10),
              Row(
                children: [
                  TextButton(
                    onPressed: _addTodo,
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                      textStyle: WidgetStatePropertyAll(TextStyle(
                        color: Colors.black
                      ))
                    ),
                    child: const Text("Tambah todo")
                  )
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}