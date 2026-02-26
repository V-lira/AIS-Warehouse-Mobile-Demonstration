class Operation {
  final int id;
  final String type; // Приход, Расход, Инвентаризация
  final String productName;
  final int quantity;
  final String user;
  final DateTime dateTime;
  final String? comment;
  
  Operation({
    required this.id,
    required this.type,
    required this.productName,
    required this.quantity,
    required this.user,
    required this.dateTime,
    this.comment,
  });
}