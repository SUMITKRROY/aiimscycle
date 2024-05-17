import 'package:flutter/material.dart';

class DateFilterPage extends StatefulWidget {
  @override
  _DateFilterPageState createState() => _DateFilterPageState();
}

class _DateFilterPageState extends State<DateFilterPage> {
  List<String> dates = [
    '03-04-2024',
    '15-04-2024',
    '30-04-2024',
    '01-05-2024',
    '04-05-2024',
    '05-05-2024',
  ];

  int selectedDaysAgo = 15;
  List<String> filteredDates = [];

  void filterDates() {
    setState(() {
      filteredDates = getDatesWithinRange(dates, selectedDaysAgo);
    });
  }

  List<String> getDatesWithinRange(List<String> datesList, int daysAgo) {
    List<String> result = [];
    DateTime today = DateTime.now();
    DateTime fifteenDaysAgo = today.subtract(Duration(days: daysAgo));

    for (String dateStr in datesList) {
      List<int> dateParts = dateStr.split('-').map(int.parse).toList();
      DateTime date = DateTime(dateParts[2], dateParts[1], dateParts[0]);

      if (date.isAfter(fifteenDaysAgo) && date.isBefore(today)) {
        result.add(dateStr);
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Filter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<int>(
              value: selectedDaysAgo,
              onChanged: (value) {
                setState(() {
                  selectedDaysAgo = value!;
                });
              },
              items: List.generate(
                30,
                (index) => DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text('${index + 1} days ago'),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: filterDates,
              child: Text('Filter Dates'),
            ),
            SizedBox(height: 16.0),
            Text('Filtered Dates:', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: filteredDates.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredDates[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
