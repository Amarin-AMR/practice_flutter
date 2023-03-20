import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_team/screens/listscreen/list_screen.dart';
import 'package:pokemon_team/screens/provider/getdata.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => GetDataProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(
            58,
            66,
            86,
            1.0,
          ),
        ),
        home: const ListScreen(),
        // routes: {
        //   ListScreen.id: (context) => const ListScreen(),
        //   TeamList.id: (context) => const TeamList()
        // },
      ),
    ),
  );
}
