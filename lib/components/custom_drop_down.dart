import 'package:flutter/material.dart';
import 'package:fut_app/templates/ui/app_const.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key, required this.onChange});

  final Function(String? value) onChange;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue = 'Relevance';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppConst.grey100, width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: DropdownButton<String>(
            value: _selectedValue,
            style: const TextStyle(fontSize: 14),
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
              widget.onChange(value);
            },
            items: const [
              DropdownMenuItem<String>(
                value: 'Relevance',
                child: Text('Relevance'),
              ),
              DropdownMenuItem<String>(
                value: 'Preparation Time',
                child: Text('Preparation Time'),
              ),
              DropdownMenuItem<String>(
                value: 'Likes',
                child: Text('Likes'),
              ),
            ],
            underline: Container()),
      ),
    );
  }
}
