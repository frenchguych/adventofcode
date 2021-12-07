class Box {
  final int w;
  final int l;
  final int h;
  final List<int> sides;
  final List<int> perimeters;

  Box({required this.w, required this.h, required this.l})
      : sides = [w * h, w * l, h * l]..sort(),
        perimeters = [w, h, l]..sort();

  int get surfaceArea => sides.fold(0, (acc, face) => acc + 2 * face);

  int get smallestSide => sides[0];

  int get surfaceToOrder => surfaceArea + smallestSide;

  int get ribbonLength =>
      perimeters[0] * 2 +
      perimeters[1] * 2 +
      perimeters.fold<int>(1, (acc, dimension) => acc * dimension);
}
