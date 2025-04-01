import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _workContentController = TextEditingController();
  final _addressController = TextEditingController();
  final _noteController = TextEditingController();
  DateTime? _selectedDate;

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitBooking() {
    // Xử lý logic đặt lịch (giả lập)
    String bookingInfo = '''
      Tên: ${_nameController.text}
      SĐT: ${_phoneController.text}
      Công việc: ${_workContentController.text}
      Ngày: ${_selectedDate != null ? DateFormat('dd/MM/yyyy').format(_selectedDate!) : 'Chưa chọn'}
      Địa chỉ: ${_addressController.text}
      Ghi chú: ${_noteController.text}
    ''';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thông tin đặt lịch'),
        content: Text(bookingInfo),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _workContentController.dispose();
    _addressController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt lịch'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Tên khách hàng', _nameController),
              const SizedBox(height: 15),
              _buildTextField('Số điện thoại', _phoneController, TextInputType.phone),
              const SizedBox(height: 15),
              _buildTextField('Nội dung công việc', _workContentController),
              const SizedBox(height: 15),
              _buildDatePicker(),
              const SizedBox(height: 15),
              _buildTextField('Địa chỉ', _addressController),
              const SizedBox(height: 15),
              _buildTextField('Ghi chú', _noteController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitBooking,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Center(
                  child: Text('Đặt lịch', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, [TextInputType inputType = TextInputType.text]) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                  : 'Chọn ngày',
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.calendar_today, color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
