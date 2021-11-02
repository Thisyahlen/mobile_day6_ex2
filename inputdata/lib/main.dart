import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inputdata/text_chain/text_chain_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => TextChainCubit(),
          child: const MyHomePage(title: 'BloC Input, Capitalize and Display')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<TextChainCubit, String>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    obscureText: false,
                    onChanged: (String? text) {
                      context.read<TextChainCubit>().setTextChain(text ?? "-",);
                      context.read<TextChainCubit>().toUpperChase();
                    },
                    decoration:
                        const InputDecoration(labelText: "Type yo words"),
                  ),
                );
              },
            ),
            BlocConsumer<TextChainCubit, String>(
              listener: (context, state) {
              },
              builder: (context, state) {
                return Text(
                  state,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}