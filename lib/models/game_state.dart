class ObstacleModel {
  double x;
  double y;
  bool isFast; // kırmızı özel engel mi?

  ObstacleModel({required this.x, required this.y, this.isFast = false});
}
