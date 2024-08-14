import 'package:flutter/material.dart';

// fungsi wajib di flutter
void main() {
  runApp(const TodoListWidget());
}

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

// state class
class _TodoListWidgetState extends State<TodoListWidget> {
  List<String> _todo = [];

  void _addTodo() {
    setState(() {
      // Use setState to update the state and trigger a UI rebuild
      if (etInput.text.isNotEmpty) {
        _todo.add(etInput.text);
        etInput.clear();
      }
    });
  }

  void _clearTodo() {
    setState(() {
      _todo.clear();
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      _todo.removeAt(index);
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
        appBar: AppBar(title: const Text("myTodo"),),
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
                  ),
                  const SizedBox(height: 10, width: 10),
                  TextButton(
                    onPressed: () async {
                      await _clearTodoDialog(context);
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                      textStyle: WidgetStatePropertyAll(TextStyle(
                        color: Colors.black
                      ))
                    ),
                    child: const Text("Hapus todo")
                  )
                ],
              ),
              const SizedBox(height: 20, width: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _todo.length,
                  itemBuilder: (context, index) {
                    var number = index + 1;
                    return Row(
                      children: [
                        Text("${number}. ${_todo[index]}"),
                        TextButton(onPressed: () async {
                          await _deleteTodoDialog(context, index);
                        }, child: const Text("Hapus",
                          style: TextStyle(color: Colors.red),
                        ))
                      ],
                    );
                  }
                )
              ),
            ],
          ),
        )
      ),
    );
  }

  Future<void> _deleteTodoDialog(BuildContext context, int index) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus'),
          content: const Text(
            'Hapus todo ini?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Hapus'),
              onPressed: () {
                _deleteTodo(index);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _clearTodoDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus'),
          content: const Text(
            'Hapus semua todo?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Hapus'),
              onPressed: () {
                _clearTodo();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}