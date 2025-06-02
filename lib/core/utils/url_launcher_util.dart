import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlOrPhone(String input) async {
  String url = input;

  // Check if it's a phone number (simple pattern: digits only, optional +)
  final phoneRegex = RegExp(r'^\+?\d{6,15}$');
  if (phoneRegex.hasMatch(input)) {
    url = 'tel:$input';
  } else if (!input.startsWith('http')) {
    // If it's a URL without schema, add 'https://'
    url = input;
  }

  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw Exception('Could not launch $url');
  }
}
