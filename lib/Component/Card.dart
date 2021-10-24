import 'package:flutter/material.dart';
import '../index.dart';

class Cards extends StatefulWidget {
  final Doctor data;
  final onDetail;
  final btn;
  final color;
  Cards({this.data, @required this.onDetail, this.btn, this.color});

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final padding = EdgeInsets.all(10);
    double sum = 0;
    double rate = 0;
    widget.data?.rate?.forEach((element) {
      setState(() {
        sum += element;
        rate = (sum) / (widget.data?.rate?.length + 5);
      });
    });
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Column(
          children: [
            Container(
              padding: padding,
              child: ListTile(
                leading: Hero(
                  tag: "profile-${widget.data.dId}",
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.data.img),
                  ),
                ),
                title: Text(
                  widget.data.nameTitle + "  " + widget.data.fullName,
                  style: header2(),
                ),
                subtitle: Text(widget.data.detail),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //todo detail
                Container(
                    child: GestureDetector(
                  onTap: () {
                    widget.onDetail();
                  },
                  child: Text(
                    "detail",
                    style: body2(color: colors.k_seconderypurpleColor),
                  ),
                )),
                //todo button
                Container(child: widget.btn)
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Text(
                  "${double.parse((rate).toStringAsFixed(1))}",
                  style: TextStyle(color: colors.k_seconderypurpleColor),
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
