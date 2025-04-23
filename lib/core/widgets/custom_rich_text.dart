import '/config/all_imports.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    required this.recognizer,
    required this.title,
    required this.subTitle,
    super.key,
  });

  final GestureRecognizer recognizer;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: context.textTheme.displayMedium,
            ),
            TextSpan(
              recognizer: recognizer,
              text: subTitle,
              style: context.textTheme.displayMedium?.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
