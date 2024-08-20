import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ViewModel())],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _input = 0;
  String result = '';


  void onChangedInput(String input) {
    setState(() {
      _input = int.parse(input);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: onChangedInput,
                  decoration: InputDecoration(
                    hintText: 'Input number here',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              result = viewModel.firstProblem(_input);
                            });
                          },
                          child: const Text('1'),
                        )
                    ),
                    Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              result = viewModel.secondProblem(_input);
                            });
                          },
                          child: const Text('2'),
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              result = viewModel.thirdProblem(_input);
                            });
                          },
                          child: const Text('3'),
                        )
                    ),
                    Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              result = viewModel.fourthProblem(_input);
                            });
                          },
                          child: const Text('4'),
                        )
                    ),
                  ],
                ),
                Text(
                  'Result',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  result,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
