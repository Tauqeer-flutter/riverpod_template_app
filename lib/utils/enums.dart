enum BaseUrl {
  prodUrl('https://example.com/'),
  // Staging URL goes here.
  stagUrl('');

  final String url;

  const BaseUrl(this.url);
}

enum RegExpPattern {
  email(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    'Please enter a valid email address.',
  ),
  name(r'^[a-zA-Z]{3,}$', 'Enter valid name');

  const RegExpPattern(this.pattern, this.errorMessage);

  final String pattern;
  final String errorMessage;
}
