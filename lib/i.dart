import 'package:flutter/material.dart';
import 'package:untitled1/main/theme.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: body(),
    );
  }

  Widget body() {
    return ListView.builder(
      itemBuilder: (context, i) {
        return ListTile(
          title: ChatItem(
              widget: FlutterLogo(),
              initial: 'FI',
              title: 'Flutter Indonesia',
              sender: '',
              message: 'Hello. Does anyone know how can i directly on/off',
              time: '22:14',
              mute: false,
              unread: 1902,
              color: Colors.lightBlue),
        );
      },
    );
  }
}

class ChatItem extends StatelessWidget {
  final Widget widget;
  final String initial;
  final String title;
  final String sender;
  final String message;
  final String time;
  final bool mute;
  final int unread;
  final Color color;

  const ChatItem({
    Key? key,
    required this.widget,
    required this.initial,
    required this.title,
    required this.sender,
    required this.message,
    required this.time,
    required this.mute,
    required this.unread,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      leading: CircleAvatar(
        backgroundColor: color,
        radius: 25,
        child: initial.isNotEmpty
            ? Text(initial,
                style: const TextStyle(color: kWhiteColor, fontSize: 20))
            : widget,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Text(title, style: TextStyle(fontWeight: bold, fontSize: 17)),
            const SizedBox(width: 5),
            mute
                ? const Icon(Icons.volume_off, color: kGreyColor, size: 15)
                : Container(),
            const Spacer(),
            Text(time, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                sender.isNotEmpty
                    ? Text(
                        '$sender: ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            color: kBlue2Color,
                            fontWeight: semiBold),
                      )
                    : Container(),
                Expanded(
                  child: Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15,color: Colors.white60),
                  ),
                ),
              ],
            ),
          ),
          unread > 9
              ? Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: kSilverColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(unread.toString(),
                      style: TextStyle(
                          fontSize: 13,
                          color: kWhiteColor,
                          fontWeight: semiBold)),
                )
              : (unread > 0
                  ? CircleAvatar(
                      backgroundColor: kSilverColor,
                      child: Text(unread.toString(),
                          style: TextStyle(
                              fontSize: 13,
                              color: kWhiteColor,
                              fontWeight: semiBold)),
                      radius: 12,
                    )
                  : Container()),
        ],
      ),
    );
  }
}
