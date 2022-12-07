import 'package:flutter/material.dart';

import '../../../models/user_profile_model.dart';
import '../../../services/client_http.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserProfileModel>>(
      future: ApiService.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<UserProfileModel> userProfile = snapshot.data!;
          return ListView.builder(
              itemCount: userProfile.length,
              itemBuilder: (context, i) {
                return Card(
                    child: Column(
                  children: [
                    Text(userProfile[i].name!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.star_border_sharp),
                        Text(userProfile[i].bio.toString()),
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


// Column(
//         children: [
//       Container(
//         child: Card(
//         color: const Color.fromARGB(234, 211, 142, 251),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
                  
//                   const Padding(
//                     padding: EdgeInsets.all(13.0),
//                     child: CircleAvatar(
//                       backgroundImage: NetworkImage(
//                         'https://avatars.githubusercontent.com/u/79880613?v=4',
//                       ),
//                       radius: 25,
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(textTitle),
//                       Text(textSubtitle),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Row(crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: const [
                  
//                   Icon(Icons.people_rounded),
//                   Text(textFollowers),
//                   Icon(Icons.favorite_border),
//                   Text(textFollowers),
//                 ]),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Flexible(
//                       child: Text(
//                     textGreat,
//                     textDirection: TextDirection.ltr,
//                   )),
//                 ],
//               ),
//             ),
//             Row(
//               children: const [
//                 Icon(
//                   Icons.edit,
//                 ),
//                 Text(textIcon),
//                 Icon(Icons.add_location),
//                 Text(textIcon),
//                 Icon(Icons.email_outlined),
//                 Flexible(child: Text(textEmail)),
//               ],
//             ),
//             Row(
//               children: const [
//                 Icon(Icons.animation_sharp),
//                 Flexible(child: Text(textSite)),
//                 Icon(Icons.person_sharp),
//                 Flexible(child: Text(textTwite)),
//               ],
//             ),
//           ],
//         ),
//       ),
//       ),
//       Container(
//         child: const RepositorioList(),
//       ),
//         ],
//       );