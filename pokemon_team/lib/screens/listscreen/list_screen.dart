import 'package:flutter/material.dart';
import 'package:pokemon_team/components/futurelist.dart';
import 'package:pokemon_team/constant.dart';

// class ListScreen extends StatefulWidget {
//   const ListScreen({super.key});

//   @override
//   State<ListScreen> createState() => _ListScreenState();
// }

// class _ListScreenState extends State<ListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // final dataProvider = Provider.of<GetDataProvider>(context);
//     return Scaffold(
//       backgroundColor: kScaffoldColour,
//       appBar: AppBar(
//         elevation: 0.1,
//         backgroundColor: kAppBarColour,
//         title: const Text('Pokemon'),
//       ),
//       body: const SafeArea(child: FutureList()),
//     );
//   }
// }

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColour,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: kAppBarColour,
        title: const Text('Pokemon'),
      ),
      body: const SafeArea(child: FutureList()),
    );
  }
}









//  body: dataProvider.isLoading
//           ? Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: 10,
//                   itemBuilder: (ctx, i) {
//                     return Column(
//                       children: const [
//                         CircularProgressIndicator(),
//                         SizedBox(
//                           height: 10,
//                         )
//                       ],
//                     );
//                   }),
//             )
//           : ListView.builder(
//               // controller: scrollController,
//               shrinkWrap: true,
//               itemCount: listMax,
//               itemBuilder: (context, i) {
//                 if (i == listMax - 1) {
//                   return const CupertinoActivityIndicator(
//                     radius: 20.0,
//                     color: Colors.red,
//                   );
//                 }
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     child: ListTile(
//                       title: Text(dataProvider.responseData.results![i].name!),
//                       // Text(dataProvider.responsepoke[i].name!),
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => ShowPokemon(
//                         //       url: dataProvider.responseData.results![i].url!,
//                         //     ),
//                         //   ),
//                         // );
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),