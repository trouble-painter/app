/// A keyword category a host can pick. [name] is in the room's locale.
class GameCategory {
  final String id;
  final String name;

  const GameCategory({
    required this.id,
    required this.name,
  });
}
