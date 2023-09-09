import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.message,
    required this.fromUser,
  }) : super(key: key);

  final String message;
  final bool fromUser;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: fromUser
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        margin: EdgeInsetsDirectional.only(
          top: 8.0,
          bottom: 8.0,
          start: fromUser ? 80.0 : 16.0,
          end: fromUser ? 16.0 : 80.0,
        ),
        decoration: BoxDecoration(
          color: fromUser
              ? colorScheme.primaryContainer
              : colorScheme.tertiaryContainer,
          borderRadius: BorderRadiusDirectional.only(
            topStart: const Radius.circular(16.0),
            topEnd: const Radius.circular(16.0),
            bottomStart: Radius.circular(fromUser ? 16.0 : 0.0),
            bottomEnd: Radius.circular(fromUser ? 0.0 : 16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fromUser ? "You" : "Chat agent",
              style: textTheme.titleMedium?.apply(
                color: fromUser
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onTertiaryContainer,
              ),
            ),
            Text(
              message,
              style: textTheme.bodySmall?.apply(
                color: fromUser
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onTertiaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
