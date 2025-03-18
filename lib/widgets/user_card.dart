import 'package:flutter/material.dart';
import 'package:app_flutter_rest/models/user.dart';
import 'package:app_flutter_rest/screens/user_detail_screen.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            user.name.first[0],  // Mostrar la primera letra del nombre
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          user.name.fullName,  // Usar el nombre completo del usuario
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4.0),
            Text('@${user.login.username}'),  // Se corrigió el acceso al username
            const SizedBox(height: 4.0),
            Text(user.email),
          ],
        ),
        onTap: () {
          // Navegar a la pantalla de detalles del usuario
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailScreen(user: user),
            ),
          );
        },
      ),
    );
  }
}
