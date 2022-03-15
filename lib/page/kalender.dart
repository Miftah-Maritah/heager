import 'package:flutter/material.dart';
import 'package:heager/page/event.dart';
import 'package:table_calendar/table_calendar.dart';

class Kalender extends StatefulWidget {
  const Kalender({Key? key}) : super(key: key);

  @override
  _KalenderState createState() => _KalenderState();
}

class _KalenderState extends State<Kalender> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calander"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2500),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            calendarStyle: const CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
            headerStyle: HeaderStyle(
                formatButtonVisible: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(4.0)),
                formatButtonTextStyle: TextStyle(color: Colors.white)),
          ),
          
        ],
        
      ),
    );
  }
}

