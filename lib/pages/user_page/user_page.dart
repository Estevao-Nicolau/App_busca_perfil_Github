import 'package:flutter/material.dart';

import 'widget/user_list_repost_page.dart';
import 'widget/user_profile_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        RepositorioList(),
       UserProfile(),
      ],
    );
  }
}
