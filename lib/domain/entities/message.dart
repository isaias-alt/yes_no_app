enum FromWho { mine, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timestamp;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
