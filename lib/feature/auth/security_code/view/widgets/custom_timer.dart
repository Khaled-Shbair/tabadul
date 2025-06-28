import '/config/all_imports.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({
    required this.canSend,
    super.key,
  });

  final bool canSend;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        final seconds = state is TimerRunInProgress ? state.seconds : 0;
        return _buildTimer(seconds, context);
      },
    );
  }

  Widget _buildTimer(int seconds, BuildContext context) {
    return Text(
      '00:${seconds.toString().padLeft(2, '0')}',
      style: context.textTheme.labelLarge?.copyWith(
        color: canSend
            ? context.theme.colorScheme.surface
            : context.theme.primaryColor,
      ),
    );
  }
}
