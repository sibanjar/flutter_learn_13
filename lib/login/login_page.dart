import 'package:flutter/material.dart';
import 'package:flutter_learn_13/home_page.dart';
import 'package:go_router/go_router.dart';

import '../utility/routes/route_names.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Object extraString = GoRouterState.of(context).extra!;

    return Scaffold(
      appBar: AppBar(title: const Text('Login Page'),),
      body : Center(
          child: Column(
            children: [
              Text(extraString.toString()),
              ElevatedButton(
                  onPressed: (){
                    context.pushNamed(RoutePathConstants.profile);
                  },
                  child: const Text('login')),
            ],
          )),
    );
  }
}
