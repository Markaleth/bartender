enum AnalyticsPeriod {
  days30('30d'),
  days90('90d'),
  days365('365d');

  final String value;
  const AnalyticsPeriod(this.value);
}
