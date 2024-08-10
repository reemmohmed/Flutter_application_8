import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_http/pages/home_page.dart';
import 'package:flutter_http/providers/post_provider.dart';
import 'package:flutter_http/providers/comment_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostProvider()),
        ChangeNotifierProvider(create: (context) => CommentProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_http/bloc/comment/comment_bloc.dart';
// import 'package:flutter_http/bloc/post/posts_bloc.dart';
// import 'package:flutter_http/pages/home_page.dart';

// void main() {
//   runApp(MultiBlocProvider(
//     providers: [
//       BlocProvider(
//         create: (context) => PostsBloc(),
//       ),
//       BlocProvider(
//         create: (context) => CommentsBloc(),
//       ),
//     ],
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
