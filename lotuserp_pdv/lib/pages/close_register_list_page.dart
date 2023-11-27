import 'package:flutter/material.dart';

class CloseRegisterList extends StatelessWidget {
  const CloseRegisterList({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CloseRegisterList();
  }
}

class _CloseRegisterList extends StatelessWidget {
  const _CloseRegisterList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Item $index - Subitem $index'),
                ),
                // Add more ListTiles or other widgets as needed
              ],
            ),
          );
        },
      ),
    );
  }
}
