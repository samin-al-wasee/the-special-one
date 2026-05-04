import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/navigation/app_back_button.dart';

class EditHomeScreen extends StatelessWidget {
  const EditHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Edit Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.public),
            title: const Text('Continents'),
            subtitle: const Text('List and detail with team/player counts'),
            onTap: () => context.push('/edit/continents'),
          ),
          ListTile(
            leading: const Icon(Icons.flag),
            title: const Text('Countries'),
            subtitle: const Text('List and detail with team and player count'),
            onTap: () => context.push('/edit/countries'),
          ),
          ListTile(
            leading: const Icon(Icons.groups),
            title: const Text('Teams'),
            subtitle: const Text('List and detail with tactics and lineup'),
            onTap: () => context.push('/edit/teams'),
          ),
          ListTile(
            leading: const Icon(Icons.person_search),
            title: const Text('Players'),
            subtitle: const Text(
              'Continent > Country > Players > Detail (nationality scope)',
            ),
            onTap: () => context.push('/edit/players'),
          ),
        ],
      ),
    );
  }
}
