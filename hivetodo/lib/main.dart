import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'todo.dart';
import 'package:hivetodo/todo_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Todo',
      home: TodoHomePage(),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final Box<Todo> todoBox = Hive.box<Todo>('todos');
  final TextEditingController _controller = TextEditingController();

  void addTodo(String content) {
    if (content.trim().isNotEmpty) {
      todoBox.add(Todo(content: content.trim()));
      _controller.clear();
      setState(() {});
    }
  }

  void toggleComplete(Todo todo) {
    todo.isComplete = !todo.isComplete;
    todo.save();
    setState(() {});
  }

  void deleteTodo(int index) {
    todoBox.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Todo')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter todo'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => addTodo(_controller.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: todoBox.listenable(),
              builder: (context, Box<Todo> box, _) {
                if (box.isEmpty) {
                  return Center(child: Text('No todos yet.'));
                }
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final todo = box.getAt(index)!;
                    return TodoCard(
                      todo: todo,
                      onToggleComplete: () => toggleComplete(todo),
                      onDelete: () => deleteTodo(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
