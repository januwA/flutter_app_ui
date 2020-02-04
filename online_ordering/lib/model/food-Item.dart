class FoodItem {
  final String name;
  final double star;
  final double price;
  final String image;
  final double originalPrice;

  const FoodItem({
    this.name,
    this.star,
    this.price,
    this.image,
    this.originalPrice,
  });
}

const foodItems = [
  const FoodItem(
    name: "Delicious hot dog",
    star: 4,
    price: 6,
    image: "assets/hotdog.png",
    originalPrice: 18,
  ),
  const FoodItem(
    name: "Cheese pizza",
    star: 5,
    price: 12,
    image: "assets/pizza.png",
    originalPrice: 18,
  ),
];
