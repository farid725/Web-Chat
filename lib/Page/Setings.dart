import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          BigUserCard(
            backgroundColor: Colors.deepOrange.shade400,
            userName: "Robert Griesemer",
            userProfilePic: AssetImage("assets/111.jpg"),
            cardActionWidget: SettingsItem(
              icons: Icons.edit,
              iconStyle: IconStyle(
                withBackground: true,
                borderRadius: 50,
                backgroundColor: Colors.yellow[600],
              ),
              title: "Modify",
              titleStyle: TextStyle(color: Colors.black),
              subtitle: "Tap to change your data",
              onTap: () {
                print("OK");
              },
            ),
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: CupertinoIcons.pencil_outline,
                iconStyle: IconStyle(),
                title: 'Appearance',
                titleStyle: TextStyle(color: Colors.black),
                subtitle: "Make Ziar'App yours",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.dark_mode_rounded,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.red,
                ),
                title: 'Dark mode',
                titleStyle: TextStyle(color: Colors.black),
                subtitle: "Automatic",
                trailing: Switch.adaptive(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.info_rounded,
                iconStyle: IconStyle(
                  backgroundColor: Colors.purple,
                ),
                title: 'About',
                titleStyle: TextStyle(color: Colors.black),
                subtitle: "Learn more about Ziar'App",
              ),
            ],
          ),
          SettingsGroup(
            settingsGroupTitle: "Account",
            settingsGroupTitleStyle: TextStyle(color: Colors.black),
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.exit_to_app_rounded,
                title: "Sign Out",
                titleStyle: TextStyle(color: Colors.black),
              ),
              SettingsItem(
                onTap: () {},
                icons: CupertinoIcons.delete_solid,
                title: "Delete account",
                titleStyle: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
