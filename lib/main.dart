import 'dart:convert';

import 'package:deriv_demo/active_sympol_model.dart';
import 'package:deriv_demo/websockets_managert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'bloc/sockets_cubit.dart';

void main() => runApp(BlocProvider(
      create: (context) => SocketsCubit(),
      child: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, dynamic> _request = {'ticks': 'R_50', 'subscribe': 1};
  final Map<String, dynamic> _activeSympols = {
    "active_symbols": "brief",
    "product_type": "basic"
  };

  IOWebSocketChannel channel =
      IOWebSocketChannel.connect(WebSocketHelper.baseUrl);

  @override
  void initState() {
    channel.sink.add(jsonEncode(_activeSympols));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.send),
          onPressed: () {
            setState(() {
              channel.sink.add(jsonEncode(_activeSympols));
              print("Added");
            });
          },
        ),
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  ActiveSymbolsModel model =
                      ActiveSymbolsModel.fromJson(json.decode(snapshot.data));

                  return ListView.builder(
                    itemCount: model.activeSymbols?.length,
                    itemBuilder: (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${model.activeSymbols![index].displayName}")
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
