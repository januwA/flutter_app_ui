final cookies = [
  Cookie(
    name: 'Cookie mint',
    price: '\$3.99',
    image: 'assets/cookiemint.jpg',
    added: false,
    isFavorite: true,
  ),
  Cookie(
    name: 'Cookie cream',
    price: '\$5.99',
    image: 'assets/cookiecream.jpg',
    added: false,
    isFavorite: false,
  ),
  Cookie(
    name: 'Cookie classic',
    price: '\$1.99',
    image: 'assets/cookieclassic.jpg',
    added: true,
    isFavorite: false,
  ),
  Cookie(
    name: 'Cookie choco',
    price: '\$2.99',
    image: 'assets/cookiechoco.jpg',
    added: false,
    isFavorite: true,
  ),
];

class Cookie {
  final String name;
  final String price;
  final String image;
  final bool added;
  final bool isFavorite;

  Cookie({this.name, this.price, this.image, this.added, this.isFavorite});
}
