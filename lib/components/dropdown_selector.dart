import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../palette.dart';

Widget DropDownSelector(context, List<String> selectList, String defItem, icon, Function(String, int, BuildContext) onSelected){
  Size size = MediaQuery.of(context).size;
  int getIndex(List<String> list, String defValue){
    int index = 0;
    index = list.indexOf(defValue);
    if(index > -1)
      return index;
    else
      return 0;
  }
  return Column(
    mainAxisSize: MainAxisSize.min,
    verticalDirection: VerticalDirection.down,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kPrime.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
                      child: FaIcon(icon, size: 28, color: kPrime,),
                    ),
                    Expanded(
                        child: Padding(
                            child: DirectSelectList<String>(
                                values: selectList,
                                defaultItemIndex: defItem != "" ? getIndex(selectList, defItem)
                                                  : 2,
                                itemBuilder: (String value) => getDropDownMenuItem(value, context),
                                focusedItemDecoration: _getDslDecoration(),
                                onItemSelectedListener: onSelected
                            ),
                            padding: EdgeInsets.only(left: 12))),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.unfold_more,
                        color: kPrime,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
DirectSelectItem<String> getDropDownMenuItem(String value, context) {
  Size size = MediaQuery.of(context).size;
  return DirectSelectItem<String>(
      itemHeight: size.height * 0.08,
      scaleFactor: 4,
      value: value,
      itemBuilder: (context, value) {
        return Text(value, style: TextStyle(color: kPrime, fontSize: 20),);
      });
}
_getDslDecoration() {
  return BoxDecoration(
    border: BorderDirectional(
      bottom: BorderSide(width: 1, color: kPrime),
      top: BorderSide(width: 1, color: kPrime),
    ),
  );
}