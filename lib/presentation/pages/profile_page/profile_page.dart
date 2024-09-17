import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../misc/methods.dart';
import 'methods/profile_item.dart';
import 'methods/user_info.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              verticalSpaces(20),
              ...userInfo(ref),
              verticalSpaces(20),
              const Divider(),
              verticalSpaces(20),
              profileItem('Update Profile'),
              verticalSpaces(20),
              profileItem('My Wallet'),
              verticalSpaces(20),
              profileItem('Change Password'),
              verticalSpaces(20),
              profileItem('Change Language'),
              verticalSpaces(20),
              const Divider(),
              verticalSpaces(20),
              profileItem('Contact Us'),
              verticalSpaces(20),
              profileItem('Privacy Policy'),
              verticalSpaces(20),
              profileItem('Terms & Conditions'),
              verticalSpaces(60),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              verticalSpaces(20),
              const Text(
                'Version 0.0.1',
                style: TextStyle(fontSize: 12),
              ),
              verticalSpaces(100),
            ],
          ),
        )
      ],
    );
  }
}
