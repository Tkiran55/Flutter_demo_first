import 'package:firstproject/homepage/reminder/reminderpart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _todoController = TextEditingController();
  List<String> _todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _todos = prefs.getStringList('todos') ?? [];
    });
  }

  Future<void> _saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', _todos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: DrawerHeader(child: Text('Drawer'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isDismissible: true,
            context: context,
            builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 120,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _todoController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Create a Todo',
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _todos.add(_todoController.text);
                                        _todoController.clear();
                                        _saveTodos();
                                      });
                                      Navigator.pop(
                                          context); // Close bottom sheet
                                    },
                                    child: const Icon(Icons.send)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReminderPart(),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'List of your messages',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(_todos[index]),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm"),
                          content: const Text(
                              "Are you sure you want to delete this message?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (direction) {
                    setState(() {
                      _todos.removeAt(index);
                      _saveTodos();
                    });
                  },
                  child: ListTile(
                    title: Text(_todos[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
