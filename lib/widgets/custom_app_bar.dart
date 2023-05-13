import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isMainScreen;
  final bool floatAppbar;

  const CustomAppBar({
    Key key,
    @required this.currentUser,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
    this.isMainScreen = false,
    this.floatAppbar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: floatAppbar
            ? const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                ),
              ]
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'TYLDC',
              style: const TextStyle(
                color: Palette.tyldcYellow,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          !isMainScreen
              ? Container(
                  height: double.infinity,
                  width: 600.0,
                  child: CustomTabBar(
                    icons: icons,
                    selectedIndex: selectedIndex,
                    onTap: onTap,
                    isBottomIndicator: true,
                  ),
                )
              : SizedBox.shrink(),
          !isMainScreen
              ? Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      UserCard(user: currentUser),
                      const SizedBox(width: 12.0),
                      CircleButton(
                        icon: Icons.add_rounded,
                        iconSize: 30.0,
                        onPressed: () => print('admin functions'),
                      ),
                      CircleButton(
                        icon: Icons.search,
                        iconSize: 30.0,
                        onPressed: () => print('Search'),
                      ),
                      CircleButton(
                        icon: MdiIcons.facebookMessenger,
                        iconSize: 30.0,
                        onPressed: () => print('Messenger'),
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
