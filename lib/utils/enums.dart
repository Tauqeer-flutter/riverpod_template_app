enum SharedPreferencesKeys {
  authToken("auth_token");

  const SharedPreferencesKeys(this.text);

  final String text;
}

enum EndPoints {
  login("auth/login");

  final String url;

  const EndPoints(this.url);
}

enum BaseUrls {
  prodUrl("https://ws-pay-test.devcustomprojects.com/api/"),
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

