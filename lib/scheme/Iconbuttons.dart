import 'package:flutter/material.dart';
import 'package:cowin/infopage.dart';

class Notificationicon extends StatelessWidget {
  const Notificationicon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.notification_important_outlined),
      tooltip: 'Notification',
      onPressed: () {},
    );
  }
}

class Translateicon extends StatelessWidget {
  const Translateicon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.translate_outlined),
      tooltip: 'Translate',
      onPressed: () {},
    );
  }
}

class Infoicon extends StatelessWidget {
  const Infoicon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info_outline),
      tooltip: 'Info',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Info()),
        );
      },
    );
  }
}

class Appbarcontent extends StatelessWidget {
  const Appbarcontent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10),
      child: Container(
        width: 150,
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
