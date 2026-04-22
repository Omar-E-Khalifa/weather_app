import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search city",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeathercubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeathercubit.getCurrentWeather(cityName: value);

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              hint: Opacity(
                opacity: 0.5,
                child: Text("Enter City Name"),
              ),
              suffixIcon: Icon(Icons.search),
              label: Text("Search"),
            ),
          ),
        ),
      ),
    );
  }
}
