import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  final List<Map<String, String>> bookingHistory = [
    {
      'name': 'Nguyễn Văn A',
      'date': '25/03/2025',
      'work': 'Sửa máy lạnh',
      'status': 'Hoàn thành'
    },
    {
      'name': 'Trần Thị B',
      'date': '22/03/2025',
      'work': 'Bảo trì máy giặt',
      'status': 'Đã hủy'
    },
    {
      'name': 'Phạm Văn C',
      'date': '20/03/2025',
      'work': 'Lắp đặt máy lạnh',
      'status': 'Đang chờ'
    },
    {
      'name': 'Lê Thị D',
      'date': '18/03/2025',
      'work': 'Vệ sinh máy lạnh',
      'status': 'Hoàn thành'
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Hoàn thành':
        return Colors.green;
      case 'Đã hủy':
        return Colors.red;
      case 'Đang chờ':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử đặt lịch'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemCount: bookingHistory.length,
        itemBuilder: (context, index) {
          final booking = bookingHistory[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.history, color: Colors.blueAccent),
              title: Text(
                booking['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ngày đặt: ${booking['date']}'),
                  Text('Công việc: ${booking['work']}'),
                ],
              ),
              trailing: Text(
                booking['status']!,
                style: TextStyle(
                  color: getStatusColor(booking['status']!),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
