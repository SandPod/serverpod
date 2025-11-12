import 'dart:async';

class TestCompleterTimeout {
  Map<String, Completer> _completers = {};
  Timer? _timer;

  void start(
    final Map<String, Completer> completers, {
    final Duration duration = const Duration(seconds: 5),
  }) {
    _completers = completers;
    _timer = Timer(duration, () {
      _completers.forEach((final key, final value) {
        if (!value.isCompleted) {
          value.completeError('$key failed to complete future before timeout.');
        }
      });
    });
  }

  void cancel() {
    _timer?.cancel();
  }
}
