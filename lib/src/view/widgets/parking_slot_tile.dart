import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ParkingSlotTile extends ConsumerWidget {
  // final String id;
  const ParkingSlotTile({super.key});
  // const ParkingSlotTile({required this.id, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Card(
        elevation: 1.5,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.carSide, size: 30, color: Colors.green),
                    SizedBox(width: 12),
                    Text(
                      "Vaga X",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text("Volkswagen Gol"),
                SizedBox(height: 4),
                Text("ABC - 1234"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
