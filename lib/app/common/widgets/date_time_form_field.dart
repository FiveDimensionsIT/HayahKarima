import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/shadow_view.dart';
import 'package:hayah_karema/utils/NumberHelper.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class DateTimeFormField extends StatefulWidget {
  final String hintText;
  final bool isDateTimePickerMode;
  final Function selectedDate;
  final DateTime initialDateTime, maximumDate;

  const DateTimeFormField({
    Key? key,
    required this.hintText,
    this.isDateTimePickerMode = true,
    required this.selectedDate,
    required this.initialDateTime,
    required this.maximumDate,
  }) : super(key: key);

  @override
  State<DateTimeFormField> createState() => _DateTimeFormFieldState();
}

class _DateTimeFormFieldState extends State<DateTimeFormField> {
  final _dateTextEditingController = TextEditingController();
  final _dateFocusNode = FocusNode();
  final now = DateTime.now();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _dateTextEditingController.dispose();
    _dateFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildFromDay;
  }

  get _buildFromDay => Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.hintText,
              style: TextStyle(color: Get.theme.hintColor),
            ),
            Empty(
              height: 5,
            ),
            ShadowView(
              child: TextFormField(
                controller: _dateTextEditingController,
                focusNode: _dateFocusNode,
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
                readOnly: true,
                style: const TextStyle(fontSize: 16),
                onTap: () => _displayDateTimePicker(),
                decoration: _inputDecorationItem(
                    hint: widget.hintText,
                    suffixIcon: Icon(
                      Icons.date_range,
                      color: AppColors.current.accent,
                    )),
                validator: RequiredValidator(errorText: AppText.requiredField),

              ),
            )
          ],
        ),
      );

  InputDecoration _inputDecorationItem({required String hint, required Widget suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      hintText: hint,
      contentPadding: isArLocale? const EdgeInsets.only(right: 12, left: 0) : const EdgeInsets.only(left: 12, right: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Get.theme.shadowColor, width: 0),
      ),
    );
  }

  void _displayDateTimePicker() {
    showCupertinoModalPopup(
      context: Get.context!,
      semanticsDismissible: true,
      builder: (_) => SizedBox(
        width: Get.size.width,
        height: Get.size.height / 2.5,
        child: CupertinoDatePicker(
          onDateTimeChanged: (val) => _selectedDate = val,
          initialDateTime: widget.initialDateTime,
          maximumDate: widget.maximumDate,
          mode: widget.isDateTimePickerMode ? CupertinoDatePickerMode.dateAndTime : CupertinoDatePickerMode.date,
          backgroundColor: Get.theme.cardColor,
          use24hFormat: false,
        ),
      ),
    ).then((_) {
        _selectedDate ??= widget.initialDateTime;
        final day = '${_selectedDate?.year}-${_selectedDate?.month}-${_selectedDate?.day}';
        final time = '${_selectedDate?.hour}:${_selectedDate?.minute}';
        _dateTextEditingController.text = widget.isDateTimePickerMode ? day + ' ' + time : day;
        widget.selectedDate(_selectedDate);
    });
  }
}
