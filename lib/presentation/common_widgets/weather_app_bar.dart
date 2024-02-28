import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/const/app_color.dart';
import 'package:flutterweatherapp/const/weather_app_fonts.dart';
import 'package:flutterweatherapp/const/weather_font_sizes.dart';

import '../../routes/weather_routes.dart';
import '../controller/auth/auth_bloc.dart';
import '../controller/auth/auth_event.dart';

class WeatherAppBar extends StatelessWidget {
  final String cityNames;
  final Function onTap;

  const WeatherAppBar({
    super.key,
    required this.cityNames, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: WeatherAppColor.transParentColor,
      leading: Icon(Icons.location_on, color: WeatherAppColor.whiteColor),
      title: Text(
        cityNames,
        style: WeatherAppFonts.medium(
            fontWeight: FontWeight.w400, color: WeatherAppColor.whiteColor)
            .copyWith(fontSize: WeatherAppFontSize.s18),
      ),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: GestureDetector(
              onTap: () {
                onTap.call();
              },
              child: Icon(Icons.info_outline_sharp,
                  color: WeatherAppColor.whiteColor)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: GestureDetector(
              onTap: () {
                context.read<AuthBloc>().add(SignOutEvent());
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, WeatherRoutes.splashRoute,
                    arguments: [false, null]);
              },
              child: Icon(Icons.logout,
                  color: WeatherAppColor.whiteColor)),
        )
      ],
    );
  }
}
