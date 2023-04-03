class Horoscope {
  final String _name;
  final String _dates;
  final String _detail;
  final String _smallIcon;
  final String _bigIcon;

  Horoscope(
      this._name, this._dates, this._detail, this._smallIcon, this._bigIcon);
  get name => _name;

  get dates => _dates;

  get detail => _detail;

  get smallIcon => _smallIcon;

  get bigIcon => _bigIcon;
}
