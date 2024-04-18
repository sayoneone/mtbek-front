import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_error_view.dart';
import 'package:mtbek_front/view/common/default_text_styles.dart';
import 'package:mtbek_front/view/common/mobile/mobile_text_input.dart';
import 'package:custom_date_range_picker/custom_calendar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MobileDefaultDateRangePickerView extends StatefulWidget {
  const MobileDefaultDateRangePickerView({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onStartDateChange,
    required this.onEndDateChange,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime?) onStartDateChange;
  final Function(DateTime?) onEndDateChange;

  @override
  State<MobileDefaultDateRangePickerView> createState() =>
      _MobileDefaultDateRangePickerViewState();
}

class _MobileDefaultDateRangePickerViewState
    extends State<MobileDefaultDateRangePickerView> {
  DateTime? cacheStartDate;
  DateTime? cacheEndDate;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.startDate != null && widget.endDate != null) {
      controller.text =
          '${DateFormat('dd.MM.yyyy').format(widget.startDate!)} – ${DateFormat('dd.MM.yyyy').format(widget.endDate!)}';
    } else {
      controller.text = '';
    }
    return MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: 0,
      splashColor: DefaultColors.transparent,
      hoverColor: DefaultColors.transparent,
      highlightColor: DefaultColors.transparent,
      onPressed: () {
        showDialog(
          barrierColor: DefaultColors.transparent,
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: CustomCalendar(
                          minimumDate: null,
                          maximumDate: null,
                          initialEndDate: null,
                          initialStartDate: null,
                          primaryColor: Theme.of(context).primaryColor,
                          startEndDateChange: (
                            DateTime startDateData,
                            DateTime endDateData,
                          ) {
                            setState(() {
                              cacheStartDate = startDateData;
                              cacheEndDate = endDateData;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                widget.onStartDateChange(null);
                                widget.onEndDateChange(null);
                                setState(() {
                                  cacheStartDate = null;
                                  cacheEndDate = null;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                alignment: Alignment.center,
                                child: Text(
                                  'Сбросить',
                                  style: DefaultextStyles.body.copyWith(
                                    color: DefaultColors.red500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                if (cacheStartDate != null &&
                                    cacheEndDate != null) {
                                  widget.onStartDateChange(cacheStartDate);
                                  widget.onEndDateChange(cacheEndDate);
                                  Navigator.pop(context);
                                } else {
                                  DefaultErrorView.call(
                                    message: 'Некорректный период',
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Сохранить',
                                  style: DefaultextStyles.body.copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: IgnorePointer(
        child: MobiletextField(
          borderColor: Theme.of(context).scaffoldBackgroundColor,
          isLong: true,
          hint: 'Выберите период',
          isError: false,
          errorText: '',
          controller: controller,
        ),
      ),
    );
  }
}
