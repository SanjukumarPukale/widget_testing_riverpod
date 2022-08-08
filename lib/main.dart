import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final counterProvider = StateProvider<int>((ref) => 0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Testing'),
      ),
      body: Center(
        child: Consumer(builder: (__, ref, _) {
          final counter = ref.watch(counterProvider);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$counter'),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: () {
                ref.read(counterProvider.notifier).state++;
              }, child: Text('Increment'), ),
            ],
          );

        },),

      ),
    );
  }
}
