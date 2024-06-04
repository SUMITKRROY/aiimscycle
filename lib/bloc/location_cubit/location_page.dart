import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'location_cubit.dart';

class GetLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('Location')),
        body: Center(
          child: BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) {
              if (state.isLoading) {
                return CircularProgressIndicator();
              } else if (state.position != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Location: Lat: ${state.position!.latitude}, Long: ${state.position!.longitude}',
                    ),
                    SizedBox(height: 20),
                    if (state.distance != null)
                      Text(
                        'Distance to target: ${state.distance!.toStringAsFixed(2)} meters',
                      ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<LocationCubit>()
                            .fetchLocationAndCalculateDistance(28.5678414, 77.2114705);
                      },
                      child: Text('Calculate Distance'),
                    ),
                  ],
                );
              } else if (state.error != null) {
                return Text('Error: ${state.error}');
              } else {
                return ElevatedButton(
                  onPressed: () {},
                  child: Text('Get Location'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
