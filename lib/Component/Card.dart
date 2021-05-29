import 'package:flutter/material.dart';
import '../index.dart';

class Cards extends StatelessWidget {
  Cards(
      {@required this.name,
      @required this.disc,
      @required this.profile,
      @required this.rate,
      @required this.onDetail,
      this.btn,
      this.id,
      this.color,
      this.isrequest});

  final name;
  final disc;
  final profile;
  final rate;
  final onDetail;
  Widget btn;

  final id;
  final isrequest;
  final color;
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final padding = EdgeInsets.all(10);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Column(
          children: [
            Container(
              padding: padding,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: colors.k_white,
                  child: Hero(
                    tag: "profile-${id}",
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profile),
                    ),
                  ),
                ),
                title: Text(
                  name,
                  style: header2(),
                ),
                subtitle: Text(disc),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //todo detail
                Container(
                    child: GestureDetector(
                  onTap: () {
                    onDetail();
                  },
                  child: Text(
                    "detail",
                    style: body2(color: colors.k_seconderypurpleColor),
                  ),
                )),
                //todo button
                Container(child: btn)
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Text(
                  rate,
                  style: TextStyle(color: colors.k_seconderypurpleColor),
                  // style: body2(color: colors.k_seconderypurpleColor),
                ),
                Icon(
                  Icons.star,
                  size: 12,
                  color: colors.k_seconderypurpleColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3),
            ),
          ],
        ),
      ),
    );
  }
}
