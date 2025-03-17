import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../screens/edit_user_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userProvider.users.isEmpty) {
            return const Center(child: Text('No users found'));
          }

          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              final user = userProvider.users[index];
              return ListTile(
  leading: CircleAvatar(
    backgroundImage: user.avatar.isNotEmpty
        ? NetworkImage(user.avatar) as ImageProvider
        : const AssetImage('assets/profile.png'),
  ),
  title: Text(user.name),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(user.email),
      Text("Occupation: ${user.occupation}"),
      Text("Bio: ${user.bio}"),
    ],
  ),
  trailing: IconButton(
    icon: const Icon(Icons.edit),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditUserScreen(user: user),
        ),
      );
    },
  ),
);

            },
          );
        },
      ),
    );
  }
}
