import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemedColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.condition),
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemedColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition),
                  shadowColor: Colors.black,
                  elevation: 3,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemedColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    // ☀️ Sunny / Clear
    case 'sunny':
    case 'clear':
      return Colors.amber;

    // 🌤 Partly cloudy
    case 'partly cloudy':
      return Colors.lightBlue;

    // ☁️ Cloudy / Overcast
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;

    // 🌫 Mist / Fog
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    // 🌧 Patchy rain / Drizzle
    case 'patchy rain possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'light rain shower':
      return Colors.lightBlue;

    // 🌧 Moderate rain
    case 'moderate rain at times':
    case 'moderate rain':
    case 'moderate or heavy rain shower':
      return Colors.blue;

    // 🌧 Heavy / Torrential rain
    case 'heavy rain at times':
    case 'heavy rain':
    case 'torrential rain shower':
      return Colors.indigo;

    // 🧊 Freezing rain / Drizzle
    case 'patchy freezing drizzle possible':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.cyan;

    // 🌨 Sleet
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.blueGrey;

    // ❄️ Snow (light)
    case 'patchy snow possible':
    case 'patchy light snow':
    case 'light snow':
    case 'light snow showers':
      return Colors.cyan;
    // ❄️ Snow (moderate)
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;

    // ❄️ Snow (heavy / blizzard)
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'blowing snow':
    case 'blizzard':
      return Colors.blue;

    // 🧊 Ice pellets
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.teal;

    // ⛈ Thunder (rain)
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;

    // ⛈ Thunder (snow)
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.purple;

    // ❓ Fallback
    default:
      return Colors.blueGrey;
  }
}
