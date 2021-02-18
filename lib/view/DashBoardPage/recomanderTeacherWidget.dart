import 'package:edustudio/util/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RecomandedTeacherWidget extends StatefulWidget {
  var recomendedTeacherController;
  RecomandedTeacherWidget({this.recomendedTeacherController});

  @override
  _RecomandedTeacherWidgetState createState() => _RecomandedTeacherWidgetState();
}

class _RecomandedTeacherWidgetState extends State<RecomandedTeacherWidget> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var controllerList =
        widget.recomendedTeacherController.recomandedTeacherList;

    return Obx(() => StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: controllerList.length,
          itemBuilder: (BuildContext context, int index) => Card(
            child: Column(
              children: <Widget>[
                Image.network(controllerList[index].photo.path),
                Text(
                  controllerList[index].name,
                  overflow: TextOverflow.ellipsis,
                  style:
                      customizeTextStyle(FontWeight.w500, 0.04.sw, blueColor),
                ),
                Text(
                  'Biology Teacher',
                  overflow: TextOverflow.ellipsis,
                  style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                ),
                Text(
                  controllerList[index].rating.toString(),
                  style: customizeTextStyle(FontWeight.w700, 0.05.sw, black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 0.05.sw,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    FaIcon(
                      FontAwesomeIcons.heart,
                      color: darkRedColor,
                    )
                  ],
                )
              ],
            ),
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }
}
