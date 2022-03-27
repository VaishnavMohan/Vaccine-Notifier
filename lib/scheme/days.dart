import 'package:flutter/material.dart';
import 'expansiontile.dart';

class Thisweek extends StatelessWidget {
  const Thisweek({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tile(
          texts: "07/08/2021",
          subtexts: "10 Slots",
          description: "Description",
        ),
        Tile(
          texts: "07/09/2021",
          subtexts: "20 Slots",
          description: "Description 2",
        ),
      ],
    );
  }
}

class Tommarow extends StatelessWidget {
  const Tommarow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tile(
          texts: "Monday",
          subtexts: "10 Slots",
          description: "Description",
        ),
        Tile(
          texts: "Tuesday",
          subtexts: "20 Slots",
          description: "Description 2",
        ),
      ],
    );
  }
}

class Today extends StatelessWidget {
  const Today({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tile(
          texts: "Hospital 1",
          subtexts: "10 Slots",
          description: "Description",
        ),
        Tile(
          texts: "Hospital 2",
          subtexts: "20 Slots",
          description: "Description 2",
        ),
      ],
    );
  }
}
