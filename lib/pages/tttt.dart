// import 'package:flutter/material.dart';
// import 'package:newsapp/Utility/screen_size.dart';
// import 'package:newsapp/widgets/newscard.dart';

// class NewsPage extends StatefulWidget {
//   const NewsPage({super.key});

//   @override
//   _NewsPageState createState() => _NewsPageState();
// }

// class _NewsPageState extends State<NewsPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("USA Today"),
//         bottom: TabBar(
//           controller: _tabController,
//           isScrollable: true,
//           labelColor: Colors.blue,
//           unselectedLabelColor: Colors.grey,
//           indicatorColor: Colors.blue,
//           tabs: [
//             Tab(text: "Trending"),
//             Tab(text: "My Topic"),
//             Tab(text: "Local News"),
//             Tab(text: "Fact Check"),
//             Tab(text: "Good News"),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           SizedBox(
//                 height: 200,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const [
//                     NewsCard(
//                       imagePath: 'asset/images/news1.jpg',
//                       title: 'Breaking news is waiting for you to watch',
//                       description:
//                           'jwhqbhiuqheug32uieiuqiehyigege\njhwqheuiguiegwqhskwhqjsgy',
//                     ),
//                     SizedBox(
//                       width: 2,
//                     ),
//                     NewsCard(
//                       imagePath: 'asset/images/news2.jpg',
//                       title: 'Breaking news is waiting for you to watch',
//                       description:
//                           'jwhqbhiuqheug32uieiuqiehyigege\njhwqheuiguiegwqhskwhqjsgy',
//                     ),
//                     SizedBox(
//                       width: 2,
//                     ),
//                     NewsCard(
//                       imagePath: 'asset/images/news3.jpg',
//                       title: 'Breaking news is waiting for you to watch',
//                       description:
//                           'jwhqbhiuqheug32uieiuqiehyigege\njhwqheuiguiegwqhskwhqjsgy',
//                     ),
//                   ],
//                 ),
//               ),
//           Center(child: Text("My Topic")),
//           Center(child: Text("Local News")),
//           Center(child: Text("Fact Check")),
//           Center(child: Text("Good News")),
//         ],
//       ),
//     );
//   }
// }