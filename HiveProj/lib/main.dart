import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Initialize Flutter.
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive.  This needs to happen before any Hive boxes are opened.
  await Hive.initFlutter();
  // Open the Hive box.  It is good practice to await this, although not strictly required.  We specify the type as dynamic because it's an empty project.  In a real project, you'd use a specific type.
  await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Get a reference to the Hive box.  We use late initialization because it's used in initState.
  late final Box myBox;

  @override
  void initState() {
    super.initState();
    // Assign the box.  This is safe because we await Hive.openBox in main().
    myBox = Hive.box('myBox');
    // You could perform initial setup here, like checking if the box is empty.
    if (myBox.isEmpty) {
      // myBox.put('initialKey', 'initialValue'); // Add initial data if needed.
    }
  }

  @override
  void dispose() {
    // Close the box when the widget is disposed.  While not strictly required, it's good practice.
    // myBox.close(); // Removed close()
    super.dispose();
  }

  void _addData() {
    // Add data to the Hive box.  The key can be a String, an integer, or any other supported type.
    myBox.put('key_${myBox.length}', 'Value ${myBox.length}'); // Use increasing key.
    _showSnackBar('Data added!');
    setState(() {}); // Trigger a rebuild to update the UI.
  }

    void _readData() {
    // Read data from the Hive box.
    if (myBox.isNotEmpty) {
      String? value = myBox.get('key_0'); //Get first key
      _showSnackBar('First Value: ${value ?? "No data"}');
    } else {
      _showSnackBar('Box is empty!');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Data in Hive box:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            // Use a ValueListenableBuilder to rebuild when the Hive box changes.
            ValueListenableBuilder(
              valueListenable: myBox.listenable(),
              builder: (context, Box box, _) {
                // Display the number of items in the box.
                return Text(
                  '${box.length}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
             const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _readData,
              child: const Text('Read Data'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addData,
              child: const Text('Add Data'),
            ),
          ],
        ),
      ),
    );
  }
}

