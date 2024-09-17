import '../../extensions/build_context_extension.dart';
import '../../misc/methods.dart';
import '../../providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/router/router_provider.dart';
import '../../widgets/bottom_navbar.dart';
import '../../widgets/bottom_navbar_item.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        // * JIKA DATA SEBELUMNYA TIDAK SAMA DENGAN NULL DAN SELANJUTNYA ADALAH ASYNC DATA DAN VALUENYA NULL
        if (previous != null && next is AsyncData && next.value == null) {
          ref.read(routerProvider).goNamed('login');
        } else if (next is AsyncError) {
          context.showSnackBar(next.error.toString());
        }
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) => setState(() {
              selectedPage = value;
            }),
            children: const [
              Center(
                child: Text('Main page'),
              ),
              Center(
                child: Text('Ticket page'),
              ),
              Center(
                child: Text('Profile page'),
              ),
            ],
          ),
          BottomNavbar(
              items: [
                BottomNavbarItem(
                    index: 0,
                    isSelected: selectedPage == 0,
                    title: 'Home',
                    image: 'assets/movie.png',
                    selectedImage: 'assets/movie-selected.png'),
                BottomNavbarItem(
                    index: 1,
                    isSelected: selectedPage == 1,
                    title: 'Ticket',
                    image: 'assets/ticket.png',
                    selectedImage: 'assets/ticket-selected.png'),
                BottomNavbarItem(
                    index: 2,
                    isSelected: selectedPage == 2,
                    title: 'Home',
                    image: 'assets/profile.png',
                    selectedImage: 'assets/profile-selected.png'),
              ],
              onTap: (index) {
                selectedPage = index;

                pageController.animateToPage(selectedPage,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              },
              selectedIndex: 0),
        ],
      ),
    );
  }
}
