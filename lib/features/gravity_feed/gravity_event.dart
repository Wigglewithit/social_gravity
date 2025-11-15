class GravityEvent {
  final String id;
  final String userName;
  final String actionText;
  final DateTime timestamp;
  final int gravityScoreChange;

  const GravityEvent({
    required this.id,
    required this.userName,
    required this.actionText,
    required this.timestamp,
    required this.gravityScoreChange,
  });
}
