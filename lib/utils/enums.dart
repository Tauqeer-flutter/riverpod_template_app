enum BaseUrl {
  prodUrl('https://example.com/'),
  // Staging URL goes here.
  stagUrl('');

  final String url;

  const BaseUrl(this.url);
}
