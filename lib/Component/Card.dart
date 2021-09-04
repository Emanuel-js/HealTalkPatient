import 'package:flutter/material.dart';
import '../index.dart';

class Cards extends StatelessWidget {
  final Doctor data;
  final onDetail;
  final btn;
  final color;
  Cards({this.data, @required this.onDetail, this.btn, this.color});

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
                leading: Hero(
                  tag: "profile-${data.dId}",
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data.img),
                  ),
                ),
                title: Text(
                  data.nameTitle + "  " + data.fullName,
                  style: header2(),
                ),
                subtitle: Text(data.detail),
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
                  "${data.rate}",
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
