import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

import '../modles/post.dart';

class PostListPage extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];

  PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
         body: const SafeArea(
        //   child: ListView.builder(
        //       itemCount: entries.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return Center(child: Text(entries[index]));
        //       }),

        child: PostViewWidget(),
         ));
  }
}

class PostViewWidget extends StatefulWidget {
  const PostViewWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PostViewWidgetState();
  }
}

class _PostViewWidgetState extends State<PostViewWidget> {
  // ignore: non_constant_identifier_names
  late Future<Post> Futurepost;
  @override
  void initState() {
    super.initState();
    Futurepost = fetchPosts();
  }

  Future<Post> fetchPosts() async {
    // later we will use this http request(asyncronus)
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post one');
    }
  }

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Center(
      
       child: FutureBuilder<Post>(
  future: Futurepost,
  builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
  },
),
     ),
   );
  }
}
