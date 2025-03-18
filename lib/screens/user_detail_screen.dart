import 'package:flutter/material.dart';
import 'package:app_flutter_rest/models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${user.name.first} ${user.name.last}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard('Personal Information', [
              _buildInfoRow('Full Name', '${user.name.first} ${user.name.last}'),
              _buildInfoRow('Username', '@${user.login.username}'),
              _buildInfoRow('Email', user.email),
              _buildInfoRow('Phone', user.phone),
              _buildInfoRow('Cell', user.cell),
            ]),
            const SizedBox(height: 16.0),
            _buildInfoCard('Address', [
              _buildInfoRow('Street', '${user.location.street.number} ${user.location.street.name}'),
              _buildInfoRow('City', user.location.city),
              _buildInfoRow('State', user.location.state),
              _buildInfoRow('Country', user.location.country),
              _buildInfoRow('Zipcode', user.location.postcode),
              _buildInfoRow(
                'Coordinates',
                '${user.location.coordinates.latitude}, ${user.location.coordinates.longitude}',
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.0,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
