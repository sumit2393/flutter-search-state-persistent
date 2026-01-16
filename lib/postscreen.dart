import 'package:dummy/provider/search_provider.dart';
import 'package:dummy/search_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Postscreen extends StatelessWidget {
  const Postscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search by title',
            ),
            onChanged: (text) {
              provider.search(text);
            },
          ),

          const SizedBox(height: 10),
          provider.isLoading
              ? CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                    itemCount: provider.searchedpostsresult.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text(
                          provider.searchedpostsresult[index].title ?? '',
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SearchDetailScreen(),
                            ),
                          );
                        },
                        subtitle: Text(
                          provider.searchedpostsresult[index].body ?? '',
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
