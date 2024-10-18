enum Env {
  homolog(
    baseUrl: 'https://fake-api.tractian.com',
    title: 'tractianHomolog',
  ),
  prod(
    baseUrl: 'https://fake-api.tractian.com',
    title: 'tractianProd',
  );

  static Env fromString(String env) {
    return Env.values.firstWhere(
      (e) => e.title == env,
      orElse: () => Env.prod,
    );
  }

  final String baseUrl;

  final String title;

  const Env({
    required this.baseUrl,
    required this.title,
  });
}
