import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/domain/entity/sorting_type.dart';
import 'package:surf_flutter_courses_template/style/buttonstyles.dart';
import 'package:surf_flutter_courses_template/style/colors.dart';
import 'package:surf_flutter_courses_template/style/textstyles.dart';

class FilterPage extends StatefulWidget {
  final SortingType filter;

  const FilterPage({super.key, required this.filter});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  /// Начальный фильтр
  SortingType _selectedFilter = SortingType.none;

  /// При инициализации модального окна значение фильтра присваивается с предыдущего экрана
  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.filter;
  }

  void _closeSortWindow() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.88,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  'Сортировка',
                  style: MyAppTestStyles.sortTitle,
                )),
                IconButton(
                    onPressed: _closeSortWindow,
                    icon: const Icon(
                      Icons.close,
                      color: MyAppColors.textColor,
                    ))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (_, i) {
                final type = FilterType.values[i];
                final sortingList =
                    SortingType.values.where((e) => e.type == type).toList();
                final isLastType = i == FilterType.values.length - 1;

                return sortingList.isNotEmpty
                    ? _FilterTypeWidget(
                        type: type,
                        sortingList: sortingList,
                        selectedFilter: _selectedFilter,
                        isLastType: isLastType,
                        onChanged: _onChanged,
                        onDone: _onPressedDone,
                      )
                    : const SizedBox();
              },
              itemCount: FilterType.values.length,
            ),
          ),
        ],
      ),
    );
  }

  /// проверка, выбран ли фильтр
  void _onChanged(SortingType? value) {
    final newValue = value;
    if (newValue == null || (newValue == _selectedFilter)) return;

    setState(() {
      _selectedFilter = newValue;
    });
  }

  /// возвращение выбранного фильтра на предыдущий экран
  void _onPressedDone() {
    Navigator.of(context).pop(_selectedFilter);
  }
}

/// виджет блока сортировок внутри категорий
class _FilterTypeWidget extends StatelessWidget {
  final FilterType type;
  final List<SortingType> sortingList;
  final SortingType selectedFilter;
  final bool isLastType;
  final ValueChanged<SortingType?> onChanged;
  final VoidCallback onDone;

  const _FilterTypeWidget(
      {super.key,
      required this.type,
      required this.sortingList,
      required this.selectedFilter,
      required this.isLastType,
      required this.onChanged,
      required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          indent: 20,
          endIndent: 20,
        ),
        if (type != FilterType.none)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              type.name,
              style: MyAppTestStyles.defaultTextStyle,
            ),
          ),
        ...sortingList
            .map(
              (e) => RadioListTile<SortingType>(
                title: Text(
                  e.name,
                  style: MyAppTestStyles.sortCategoryName,
                ),
                value: e,
                activeColor: MyAppColors.appBarColorSelected,
                groupValue: selectedFilter,
                onChanged: onChanged,
              ),
            )
            .toList(),
        if (isLastType) ...[
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FilledButton(
              onPressed: onDone,
              style: MyButtonStyles.bigGreenButton,
              child: const Text(
                'Готово',
                style: MyAppTestStyles.sortDoneButtonStyle,
              ),
            ),
          )
        ]
      ],
    );
  }
}
