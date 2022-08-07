import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sicantik/utils.dart';
import 'package:sicantik/widgets/scrollbar.dart';
import 'package:visibility_detector/visibility_detector.dart';

GetStorage box = GetStorage();

BoxScrollView generate_list_view(
    {required ScrollController scrollController,
    required List<CardData> card_data_list}) {
  // divider for the card
  const card_divider = Divider(
    thickness: 5,
    indent: 5,
    endIndent: 5,
  );
  return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: card_data_list.length,
      itemBuilder: (BuildContext context, int index) {
        String headline = card_data_list[index].title;
        String description = card_data_list[index].description;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(0.0, 4.0),
              ),
            ],
          ),
          child: Center(
              child: VisibilityDetector(
            key: Key(index.toString()),
            onVisibilityChanged: (VisibilityInfo info) {
              // onVisibilityGained(headline);
              Set<dynamic> visibleHeadlines = {};
              if (box.hasData(visibleHeadlinesKey)) {
                visibleHeadlines = {
                  ...box.read(visibleHeadlinesKey)
                };
              }
              if (info.visibleFraction == 1.0) {
                visibleHeadlines.add(index);
              } else {
                visibleHeadlines.remove(index);
              }
              box.write(visibleHeadlinesKey, visibleHeadlines.toList());
            },
            child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    // the title
                    Row(children: <Widget>[
                      const Expanded(child: card_divider),
                      Text(headline, textScaleFactor: 1.5),
                      const Expanded(child: card_divider),
                    ]),
                    // the description
                    Text(description)
                  ],
                )),
          )),
        );
      });
}
