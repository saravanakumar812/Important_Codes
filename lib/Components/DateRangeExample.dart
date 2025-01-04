import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Utils/App_info.dart';
import '../Utils/theme.dart';




class DateRangeExample extends StatefulWidget {
  @override
  _DateRangeExampleState createState() => _DateRangeExampleState();

  final TextEditingController? controller;
  final RxString? selectedDate;
  final RxString? dateformat;
  final bool? isCurrentData;

  const DateRangeExample({
    @required this.controller,
    @required this.selectedDate,
    @required this.dateformat,
    this.isCurrentData = false,
  });
}

class _DateRangeExampleState extends State<DateRangeExample> {
  DateTimeRange? _selectedDateRange;
  bool thismonth = false;
  bool lastmonth = false;
  bool lastyear = false;

  DateTime selectedDay = DateTime.now();
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  bool _isDateEnabled(DateTime day) {
    // Enable only future dates or the current date
    return day.isAfter(_currentDate) || _isSameDay(day, _currentDate);
  }

  bool _isSameDay(DateTime day1, DateTime day2) {
    return day1.year == day2.year &&
        day1.month == day2.month &&
        day1.day == day2.day;
  }

  @override
  void initState() {
    super.initState();
  }

  Widget content(BuildContext context) {
    final darkTheme = Provider.of<AppInfo>(context).themeMode == ThemeMode.dark;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 115),
                  child: Text(
                    "Select Date",
                    style: GoogleFonts.poppins(
                        color: Colors.redAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.clear))
              ],
            ),
          ),
          SizedBox(height: 10),
          TableCalendar(
              firstDay: DateTime.utc(_currentDate.year - 1),
              lastDay: widget.isCurrentData!
                  ? DateTime.now()
                  : DateTime.utc(_currentDate.year + 2),
              calendarStyle: CalendarStyle(
                weekendTextStyle: GoogleFonts.poppins(
                    color: darkTheme ? Colors.white : Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500) ,
                defaultTextStyle: GoogleFonts.poppins(
                    color: darkTheme ? Colors.white : Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                selectedDecoration: BoxDecoration(
                  // color: AppTheme.red,
                  shape: BoxShape.rectangle,
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              rangeStartDay: DateTime.now(),
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              availableGestures: AvailableGestures.none,
              // Disable selecting previous dates
              onDaySelected: (DateTime selectedDate, DateTime focusedDate) {
                setState(() {
                  selectedDay = selectedDate;
                  widget.selectedDate?.value =
                      formatDate(selectedDate, [yyyy, '-', mm, '-', dd]);

                  widget.dateformat?.value =
                      formatDate(selectedDate, [dd, '.', M, '.', yyyy]);
                });
              },
              // locale: "en_US",
              rowHeight: 35,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: GoogleFonts.poppins(
                    color: darkTheme ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              focusedDay: selectedDay,
              daysOfWeekVisible: true,
              calendarBuilders:
                  CalendarBuilders(selectedBuilder: (context, date, _) {
                return Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      // color: AppTheme.red,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: Text(
                    '${date.day}',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                );
              })),
        ],
      ),
    );
  }
}
