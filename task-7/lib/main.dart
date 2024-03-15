void main() {
  final priceLess100 = PriceFilter(100);
  final waterType = TypeFilter('вода');
  final amountLess80 = AmountFilter(80);

  final filterList = [priceLess100, waterType, amountLess80];

  final articles = '''
  1,хлеб,Бородинский,500,5
  2,хлеб,Белый,200,15
  3,молоко,Полосатый кот,50,53
  4,молоко,Коровка,50,47
  5,вода,Апельсин,25,65
  6,вода,Бородинский,350,5
  ''';

  List<String> articleStrings = articles.split('\n');

  List<Article> products = [];

  for (final articleAsString in articleStrings) {
    List<String> productsAsList = articleAsString.split(',');

    if (productsAsList.length == 5) {
      int? id = int.tryParse(productsAsList[0]);
      String type = productsAsList[1];
      String title = productsAsList[2];
      int? price = int.tryParse(productsAsList[3]);
      int? amount = int.tryParse(productsAsList[4]);

      if (id != null && price != null && amount != null) {
        products.add(Article(id, type, title, price, amount));
      }
    }
  }

  print('\n');
  applyFilter(products, priceLess100);
  print('\n');
  applyFilterList(products, filterList);
  print('\n');
}

class Article {
  Article(this.id, this.type, this.title, this.price, this.amount);

  final int id;
  final String type;
  final String title;
  final int price;
  final int amount;

  @override
  String toString() {
    return '$id $type $title $price руб $amount шт';
  }
}

abstract class Filter<T> {
  bool apply(T article);
}

// filters
class PriceFilter extends Filter<Article> {
  int maxPrice;

  PriceFilter(this.maxPrice);

  @override
  bool apply(Article article) => article.price <= maxPrice;
}

class AmountFilter extends Filter<Article> {
  int maxAmount;

  AmountFilter(this.maxAmount);

  @override
  bool apply(Article article) => article.amount <= maxAmount;
}

class TypeFilter extends Filter<Article> {
  String selectType;

  TypeFilter(this.selectType);

  @override
  bool apply(Article article) => article.type == selectType;
}

// filter functions
void applyFilter(List<Article> articles, filter) {
  for (var article in articles)
    if (filter.apply(article)) {
      print(article);
    }
}

void applyFilterList(List<Article> articles, List<Filter> filters) {
  for (var article in articles)
    if (filters.every((filter) => filter.apply(article))) {
      print(article);
    }
}
