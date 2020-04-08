import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keep_account/common/date.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

Future _showBottom({
  BuildContext context, Widget child,
  double height = 216,
}) async {
  return await showModalBottomSheet(context: context,
    backgroundColor: Colors.transparent,
    builder: (_) => Container(
      height: height,
      // margin: EdgeInsets.only(top: 16.0),
      child: child,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: const Radius.circular(12), topRight: const Radius.circular(12),),
        // border: Border.all(width: 6.0),
        color: Colors.white
      ),
    )
  );
}

// class MyPicker {
//   static showMonthPicker(BuildContext context, [double height = 216]) async {
//     _showBottom(
//       context: context, 
//       child: MyMonthPicker(
//         height: height,
//         onChange: (date) {
//           print('选中日期: ${MyDate.format('yyyy-MM-dd', date)}');
//         }
//       ),
//       height: height,
//     );
//   }
// }

// typedef DateChangedCallback(DateTime time);

// class MyMonthPicker extends StatefulWidget {
//   final double height;
//   final DateTime current;
//   final DateChangedCallback onChange;

//   MyMonthPicker({ current, this.height = 216, this.onChange, }): 
//     this.current = current != null ? MyDate.parse(current) : MyDate.getNow();

//   @override
//   _MyMonthPickerState createState() => _MyMonthPickerState();
// }

// class _MyMonthPickerState extends State<MyMonthPicker> {
//   final DateTime now = new DateTime.now();
//   int index0 = 0;
//   int index1 = 0;
//   FixedExtentScrollController yearScrollCtrl, monthScrollCtrl;

//   @override
//   void initState() {
//     super.initState();
//     refreshScrollOffset();
//   }
//   @override
//   void dispose() {
//     yearScrollCtrl.dispose();
//     monthScrollCtrl.dispose();
//     super.dispose();
//   }

//   void refreshScrollOffset() {
//     yearScrollCtrl = new FixedExtentScrollController(
//         initialItem: yearIndex);
//     monthScrollCtrl = new FixedExtentScrollController(
//         initialItem: monthIndex);
    
//     setState(() {
//       index0 = yearIndex;
//       index1 = monthIndex;
//     });
//   }
//   get yearIndex => widget.current.year - now.year;
//   get monthIndex => widget.current.month - 1;

//   changeYear(index) {
//     if (index == index0) return ;

//     setState(() {
//       index0 = index;
//     });
//   }
//   String stringIndexByYear(int index) {
//     if (index >= -100 && index <= 30) {
//       return (now.year + index).toString() + '年';
//     }
//     return null;
//   }

//   changeMonth(index) {
//     if (index == index1) return ;
    
//     setState(() {
//       index1 = index;
//     });
//   }
//   String stringIndexByMonth(int index) {
//     if (index >= 0 && index <= 11) {
//       return (index + 1).toString() + '月';
//     }
//     return null;
//   }

//   changeDate(int _) {
//     DateTime date = new DateTime(now.year + index0, index1 + 1);
//     widget.onChange(date);
//   }

//   Widget _renderColumnView(
//       {ValueKey key,
//       StringAtIndexCallBack stringAtIndexCB,
//       ScrollController scrollController,
//       ValueChanged<int> selectedChangedWhenScrolling,
//       ValueChanged<int> selectedChangedWhenScrollEnd}) {
//     return Expanded(
//       // flex: layoutProportion,
//       child: Container(
//           padding: EdgeInsets.all(8.0),
//           height: widget.height, // theme.containerHeight
//           decoration:
//               BoxDecoration(color: Colors.white),
//           child: NotificationListener(
//               onNotification: (ScrollNotification notification) {
//                 if (notification.depth == 0 &&
//                     selectedChangedWhenScrollEnd != null &&
//                     notification is ScrollEndNotification &&
//                     notification.metrics is FixedExtentMetrics) {
//                   final FixedExtentMetrics metrics = notification.metrics;
//                   final int currentItemIndex = metrics.itemIndex;
//                   selectedChangedWhenScrollEnd(currentItemIndex);
//                 }
//                 return false;
//               },
//               child: CupertinoPicker.builder(
//                   key: key,
//                   backgroundColor: Colors.white,
//                   scrollController: scrollController,
//                   itemExtent: 36.0,// theme.itemHeight,
//                   onSelectedItemChanged: (int index) {
//                     selectedChangedWhenScrolling(index);
//                   },
//                   useMagnifier: true,
//                   itemBuilder: (BuildContext context, int index) {
//                     final content = stringAtIndexCB(index);
//                     if (content == null) {
//                       return null;
//                     }
//                     return Container(
//                       height: 36.0,// theme.itemHeight,
//                       alignment: Alignment.center,
//                       child: Text(
//                         content,
//                         style: const TextStyle(color: Color(0xFF000046), fontSize: 18),// theme.itemStyle,
//                         textAlign: TextAlign.start,
//                       ),
//                     );
//                   }))),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: <Widget>[
//       _renderColumnView(
//         scrollController: yearScrollCtrl,
//         selectedChangedWhenScrollEnd: changeDate,
//         selectedChangedWhenScrolling: changeYear,
//         stringAtIndexCB: stringIndexByYear,
//       ),
//       if (true) _renderColumnView(
//         scrollController: monthScrollCtrl,
//         selectedChangedWhenScrollEnd: changeDate,
//         selectedChangedWhenScrolling: changeMonth,
//         stringAtIndexCB: stringIndexByMonth,
//       ),
//     ],);
//   }
// }
