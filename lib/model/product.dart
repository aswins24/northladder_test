enum Tag{hotBid,freshBid}

class Product{
  final String name;
  final Tag tag;
  final double currentBid;
  final String image;
  final int quantity;

  const Product(this.name, this.tag,this.currentBid,this.image, this.quantity);
}