import 'package:flutter/material.dart';
import 'package:freelance/widgets/components/gridview_selectable_number_card.dart';
import 'package:freelance_example/component_tester.dart';


void main() {
  runApp(const StatefulTester());
}

class StatefulTester extends StatefulWidget {
  const StatefulTester({super.key});

  @override
  State<StatefulTester> createState() => _StatefulTesterState();
}

class _StatefulTesterState extends State<StatefulTester> {
  List<NumberCardValue<String>> values = [
    NumberCardValue<String>(title: "test 1", quantity: 0, isSelected: false, value: "1", image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrspUTrNQOTnGv-QgTqGr14-mM3eoIJxJkJw&usqp=CAU")),
    NumberCardValue<String>(title: "test 2", quantity: 0, isSelected: false, value: "2"),
    NumberCardValue<String>(title: "test 3", quantity: 0, isSelected: false, value: "3"),
    NumberCardValue<String>(title: "test 4", quantity: 0, isSelected: false, value: "4"),
    NumberCardValue<String>(title: "test 5", quantity: 0, isSelected: false, value: "5"),
    NumberCardValue<String>(title: "test 6", quantity: 0, isSelected: false, value: "6"),
    NumberCardValue<String>(title: "test 7", quantity: 0, isSelected: false, value: "7"),
    NumberCardValue<String>(title: "test 8", quantity: 0, isSelected: false, value: "8"),
    NumberCardValue<String>(title: "test 9", quantity: 0, isSelected: false, value: "9"),
    NumberCardValue<String>(title: "test 10", quantity: 0, isSelected: false, value: "10"),
  ];
  
  @override
  Widget build(BuildContext context) {
    return WidgetTester(
        child: GridViewSelectableNumberCard(
          values: values,
          onChange: (index, quantity, isSelected) {
            setState(() {
              values[index].quantity = quantity;
              values[index].isSelected = isSelected;
            });
          }
        ),
    );
  }
}
