import 'gravity_event.dart';

final List<GravityEvent> mockGravityEvents = [
  GravityEvent(
    id: '1',
    userName: 'Avery',
    actionText: 'reacted strongly to your story about switching careers.',
    timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    gravityScoreChange: 4,
  ),
  GravityEvent(
    id: '2',
    userName: 'Jordan',
    actionText: 'saved your post about building a homelab.',
    timestamp: DateTime.now().subtract(const Duration(hours: 1, minutes: 12)),
    gravityScoreChange: 7,
  ),
  GravityEvent(
    id: '3',
    userName: 'Riley',
    actionText: 'replied with a deep question on your social media detox log.',
    timestamp: DateTime.now().subtract(const Duration(hours: 5)),
    gravityScoreChange: 10,
  ),
  GravityEvent(
    id: '4',
    userName: 'Sam',
    actionText: 'ignored three messages in a row this week.',
    timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
    gravityScoreChange: 6,
  ),
  GravityEvent(
    id: '5',
    userName: 'Morgan',
    actionText: 'shared your gravity score screenshot with friends.',
    timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 3)),
    gravityScoreChange: 12,
  ),
];
