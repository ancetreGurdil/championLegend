class Image {
  final String full;
  final String sprite;
  final String group;
  final int x;
  final int y;
  final int w;
  final int h;

  const Image({
    required this.full,
    required this.sprite,
    required this.group,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      full: json['full'],
      sprite: json['sprite'],
      group: json['group'],
      x: json['x'],
      y: json['y'],
      w: json['w'],
      h: json['h'],
    );
  }
}