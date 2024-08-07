class WeatherData {
  WeatherData({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });
  late final Coord coord;
  late final List<Weather> weather;
  late final String base;
  late final Main main;
  late final int visibility;
  late final Wind wind;
  late final Clouds clouds;
  late final int dt;
  late final Sys sys;
  late final int timezone;
  late final int id;
  late final String name;
  late final int cod;

  WeatherData.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromJson(json['coord'] ?? {});
    weather = List.from(json['weather'] ?? [])
        .map((e) => Weather.fromJson(e ?? {}))
        .toList();
    base = json['base'] ?? '';
    main = Main.fromJson(json['main'] ?? {});
    visibility = json['visibility'] ?? 0;
    wind = Wind.fromJson(json['wind'] ?? {});
    clouds = Clouds.fromJson(json['clouds'] ?? {});
    dt = json['dt'] ?? 0;
    sys = Sys.fromJson(json['sys'] ?? {});
    timezone = json['timezone'] ?? 0;
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    cod = json['cod'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['coord'] = coord.toJson();
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['base'] = base;
    _data['main'] = main.toJson();
    _data['visibility'] = visibility;
    _data['wind'] = wind.toJson();
    _data['clouds'] = clouds.toJson();
    _data['dt'] = dt;
    _data['sys'] = sys.toJson();
    _data['timezone'] = timezone;
    _data['id'] = id;
    _data['name'] = name;
    _data['cod'] = cod;
    return _data;
  }
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });
  late final double lon;
  late final double lat;

  Coord.fromJson(Map<String, dynamic> json) {
    lon = (json['lon'] ?? 0).toDouble();
    lat = (json['lat'] ?? 0).toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lon'] = lon;
    _data['lat'] = lat;
    return _data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    main = json['main'] ?? '';
    description = json['description'] ?? '';
    icon = json['icon'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });
  late final double temp;
  late final double feelsLike;
  late final double tempMin;
  late final double tempMax;
  late final int pressure;
  late final int humidity;
  late final int seaLevel;
  late final int grndLevel;

  Main.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] ?? 0).toDouble();
    feelsLike = (json['feels_like'] ?? 0).toDouble();
    tempMin = (json['temp_min'] ?? 0).toDouble();
    tempMax = (json['temp_max'] ?? 0).toDouble();
    pressure = json['pressure'] ?? 0;
    humidity = json['humidity'] ?? 0;
    seaLevel = json['sea_level'] ?? 0;
    grndLevel = json['grnd_level'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['temp_min'] = tempMin;
    _data['temp_max'] = tempMax;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['sea_level'] = seaLevel;
    _data['grnd_level'] = grndLevel;
    return _data;
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
  late final double speed;
  late final int deg;
  late final double gust;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = (json['speed'] ?? 0).toDouble();
    deg = json['deg'] ?? 0;
    gust = (json['gust'] ?? 0).toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speed'] = speed;
    _data['deg'] = deg;
    _data['gust'] = gust;
    return _data;
  }
}

class Clouds {
  Clouds({
    required this.all,
  });
  late final int all;

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    return _data;
  }
}

class Sys {
  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
  late final String country;
  late final int sunrise;
  late final int sunset;

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'] ?? '';
    sunrise = json['sunrise'] ?? 0;
    sunset = json['sunset'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country'] = country;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    return _data;
  }
}
