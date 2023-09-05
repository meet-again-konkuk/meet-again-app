import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_again_frontend/widgets/webtoon_widget.dart';

import '../models/webtoon_model.dart';
import '../services/api_service.dart';

class HomeScreens extends StatelessWidget {
  HomeScreens({super.key});

  final Future<List<WebToonModel>> webtoons = ApiService.getTodaysToons();

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
        builder: (context, futureData) {
          if (futureData.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(futureData)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebToonModel>> futureData) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: futureData.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (BuildContext context, int index) {
        print(index);
        var webtoon = futureData.data![index];
        return WebToon(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 40,
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
