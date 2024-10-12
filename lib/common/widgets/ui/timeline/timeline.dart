import 'package:flutter/material.dart';

class TimelineItem extends StatelessWidget {
  final TimelineEvent event;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.event,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Circle and Line
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 50,
                color: Colors.blue,
              ),
          ],
        ),
        SizedBox(width: 16),
        // Event details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                event.date,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class TimelineEvent {
  final String title;
  final String date;

  TimelineEvent(this.title, this.date);
}
