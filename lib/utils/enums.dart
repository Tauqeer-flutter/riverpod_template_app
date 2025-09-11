enum SharedPreferencesKeys {
  authToken("auth_token");

  const SharedPreferencesKeys(this.text);

  final String text;
}

enum EndPoints {
  login("auth/admin/login");

  final String url;

  const EndPoints(this.url);
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

enum BaseUrls {
  prodUrl("https://flexdrive-backend-b11-30e7d9c327b8.herokuapp.com/api/v1/"),
  stagUrl(
    "https://f7cf-2407-aa80-14-602-18b1-cfba-db33-268f.ngrok-free.app/api/",
  ),
  s3Url("https://envite-bucket.s3.me-central-1.amazonaws.com/"),
  homePageSocketUrl("wss://ws-pay-test.devcustomprojects.com/api/ws/"),
  stripKey(
    "pk_test_51RLKmxCm6RpgF5PjFHtsIKhqzOekjbLyfBqmKC5c2RM98Fvu7HXBCT2A1ZmI8V33nrngDrPWkdU4BMlodGpOahcp00D4BcMMVR",
  );

  final String url;

  const BaseUrls(this.url);
}
