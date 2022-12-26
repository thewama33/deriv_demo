import 'dart:convert';

import 'package:deriv_demo/features/home/domain/usecases/Get_Active_Sympols.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home/presentation/cubit/sockets_cubit.dart';
import 'services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SocketsCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

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
  final GetActiveSympols activeSympols =
      GetActiveSympols(socketsRepository: getit());
  @override
  void initState() {
    activeSympols.addEvent(jsonEncode(_activeSympols));
    super.initState();
  }

  @override
  void dispose() {
    activeSympols.socketsRepository.addActiveSympolsEvents.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.send),
          onPressed: () {},
        ),
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: StreamBuilder(
              stream: activeSympols.execute(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final model = snapshot.data;
                  return ListView.builder(
                    itemCount: model?.activeSymbols?.length,
                    itemBuilder: (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${model?.activeSymbols?[index].marketDisplayName}")
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return  Center(child: Text("Something Went Wront \n\n ${snapshot.error}"),);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
