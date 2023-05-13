import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'Reported Accounts', null],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends', null],
    [MdiIcons.facebookMessenger, Palette.tyldcYellow, 'Chats', null],
    [MdiIcons.flag, Colors.orange, 'Pages', null],
    [MdiIcons.storefront, Palette.tyldcYellow, 'Events', null],
    [Icons.ondemand_video, Palette.tyldcYellow, 'Watch', null],
    [
      MdiIcons.contentSaveAlert,
      Colors.purpleAccent,
      'Conversation',
      ['groups', 'Private chats']
    ],
    [
      MdiIcons.naturePeople,
      Colors.red,
      'Users',
      ['Add User', 'View User']
    ],
    [
      MdiIcons.accountGroup,
      Colors.red,
      'Staffs',
      ['Add Staff', 'View Staff']
    ],
  ];

  final User currentUser;
  final double maxWidth;

  const MoreOptionsList({
    Key key,
    @required this.maxWidth,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth ?? 280.0),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(user: currentUser),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _Option(
                icon: option[0],
                color: option[1],
                label: option[2],
                dropdownMenuItem: option[3] ?? option[3] as List<String>),
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final List<String> dropdownMenuItem;

  const _Option({
    Key key,
    @required this.icon,
    @required this.color,
    @required this.label,
    @required this.dropdownMenuItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: ((value) {}),
      onTap: () => print(label),
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        leading: Icon(icon, size: 38.0, color: color),
        title: Flexible(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16.0),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: dropdownMenuItem != null
            ? _DropDownWidget(dropdownMenuItem: dropdownMenuItem)
            : null,
      ),

      //  Row(
      //   children: [
      //     Icon(icon, size: 38.0, color: color),
      //     const SizedBox(width: 6.0),
      //     Flexible(
      //       child: Text(
      //         label,
      //         style: const TextStyle(fontSize: 16.0),
      //         overflow: TextOverflow.ellipsis,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class _DropDownWidget extends StatelessWidget {
  const _DropDownWidget({
    Key key,
    @required this.dropdownMenuItem,
  }) : super(key: key);

  final List<String> dropdownMenuItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        elevation: 0,
        enableFeedback: false,
        borderRadius: BorderRadius.circular(15),
        icon: Icon(Icons.more_horiz_rounded),
        items: dropdownMenuItem
            .map((String value) => DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                ))
            .toList(),
        onChanged: (_) {},
      ),
    );
  }
}
