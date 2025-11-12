import 'package:serverpod/serverpod.dart';

class TextWidget extends TemplateWidget {
  TextWidget({
    required final String text,
  }) : super(name: 'text') {
    values = {
      'text': text,
    };
  }
}
