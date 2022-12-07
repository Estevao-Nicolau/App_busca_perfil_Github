import 'package:flutter/material.dart';

import '../../../models/repositorio_list_model.dart';
import '../../../services/client_http.dart';

class RepositorioList extends StatelessWidget {
  const RepositorioList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RepositorioListModel>>(
      future: ApiService.getUserInfos(''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<RepositorioListModel> listReposotori = snapshot.data!;
          return ListView.builder(
              itemCount: listReposotori.length,
              itemBuilder: (context, i) {
                return Card(
                    child: Column(
                  children: [
                    Text(listReposotori[i].name!),
                    Text(listReposotori[i].description.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.star_border_sharp),
                        Text(listReposotori[i].watchers!.toString()),
                        Text(listReposotori[i].updatedAt!),
                      ],
                    ),
                  ],
                ));
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

// snapshot.data faz parte do futurei build é exatamente o valor to return do metodo do Future


// return Expanded(
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       child: Center(
//                         child: Image.network(
//                           itens[i].avatarUrl!,
//                           height: 100.0,
//                           width: 100.0,
//                         ),
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         // Text(textTitle),
//                         // Text(textSubtitle),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Row(crossAxisAlignment: CrossAxisAlignment.start,
//                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: const [
//                     Icon(Icons.people_rounded),
//                     // Text(textFollowers),
//                     Icon(Icons.favorite_border),
//                     // Text(textFollowers),
//                   ]),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: const [
//                     // Flexible(
//                     //     child: Text(
//                     //   textGreat,
//                     //   textDirection: TextDirection.ltr,
//                     // )),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: const [
//                   Icon(
//                     Icons.edit,
//                   ),
//                   // Text(textIcon),
//                   Icon(Icons.add_location),
//                   // Text(textIcon),
//                   Icon(Icons.email_outlined),
//                   // Flexible(child: Text(textEmail)),
//                 ],
//               ),
//               Row(
//                 children: const [
//                   Icon(Icons.animation_sharp),
//                   // Flexible(child: Text(textSite)),
//                   Icon(Icons.person_sharp),
//                   // Flexible(child: Text(textTwite)),
//                 ],
//               ),
//               // ListView.builder(
//               //   itemBuilder: (_, index) => Text('Repositorio nome $index'),
//               // ),
//             ],
//           ),
//         ),
//       );