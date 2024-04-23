import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/domain/entity/cheque_entity.dart';
import 'package:surf_flutter_courses_template/pages/empty_page.dart';
import 'package:surf_flutter_courses_template/style/buttonstyles.dart';
import 'package:surf_flutter_courses_template/style/textstyles.dart';
import 'package:surf_flutter_courses_template/utils/extension/date_time_extension.dart';
import 'package:surf_flutter_courses_template/utils/extension/formatter_price_extension.dart';
import 'package:surf_flutter_courses_template/utils/extension/sort_by_filter_extension.dart';

import '../data/mock_date.dart';
import '../domain/entity/category_type.dart';
import '../domain/entity/product_entity.dart';
import '../domain/entity/sorting_type.dart';
import '../main.dart';
import 'filter_page.dart';

class ChequePage extends StatefulWidget {
  /// cheque id
  final int id;
  const ChequePage({super.key, required this.id});

  @override
  State<ChequePage> createState() => _ChequePageState();
}

class _ChequePageState extends State<ChequePage> {
  Future<ChequeEntity>? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _data = shoppingListRepository.getCheque(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const _ErrorWidget();
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return data != null
                ? _ContentWidget(data: data)
                : const EmptyPage(title: 'Empty');
          }
        }

        return const _LoadingWidget();
      },
    );
  }
}

class _ContentWidget extends StatefulWidget {
  final ChequeEntity data;
  const _ContentWidget({super.key, required this.data});

  @override
  State<_ContentWidget> createState() => __ContentWidgetState();
}

class __ContentWidgetState extends State<_ContentWidget> {
  SortingType _currentFilter = SortingType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Чек № ${widget.data.id}',
              style: MyAppTestStyles.titleBigFold,
            ),
            Text(
              widget.data.date.toStringDateAndTime(),
              style: MyAppTestStyles.dateTimeStyle,
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Список покупок',
                    style: MyAppTestStyles.titleBigFold,
                  ),
                ),
                IconButton(
                  onPressed: _onPressedFilter,
                  icon: const Icon(Icons.sort),
                  style: MyButtonStyles.sortButton,
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (_, i) {
            final category = Category.values[i];
            final categoryProducts = widget.data.products
                .where((product) => product.category == category)
                .toList();
            final isLastCategory = i == Category.values.length - 1;
            return categoryProducts.isNotEmpty
                ? _CategoryWidget(
                    category: category.name,
                    productOfCategory: categoryProducts,
                    products: widget.data.products,
                    isLastCategory: isLastCategory,
                    filter: _currentFilter)
                : const SizedBox();
          },
          itemCount: Category.values.length),
    );
  }

  Future<void> _onPressedFilter() async {
    /// При открытии модального окна ожидаем получения фильтра,
    /// при закрытии проверяем, изменился ли фильтр
    final SortingType? filter = await showModalBottomSheet(
        isScrollControlled: true,

        /// Свойство [FilterScreen] указывает с каким фильтром мы открываем страницу
        context: context,
        builder: (_) => FilterPage(filter: _currentFilter));

    if (filter == null) return;

    if (filter != _currentFilter) {
      setState(() {
        _currentFilter = filter;
      });
    }
  }
}

class _CategoryWidget extends StatelessWidget {
  final String category;
  final List<ProductEntity> productOfCategory;
  final List<ProductEntity> products;
  final bool isLastCategory;
  final SortingType filter;

  const _CategoryWidget(
      {required this.category,
      required this.productOfCategory,
      required this.products,
      required this.isLastCategory,
      required this.filter});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            category,
            style: MyAppTestStyles.categoryTitle,
          ),
        ),
        ...productOfCategory

            /// [sortByFilter] расширение для обработки списка
            .sortByFilter(filter)
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListTile(
                    leading: Image.network(
                      e.imageUrl,
                      height: 68,
                      width: 68,
                      fit: BoxFit.cover,
                    ),
                    title:
                        Text(e.title, style: MyAppTestStyles.defaultTextStyle),
                    subtitle: Text(e.amount.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          e.sale > 0
                              ? e.decimalPrice.toFormattedCurrency()
                              : '',
                          style: MyAppTestStyles.discountPriceStyle,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          // доделать отображение цены со скидкой
                          e.sale > 0
                              ? '${((((e.price / 100) / 100) * e.sale)).toStringAsFixed(2)} Р'
                              : e.decimalPrice.toFormattedCurrency(),
                          style: e.sale > 0
                              ? MyAppTestStyles.redPriceStyle
                              : MyAppTestStyles.priceStyle,
                        ),
                      ],
                    )),
              ),
            )
            .toList(),
        const Divider(
          indent: 20,
          endIndent: 20,
        ),
        if (isLastCategory)
          _FinancialWidget(
            products: products,
          ),
      ],
    );
  }
}

class _FinancialWidget extends StatelessWidget {
  final List<ProductEntity> products;

  const _FinancialWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final fullTotal = _getFullTotal(products);
    final discount = _getDiscount(products);
    final total = fullTotal - discount;

    var allPrice =
        dataForStudents.map((e) => e.price).fold(0, (a, b) => a + b) ~/ 100;
    var allSalePrice = dataForStudents
        .map((e) => (e.price - (e.price * (e.sale / 100))))
        .fold(0, (a, b) => a + b ~/ 100);
    var howSale = allPrice - allSalePrice;
    var salePercent = (howSale * 100) / allPrice;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'В вашей покупке',
            style: MyAppTestStyles.categoryTitle,
          ),
          _RowWidget(
            description: _plural(products.length),
            value: fullTotal.toFormattedCurrency(),
            textStyle: MyAppTestStyles.defaultTextStyle,
            valueTextStyle: MyAppTestStyles.priceStyle,
          ),
          _RowWidget(
            description: 'Скидка ${salePercent.toStringAsFixed(2)}%',
            value: '-${discount.toFormattedCurrency()}',
            textStyle: MyAppTestStyles.defaultTextStyle,
            valueTextStyle: MyAppTestStyles.priceStyle,
          ),
          _RowWidget(
            description: 'Итого',
            value: total.toFormattedCurrency(),
            textStyle: MyAppTestStyles.categoryTitle,
            valueTextStyle: MyAppTestStyles.categoryTitle,
          ),
        ],
      ),
    );
  }

  String _plural(int count) {
    return Intl.plural(
      count,
      zero: 'нет товаров',
      one: '$count товар',
      few: '$count товара',
      many: '$count товаров',
      other: '$count товара',
      locale: 'ru',
    );
  }

  /// Стоимость товара.
  /// 'fold' сокращает коллекцию до одного значения путем итеративного объединения
  /// каждого элемента коллекции с существующим значением. Использует начальное значение
  /// в качестве начального значения, после чего перебирает элементы и обновляет значения
  /// для каждого элемента с помощью функции объединения
  Decimal _getFullTotal(List<ProductEntity> products) {
    return products.fold<Decimal>(
      Decimal.zero,
      ((previousValue, element) => previousValue + element.decimalPrice),
    );
  }

  Decimal _getDiscount(List<ProductEntity> products) {
    /// Получаем список продуктов со скидкой
    final discount = products.where((e) => e.sale > 0).toList();

    return discount.isEmpty
        ? Decimal.zero
        : discount.fold<Decimal>(
            Decimal.zero,
            (previousValue, element) =>
                previousValue +
                _calculateDiscountForProduct(
                  element.decimalPrice,
                  element.sale.toString(),
                ),
          );
  }

  /// Расчет скидки для одного элемента
  /// Скидка в процентах
  Decimal _calculateDiscountForProduct(Decimal price, String discountPercent) {
    final discountAmount =
        (price * Decimal.parse(discountPercent) / Decimal.fromInt(100))
            .toDecimal();

    return price - discountAmount;
  }
}

class _RowWidget extends StatelessWidget {
  final String description;
  final String value;
  final TextStyle? textStyle;
  final TextStyle? valueTextStyle;

  const _RowWidget(
      {super.key,
      required this.description,
      required this.value,
      this.textStyle,
      this.valueTextStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            description,
            style: textStyle,
          ),
        ),
        Text(
          value,
          style: valueTextStyle,
        )
      ],
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error!'),
    );
  }
}
