import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/webtoon_model.dart';
import '../services/api_service.dart';

class HomeScreens extends StatelessWidget {
  HomeScreens({super.key});

  Future<List<WebToonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          "Today's 툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Text("There is Data");
          }else{
            return Text("Loading...");
          }
        },
      ),
    );
  }
}

//TODO  이건 staeful 방법

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../models/webtoon_model.dart';
// import '../services/api_service.dart';
//
// class HomeScreens extends StatefulWidget {
//   const HomeScreens({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreens> createState() => _HomeScreensState();
// }
//
// class _HomeScreensState extends State<HomeScreens> {
//   List<WebToonModel> webtoons = [];
//   bool isLoading = true;
//
//   void waitForWebToons() async {
//     webtoons = await ApiService.getTodaysToons();
//     isLoading = false;
//     setState(() {
//       //새로고침하기 위해 호출
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     waitForWebToons();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print(webtoons);
//     print(isLoading);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 2,
//         foregroundColor: Colors.green,
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Today's 툰",
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }