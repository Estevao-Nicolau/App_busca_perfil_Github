import 'package:desafio_app_github_estagio/pages/search_page/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../services/client_http.dart';
import '../user_page/widget/user_profile_page.dart';
import 'widget/custom_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final userController = TextEditingController();
  final ApiService apiService = ApiService();
  @override
  void dispose() {
    userController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String textSearch = 'Pesquisar...';
    const String textButton = 'Buscar';
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network(
                        'https://cdn.pixabay.com/photo/2014/07/15/23/36/github-394322__340.png')),
              ),
               Flexible(
                child: CustomFormTextFielde(
                  icon: Icons.search,
                  label: textSearch,
                  controller: userController,
                ),
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const UserProfile(),
                    ),
                  );
                },
                title: const Text(
                  textButton,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
