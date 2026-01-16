import 'package:flutter/material.dart';

class SearchDetailScreen extends StatelessWidget {
  const SearchDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Detail')),
      body: Center(child: Text('Go back — state is preserved')),
    );
  }
}
