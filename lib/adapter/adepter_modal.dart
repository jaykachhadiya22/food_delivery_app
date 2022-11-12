
import 'package:hive_flutter/adapters.dart';

part 'adepter_modal.g.dart';

@HiveType(typeId: 1)
class Todo{
  @HiveField(0)
  String image;
  @HiveField(1)
  String name;
  @HiveField(2)
  double Price;
  @HiveField(3)
  String id;
  @HiveField(4)
  int quantity;
  Todo( this.image, this.name, this.Price, this.id,this.quantity);
}