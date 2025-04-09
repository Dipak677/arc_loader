import 'package:arc_loader/arc_loader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arc Loader Example',
      home: ArcLoaderExample(),
    ),
  );
}

class ArcLoaderExample extends StatelessWidget {
  const ArcLoaderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Loader Style'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Simple Arc'),
              Tab(text: 'Complete Arc'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ArcLoaderGrid(style: ArcStyle.simpleArc),
            ArcLoaderGrid(style: ArcStyle.completeArc),
          ],
        ),
      ),
    );
  }
}

class ArcLoaderGrid extends StatelessWidget {
  final ArcStyle style;

  const ArcLoaderGrid({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1,
      children: [
        _buildLoaderCard(
          'WITH DEFAULT\nCONFIGURATION',
          ArcLoader(
            arcWidth: 3,
            arcColors: [Colors.green, Colors.yellow],
            style: style,
            speed: ArcSpeed.fast,
          ),
        ),
        _buildLoaderCard(
          'WITH CUSTOM\nCOLOR',
          ArcLoader(
            arcColors: [Colors.red, Colors.green, Colors.yellow, Colors.purple],
            arcWidth: 6.0,
            arcMargin: 10.0,
            innerGap: 4.0,
            style: style,
            speed: ArcSpeed.fast,
          ),
        ),
      ],
    );
  }

  Widget _buildLoaderCard(String title, Widget loader) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 70, height: 70, child: loader),
        const SizedBox(height: 10),
        Text(title, textAlign: TextAlign.center),
      ],
    );
  }
}
