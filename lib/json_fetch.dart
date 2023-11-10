import 'dart:convert';
import 'package:flutter/material.dart';

class JsonFetchDemo extends StatefulWidget {
  @override
  _JsonFetchDemoState createState() => _JsonFetchDemoState();
}

class _JsonFetchDemoState extends State<JsonFetchDemo> {
  // URL of the JSON API you want to fetch data from
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  // Variable to store the fetched JSON data
  List<dynamic> jsonData = [];

  get http => null;

  // Function to fetch JSON data from the API
  Future<void> fetchJsonData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        setState(() {
          jsonData = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load JSON data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON API Fetch Example'),
        centerTitle: true,
      ),
      body: Center(
        child: jsonData.isEmpty
            ? const CircularProgressIndicator() // Show loading indicator while fetching data
            : ListView.builder(
                itemCount: jsonData.length,
                itemBuilder: (context, index) {
                  final item = jsonData[index];
                  return Card(
                    child: ListTile(
                      //leading: Text(item['id']),
                      title: Text(item['title']),
                      subtitle: Text(item['body']),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
