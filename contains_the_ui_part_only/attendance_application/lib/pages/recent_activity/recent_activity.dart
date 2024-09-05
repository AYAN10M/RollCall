import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyRecentActivity extends StatefulWidget {
  const MyRecentActivity({super.key});

  @override
  _MyRecentActivityState createState() => _MyRecentActivityState();
}

class _MyRecentActivityState extends State<MyRecentActivity> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  List<Event> _selectedEvents = [];
  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  // Predefined attendance data for August 15, 2024, to September 4, 2024
  Map<DateTime, List<Event>> events = {
    DateTime.utc(2024, 8, 15): [
      Event('Check-in: 9:00 AM', 'Check-out: 5:00 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 8, 16): [
      Event('Check-in: 10:00 AM', 'Check-out: 6:30 PM', 'Total: 8h 30m')
    ],
    DateTime.utc(2024, 8, 17): [
      Event('Check-in: 9:30 AM', 'Check-out: 5:30 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 8, 18): [
      Event('Check-in: 10:00 AM', 'Check-out: 4:30 PM', 'Total: 6h 30m')
    ],
    DateTime.utc(2024, 8, 19): [
      Event('Check-in: 8:45 AM', 'Check-out: 5:15 PM', 'Total: 8h 30m')
    ],
    DateTime.utc(2024, 8, 20): [
      Event('Check-in: 9:15 AM', 'Check-out: 5:45 PM', 'Total: 8h 30m')
    ],
    DateTime.utc(2024, 8, 21): [
      Event('Check-in: 9:30 AM', 'Check-out: 5:30 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 8, 22): [
      Event('Check-in: 10:00 AM', 'Check-out: 6:00 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 8, 23): [
      Event('Check-in: 9:15 AM', 'Check-out: 5:15 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 8, 24): [
      Event('Check-in: 10:00 AM', 'Check-out: 4:30 PM', 'Total: 6h 30m')
    ],
    DateTime.utc(2024, 8, 25): [
      Event('Check-in: 9:00 AM', 'Check-out: 5:00 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 8, 26): [
      Event('Check-in: 10:00 AM', 'Check-out: 6:00 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 8, 27): [
      Event('Check-in: 9:45 AM', 'Check-out: 6:15 PM', 'Total: 8h 30m')
    ],
    DateTime.utc(2024, 8, 28): [
      Event('Check-in: 9:00 AM', 'Check-out: 5:00 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 8, 29): [
      Event('Check-in: 9:30 AM', 'Check-out: 5:30 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 8, 30): [
      Event('Check-in: 10:00 AM', 'Check-out: 6:00 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 8, 31): [
      Event('Check-in: 9:00 AM', 'Check-out: 5:00 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 9, 1): [
      Event('Check-in: 10:15 AM', 'Check-out: 6:15 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 9, 2): [
      Event('Check-in: 9:30 AM', 'Check-out: 5:30 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 9, 3): [
      Event('Check-in: 9:15 AM', 'Check-out: 5:15 PM', 'Total: 8h')
    ],
    DateTime.utc(2024, 9, 4): [
      Event('Check-in: 10:00 AM', 'Check-out: 6:00 PM', 'Total: 8h')
    ],
  };

  List<DateTime> holidays = [
    // Specify holidays here
  ];

  List<Event> _getEventsForDay(DateTime day) {
    return events[normalizeDate(day)] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _focusedDay = focusedDay;
        _selectedDay = selectedDay;
        _selectedEvents = _getEventsForDay(selectedDay);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TableCalendar(
                focusedDay: _focusedDay,

                firstDay: DateTime(2022, 1, 1),

                lastDay: DateTime(2030, 1, 1),

                calendarFormat: _calendarFormat,

                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },

                onDaySelected: _onDaySelected,

                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },

                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                  print(_focusedDay);
                },
                eventLoader: _getEventsForDay,

                // startingDayOfWeek: StartingDayOfWeek.monday,

                calendarStyle: CalendarStyle(
                  // Highlight Saturday and Sunday in light red
                  weekendTextStyle: TextStyle(color: Colors.red[400]),
                  // Draw a red line at the bottom of holidays
                  holidayTextStyle: TextStyle(color: Colors.red[400]),
                  holidayDecoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  // Add a black line only under dates with events
                  defaultDecoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: (events.keys.contains(DateTime(_focusedDay.year,
                                _focusedDay.month, _focusedDay.day)))
                            ? Colors.transparent
                            : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                holidayPredicate: (day) {
                  // Define weekends (Saturdays and Sundays) as holidays
                  return day.weekday == DateTime.saturday ||
                      day.weekday == DateTime.sunday ||
                      holidays.contains(day);
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Display attendance details for the selected day
          Builder(builder: (context) {
            return (_selectedEvents.isNotEmpty)
                ? Center(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListView(
                          children: _selectedEvents
                              .map((Event event) => ListTile(
                                    title: Text(event.checkIn),
                                    subtitle: Text(event.checkOut),
                                    trailing: Text(event.totalHours),
                                  ))
                              .toList(),
                        )),
                  )
                : Center(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'No attendance data for this day.',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  );
          }),
        ],
      ),
    );
  }
}

class Event {
  final String checkIn;
  final String checkOut;
  final String totalHours;

  Event(this.checkIn, this.checkOut, this.totalHours);
}
