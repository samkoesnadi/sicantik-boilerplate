import 'package:flexible_scrollbar/flexible_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

const String visibleHeadlinesKey = "visibleHeadlines";

Widget scrollbar_wrapper(
    {required Widget child,
    required ScrollController scrollController,
    bool isVertical = true,
    double thumbDragWidth = 30,
    double thumbWidth = 10,
    Duration animationDuration = const Duration(milliseconds: 300)}) {
  return FlexibleScrollbar(
      alwaysVisible: true,
      controller: scrollController,
      scrollThumbBuilder: (ScrollbarInfo info) {
        final bool isMoving = info.isDragging || info.isScrolling;
        final double width = isVertical
            ? isMoving
                ? thumbDragWidth
                : thumbWidth
            : info.thumbMainAxisSize;
        final double height = !isVertical
            ? isMoving
                ? thumbDragWidth
                : thumbWidth
            : info.thumbMainAxisSize;
        return AnimatedContainer(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(thumbWidth),
                color: Colors.grey.withOpacity(isMoving ? 0.6 : 0.3)),
            duration: animationDuration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Flexible(
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(Icons.keyboard_arrow_up,
                            color: Colors.white))),
                Flexible(
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(Icons.keyboard_arrow_down,
                            color: Colors.white)))
              ],
            ));
      },
      scrollLabelBuilder: (info) {
        final bool isMoving = info.isDragging || info.isScrolling;

        if (isMoving) {
          GetStorage box = GetStorage();
          List<dynamic> visibleHeadlines = [];
          if (box.hasData(visibleHeadlinesKey)) {
            visibleHeadlines = box.read(visibleHeadlinesKey);
          }
          String scrollBarLabel = visibleHeadlines.reversed.join('\n');

          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              scrollBarLabel,
              style: TextStyle(
                fontSize: thumbDragWidth,
                color: Colors.white,
              ),
            ),
          );
        }

        return SizedBox.shrink();
      },
      scrollLineCrossAxisSize: thumbDragWidth,
      barPosition: BarPosition.end,
      child: child);
}
