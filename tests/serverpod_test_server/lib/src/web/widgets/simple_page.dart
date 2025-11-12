import 'package:serverpod/serverpod.dart';

class SimplePageWidget extends TemplateWidget {
  SimplePageWidget({
    required final String title,
    required final WebWidget body,
  }) : super(name: 'simple_page') {
    values = {
      'title': title,
      'body': body,
    };
  }
}
