import 'package:flutter/material.dart';

import 'gravity_event.dart';
import 'gravity_mock_data.dart';

class GravityFeedScreen extends StatelessWidget {
  const GravityFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalGravity = _calculateTotalGravity();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Gravity'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.leaderboard),
            onPressed: () {
              // later: open gravity score details screen
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: mockGravityEvents.length + 1, // +1 for header
          separatorBuilder: (_, index) {
            // slightly bigger space after header
            if (index == 0) return const SizedBox(height: 16);
            return const SizedBox(height: 12);
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return _GravitySummaryHeader(totalGravity: totalGravity);
            }

            final event = mockGravityEvents[index - 1];
            return _GravityEventCard(event: event);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // later: create a new reflection, log an interaction, etc
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logging interactions coming soon.'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

int _calculateTotalGravity() {
  return mockGravityEvents.fold<int>(
    0,
        (sum, event) => sum + event.gravityScoreChange,
  );
}

class _GravitySummaryHeader extends StatelessWidget {
  final int totalGravity;

  const _GravitySummaryHeader({required this.totalGravity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPositive = totalGravity >= 0;
    final sign = isPositive ? '+' : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today\'s gravity',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: theme.colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$sign$totalGravity',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Based on recent interactions',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer
                          .withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Recent interactions',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _GravityEventCard extends StatelessWidget {
  final GravityEvent event;

  const _GravityEventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPositive = event.gravityScoreChange >= 0;

    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AvatarCircle(initial: event.userName.characters.first),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.userName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.actionText,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _GravityChip(
                        value: event.gravityScoreChange,
                        isPositive: isPositive,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _formatTimestamp(event.timestamp),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarCircle extends StatelessWidget {
  final String initial;

  const _AvatarCircle({required this.initial});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      radius: 22,
      backgroundColor: theme.colorScheme.primaryContainer,
      child: Text(
        initial.toUpperCase(),
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _GravityChip extends StatelessWidget {
  final int value;
  final bool isPositive;

  const _GravityChip({
    required this.value,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sign = isPositive ? '+' : '';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isPositive
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPositive ? Icons.arrow_upward : Icons.arrow_downward,
            size: 16,
            color: isPositive
                ? theme.colorScheme.onPrimaryContainer
                : theme.colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 4),
          Text(
            '$sign$value',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isPositive
                  ? theme.colorScheme.onPrimaryContainer
                  : theme.colorScheme.onErrorContainer,
            ),
          ),
        ],
      ),
    );
  }
}

String _formatTimestamp(DateTime timestamp) {
  final now = DateTime.now();
  final diff = now.difference(timestamp);

  if (diff.inMinutes < 1) {
    return 'Just now';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes} min ago';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} h ago';
  } else {
    final days = diff.inDays;
    return '$days d ago';
  }
}
