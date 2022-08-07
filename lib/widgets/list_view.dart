import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:sicantik/utils.dart';

Widget generate_list_view(
    {required ScrollController scrollController,
    required List<CardData> card_data_list,
    required void Function(String) onVisibilityGained,
    required void Function(String) onVisibilityLost}) {
  // divider for the card
  const card_divider = Divider(
    thickness: 5,
    indent: 5,
    endIndent: 5,
  );
  return ListView.builder(
      controller: scrollController,
      shrinkWrap: true,
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
              child: FocusDetector(
            onVisibilityGained: () {
              onVisibilityGained(headline);
            },
            onVisibilityLost: () {
              onVisibilityLost(headline);
            },
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
            ),
          )),
        );
      });
}
