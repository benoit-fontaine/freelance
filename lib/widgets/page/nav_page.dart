import 'package:flutter/material.dart';
import 'package:freelance/models/nav_item.dart';
import 'package:go_router/go_router.dart';

class NavPage extends StatelessWidget {
  final Widget? title;
  final bool forceMenu;
  final List<NavItem> navItems;
  final Widget child;

  const NavPage({
    Key? key,
    this.title,
    required this.forceMenu,
    required this.navItems,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> menu = [
      DrawerHeader(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Text(
          'Menu',
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: Colors.white, fontSize: 24),
        ),
      ),
    ];
    menu.addAll(navItems.map((e) => ListTile(
          leading: Icon(e.icon),
          title: Text(e.name),
          onTap: () {
            context.push(e.navDestination);
          },
        )));

    return Scaffold(
      appBar: AppBar(
        title: title,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            if (context.canPop() && !forceMenu) {
              return IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              );
            }
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: child,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: menu,
        ),
      ),
    );
  }
}
