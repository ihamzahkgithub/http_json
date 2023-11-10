import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package

class JsonFetchDemo extends StatefulWidget {
  @override
  _JsonFetchDemoState createState() => _JsonFetchDemoState();
}

class _JsonFetchDemoState extends State<JsonFetchDemo> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  List<dynamic> jsonData = [];
  final http.Client httpClient =
      http.Client(); // Create an instance of http.Client

  Future<void> fetchJsonData() async {
    try {
      final response = await httpClient.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
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
  void dispose() {
    httpClient.close(); // Close the HTTP client when the widget is disposed
    super.dispose();
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
            ? const CircularProgressIndicator()
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
