import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/tiles/radio_tile.dart';
import 'package:x_pr/core/theme/components/tiles/tile.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class TileSection extends StatefulWidget {
  const TileSection({super.key});

  @override
  State<TileSection> createState() => _TileSectionState();
}

class _TileSectionState extends State<TileSection> {
  bool radioGroupValue = true;
  void setGroupValue(bool value) {
    setState(() {
      radioGroupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Tile(
          title: Text("타이틀"),
          trailing: Text("타이틀"),
        ),
        const Tile(
          title: Text("타이틀"),
        ),
        RadioTile(
          title: const Text("타이틀"),
          onPressed: setGroupValue,
          value: true,
          groupValue: radioGroupValue,
        ),
        RadioTile(
          title: const Text("타이틀"),
          onPressed: setGroupValue,
          value: false,
          groupValue: radioGroupValue,
        ),
      ].gap(height: 16),
    );
  }
}
