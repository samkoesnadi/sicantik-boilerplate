import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sicantik/utils.dart';
import 'package:sicantik/widgets/list_view.dart';
import 'package:sicantik/widgets/scrollbar.dart';
import 'package:spring/spring.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // TODO: you can replace the sample list
    List<CardData> sample_card_data_list = [
      CardData(
          title: '01',
          description:
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdf'),
      CardData(title: '02', description: 'asdf'),
      CardData(title: '03', description: 'asdf'),
      CardData(title: '04', description: 'asdf'),
      CardData(title: '05', description: 'asdf'),
      CardData(title: '0', description: 'asdf'),
      CardData(title: '0', description: 'asdf'),
      CardData(title: '0', description: 'asdf'),
      CardData(title: '0', description: 'asdf'),
      CardData(title: '0', description: 'asdf'),
      CardData(title: '0', description: 'asdf'),
      CardData(title: '0', description: 'asdf'),
      CardData(title: '0', description: 'asdf')
    ];
    return Scaffold(
        body: scrollbar_wrapper(
            child: generate_list_view(
                scrollController: scrollController,
                card_data_list: sample_card_data_list),
            scrollController: scrollController,
            card_data_list: sample_card_data_list),
        appBar: AppBar(
          title: Text("title".tr),
          actions: [
            InkWell(
                onTap: () {}, child: const Icon(Icons.account_circle_rounded)),
            const SizedBox.square(dimension: 10)
          ],
        ),
        floatingActionButton: Spring.bubbleButton(
          onTap: () {},
          child: const CircleAvatar(
              maxRadius: 30,
              child: Icon(
                Icons.add,
                size: 30,
              )),
          animDuration: const Duration(seconds: 1),
          //def=500m mil
          bubbleStart: 0.3,
          //def=0.0
          bubbleEnd: 1.1, //def=1.1
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
