enum OrderStatus {
  pending,
  accepted,
  driverOnTheWay,
  driverArrived,
  onTrip,
  finished,
  completed,
  cancelled,
  noDriverFound,
}
extension OrderStatusExtension on OrderStatus {
  static OrderStatus? fromString(String? status) {
    if (status == null) return null;

    switch (status.toLowerCase().trim()) {
      case "pending":
        return OrderStatus.pending;
      case "accepted":
        return OrderStatus.accepted;
      case "driver arrived":
        return OrderStatus.driverArrived;
      case "driver on the way":
        return OrderStatus.driverOnTheWay;
      case "on trip":
        return OrderStatus.onTrip;
      case "finished":
        return OrderStatus.finished;
      case "completed":
        return OrderStatus.completed;
      case "cancelled":
        return OrderStatus.cancelled;
      case "no driver found":
        return OrderStatus.noDriverFound;
      case "noDriverFound":
        return OrderStatus.noDriverFound;
      default:
        return OrderStatus.noDriverFound;
    }
  }
}
