class CatalogModel{
  static final items = [
    Item(
        id: "asdf",
        name: "iphone12",
        desc: "Description of iphone12",
        price: 200,
        color: "#e3e3e3",
        image: "image url"
    )
  ];
}

class Item{
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

}

