import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/buttons/switch_button/switch_button.dart';
import 'package:x_pr/core/theme/components/tiles/radio_tile.dart';
import 'package:x_pr/core/theme/components/tiles/tile.dart';
import 'package:x_pr/core/theme/components/tiles/tile_section.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class TilesSection extends StatefulWidget {
  const TilesSection({super.key});

  @override
  State<TilesSection> createState() => _TilesSectionState();
}

class _TilesSectionState extends State<TilesSection> {
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
          title: Text("Title"),
          trailing: Text("Title"),
        ),
        const Tile(
          title: Text("Title"),
        ),
        RadioTile(
          title: const Text("Title"),
          onPressed: setGroupValue,
          value: true,
          groupValue: radioGroupValue,
        ),
        RadioTile(
          title: const Text("Title"),
          onPressed: setGroupValue,
          value: false,
          groupValue: radioGroupValue,
        ),
        TileSection(
          title: "Title",
          children: [
            const Tile(
              leadingIcon: 'language',
              title: Text("Title"),
              trailing: Text("Title"),
            ),
            Tile(
              title: const Text("Title"),
              trailing: SwitchButton(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ].gap(height: 16),
    );
  }
}
