import 'package:flutter/material.dart';
import 'package:nimmsta_demo/home_page.dart';
import 'package:nimmsta_lib/nimmsta_lib.dart';

void main() {
  // Initialize NimmstaLib configurations here. If not initiazlied, NimmstaLib will fall
  // back to default configurations.
  NimmstaLib.initialize(
      config: NimmstaConfig(
    timeout: Duration(seconds: 20),
  ));

  runApp(const NimmstaDemo());
}

class NimmstaDemo extends StatelessWidget {
  const NimmstaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nimmsta Demo',
      home: HomePage(),
    );
  }
}
