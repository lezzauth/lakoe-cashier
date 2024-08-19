class ProductModel {
  final String id;
  final String name;
  final String price;
  final List<String> images;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.images});
}
