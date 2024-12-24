import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/model/response/profile_appointment_model.dart';
import 'package:mytal/data/model/response/profile_prescription_model.dart';
import 'package:mytal/providers/prefs_provider.dart';
import 'package:mytal/util/app_constants.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/add_appointment_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends ConsumerStatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  CalendarViewState createState() => CalendarViewState();
}

class CalendarViewState extends ConsumerState<CalendarView> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  // RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        // _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      // _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

// TODO: Not efficient to have all these in build method
  @override
  Widget build(BuildContext context) {
    final aDate = DateTime(_focusedDay.year, _focusedDay.month, _focusedDay.day);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    String dateText = DateFormat('E d MMM').format(_focusedDay);
    if (aDate == today) {
      dateText = 'Today, $dateText';
    } else if (aDate == yesterday) {
      dateText = 'Yesterday, $dateText';
    } else if (aDate == tomorrow) {
      dateText = 'Tomorrow, $dateText';
    }

    var prefs = ref.watch(prefsProvider);
    kEvents.clear();

    List<ProfilePrescriptionModel> profilePrescriptions = prefs[AppConstants.profilePrescriptions];
    List<ProfileAppointmentModel> profileAppointments = prefs[AppConstants.profileAppointments];

    void updatePrescriptionEntry(Event event) {
      ProfilePrescriptionModel currentPrescription = profilePrescriptions.firstWhere((prescription) => prescription.id == event.prescriptionId);

      List<PrescriptionEntry> updatedEntries = currentPrescription.prescriptionEntries.map((entry) {
        return entry.id == event.id ? entry.copyWith(taken: event.isDone) : entry;
      }).toList();

      currentPrescription = currentPrescription.copyWith(prescriptionEntries: updatedEntries);
      profilePrescriptions = profilePrescriptions.map((prescription) {
        if (prescription.id == currentPrescription.id) {
          return currentPrescription;
        }
        return prescription;
      }).toList();
      ref.read(prefsProvider.notifier).setList(AppConstants.profilePrescriptions, profilePrescriptions);
    }

    void updateAppointmentEntry(Event event) {
      ProfileAppointmentModel currentAppointment = profileAppointments.firstWhere((appointment) => appointment.id == event.id);
      showDialog(
        context: context,
        builder: (context) => AddAppointmentDialog(
          appointment: currentAppointment,
        ),
      );
    }

    Map<DateTime, List<Event>> vEventSource = {};

    for (var appointment in profileAppointments) {
      DateTime appointmentDate = DateTime.parse(appointment.date).copyWith(hour: 8, minute: 0, second: 0).toUtc();
      debugPrint('appointmentDate: $appointmentDate');
      if (vEventSource[appointmentDate] != null) {
        vEventSource[appointmentDate]!.add(
          Event(
            id: appointment.id,
            prescriptionId: 0,
            title: appointment.name,
            isDone: false,
            time: appointment.date.substring(11, 16),
            type: 'appointment',
            location: appointment.location,
          ),
        );
      } else {
        vEventSource[appointmentDate] = [
          Event(
            id: appointment.id,
            prescriptionId: 0,
            title: appointment.name,
            isDone: false,
            time: appointment.date.substring(11, 16),
            type: 'appointment',
            location: appointment.location,
          ),
        ];
      }
    }

    for (var prescription in profilePrescriptions) {
      for (var entry in prescription.prescriptionEntries) {
        DateTime entryDate = DateTime.parse(entry.date).copyWith(hour: 8, minute: 0, second: 0).toUtc();

        if (vEventSource[entryDate] != null) {
          vEventSource[entryDate]!.add(
            Event(
              id: entry.id,
              prescriptionId: entry.prescriptionId,
              title: 'Take ${prescription.name}',
              isDone: entry.taken,
              time: entry.date.substring(11, 16),
              type: 'prescription',
            ),
          );
        } else {
          vEventSource[entryDate] = [
            Event(
              id: entry.id,
              prescriptionId: entry.prescriptionId,
              title: 'Take ${prescription.name}',
              isDone: entry.taken,
              time: entry.date.substring(11, 16),
              type: 'prescription',
            ),
          ];
        }
      }
    }

    vEventSource.forEach((key, value) {
      value.sort((a, b) => a.time!.compareTo(b.time!));
    });

    kEvents.addAll(vEventSource);
    debugPrint('kEvents: $kEvents');
    _selectedEvents.value = _getEventsForDay(_selectedDay!);

    return Column(
      children: [
        TableCalendar<Event>(
          calendarBuilders: CalendarBuilders(
            markerBuilder: (BuildContext context, date, events) {
              if (events.isEmpty) return const SizedBox();
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    Color color = events[index].type == 'prescription' ? Colors.red[800]! : Colors.green[800]!;
                    return Container(
                      margin: const EdgeInsets.only(top: 35),
                      padding: const EdgeInsets.all(0.5),
                      child: Container(
                        height: 9,
                        width: 9,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                      ),
                    );
                  });
            },
          ),
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          calendarFormat: _calendarFormat,
          // rangeSelectionMode: _rangeSelectionMode,
          eventLoader: _getEventsForDay,
          startingDayOfWeek: StartingDayOfWeek.monday,

          calendarStyle: CalendarStyle(
            selectedDecoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.red.withOpacity(0.5),
              //  shape: BoxShape.circle,
              border: Border.all(color: Colors.red),
            ),
            markerDecoration: BoxDecoration(
              color: Colors.red[800],
              shape: BoxShape.circle,
            ),
          ),
          // calendarStyle: CalendarStyle(
          //   // Use `CalendarStyle` to customize the UI
          //   outsideDaysVisible: false,
          // ),
          onDaySelected: _onDaySelected,
          onRangeSelected: _onRangeSelected,
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeSmall),
        Container(
          color: Colors.red[50],
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault,
            vertical: Dimensions.paddingSizeSmall,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              isSameDay(DateTime.now(), _selectedDay)
                  ? const SizedBox()
                  : TextButton(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text('Move to Today'),
                      onPressed: () {
                        _onDaySelected(DateTime.now(), DateTime.now());
                      },
                    )
            ],
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  Color color = value[index].type == 'prescription' ? Colors.red : Colors.green;
                  return Container(
                    constraints: const BoxConstraints(minHeight: 60),
                    margin: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault,
                      vertical: Dimensions.paddingSizeExtraSmall,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: color, width: 2),
                      borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                      color: value[index].isDone ? Colors.red[50] : null,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault,
                      vertical: Dimensions.paddingSizeExtraSmall,
                    ),
                    // child: ListTile(
                    //   onTap: () => print('${value[index]}'),
                    //   title: Text('${value[index]}'),
                    // ),
                    child: InkWell(
                      onTap: () => setState(() {
                        value[index].isDone = !value[index].isDone;
                        if (value[index].type == 'prescription') {
                          updatePrescriptionEntry(value[index]);
                        } else if (value[index].type == 'appointment') {
                          updateAppointmentEntry(value[index]);
                        }
                      }),
                      child: value[index].type == 'appointment'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.event),
                                    const SizedBox(width: Dimensions.paddingSizeSmall),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value[index].title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        value[index].location != null && value[index].location!.isNotEmpty
                                            ? Row(
                                                children: [
                                                  Icon(Icons.location_on, size: 12, color: Colors.grey[700]),
                                                  const SizedBox(width: 2),
                                                  Text(
                                                    value[index].location!,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: Dimensions.fontSizeSmall,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(value[index].time!),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.check),
                                    const SizedBox(width: Dimensions.paddingSizeSmall),
                                    Text(value[index].title, style: TextStyle(decoration: value[index].isDone ? TextDecoration.lineThrough : null)),
                                  ],
                                ),
                                Text(value[index].time!),
                                Checkbox(
                                  value: value[index].isDone,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  onChanged: (bool? val) {
                                    setState(() {
                                      value[index].isDone = val!;
                                      updatePrescriptionEntry(value[index]);
                                    });
                                  },
                                ),
                              ],
                            ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class Event {
  int id;
  int prescriptionId;
  String title;
  String type;
  String? time;
  String? location;
  bool isDone;

  Event({
    required this.id,
    required this.prescriptionId,
    required this.title,
    required this.type,
    this.isDone = false,
    this.time,
    this.location,
  });
}

// List<String> time = [
//   '09:00',
//   '13:00',
//   '17:00',
//   '21:00',
// ];

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
);
// );..addAll(_kEventSource);

// List<String> prescriptions = [
//   "Deferiprone",
//   "Deferasirox",
//   "Desferrioxamine",
// ];

// final _kEventSource = {
//   for (var item in List.generate(50, (index) => index))
//     DateTime.utc(kFirstDay.year, kFirstDay.month, item * 3): List.generate(
//       item % 3 + 1,
//       (index) => Event(
//         title: 'Take ${prescriptions[index]}',
//         isDone: DateTime.utc(kFirstDay.year, kFirstDay.month, item * 3).isBefore(DateTime.now()),
//         time: time[index],
//       ),
//     )
// }..addAll({
//     kToday: [
//       Event(title: 'Take Deferiprone', time: '09:00', isDone: true),
//       Event(title: 'Take Deferasirox', time: '13:00'),
//     ],
//   });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
