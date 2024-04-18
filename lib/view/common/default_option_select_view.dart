import 'package:mtbek_front/view/common/default_colors.dart';
import 'package:mtbek_front/view/common/default_text_input.dart';
import 'package:flutter/material.dart';

class DefaultOptionSelectView extends StatelessWidget {
  const DefaultOptionSelectView({
    super.key,
    required this.onSelect,
    required this.selectedItem,
    required this.items,
    required this.label,
  });
  final List<dynamic>? items;
  final dynamic selectedItem;
  final Function(dynamic) onSelect;
  final String label;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      enableFeedback: false,
      splashRadius: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      color: Theme.of(context).scaffoldBackgroundColor,
      constraints: const BoxConstraints.expand(height: 300, width: 200),
      position: PopupMenuPosition.over,
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height / 5,
      ),
      child: IgnorePointer(
        child: Stack(
          alignment: Alignment.center,
          children: [
            DefaultextField(
              hint: label,
              isError: false,
              errorText: '',
              isLong: false,
              controller: TextEditingController(
                text: selectedItem?.name ?? '',
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: DefaultColors.mediumGrey,
                ),
              ),
            ),
          ],
        ),
      ),
      itemBuilder: (context) {
        return items!.map((item) {
          return PopupMenuItem(
            value: item,
            child: Text(item.name ?? 'Название отсутвует'),
          );
        }).toList();
      },
      onSelected: (region) {
        onSelect(region);
      },
    );
  }
}
