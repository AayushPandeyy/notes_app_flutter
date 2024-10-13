import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WrapExample extends StatelessWidget {
  const WrapExample({super.key});
  @override
  Widget build(BuildContext context) {
    // Sample data: List of containers with varying sizes
    List<Widget> boxes = List.generate(10, (index) {
      // Generate random heights for demonstration
      double height = 50.0 + (index % 3) * 30;
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.primaries[index % Colors.primaries.length],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text('$index')),
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Staggered GridView Example')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGrid.count(
          crossAxisCount: 4, // Number of columns
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: boxes.map((box) {
            return StaggeredGridTile.fit(
              crossAxisCellCount: 2, // Width in terms of column span
              child: box,
            );
          }).toList(),
        ),
      ),
    );
  }
}
