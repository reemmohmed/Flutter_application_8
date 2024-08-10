import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_http/providers/post_provider.dart';
import 'package:flutter_http/pages/post_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PostProvider>().fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          if (postProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (postProvider.error.isNotEmpty) {
            return Center(
              child: Text(postProvider.error),
            );
          } else if (postProvider.posts.isNotEmpty) {
            return ListView.builder(
              itemCount: postProvider.posts.length,
              itemBuilder: (context, index) {
                return Card(
                  surfaceTintColor: Colors.black12,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PostDetailsPage(
                                post: postProvider.posts[index]);
                          },
                        ),
                      );
                    },
                    title: Text(postProvider.posts[index].title ?? 'No Title'),
                    subtitle: Text(postProvider.posts[index].body ?? 'No BODY'),
                  ),
                );
              },
            );
          }
          return const Text('No Posts Available');
        },
      ),
    );
  }
}
