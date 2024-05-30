import 'package:aiimscycle/bloc/login_db_cubit/log_data_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'bloc/logger_db_cubit/logger_db_cubit.dart';

class GetDbData extends StatefulWidget {
  const GetDbData({super.key});

  @override
  State<GetDbData> createState() => _GetDbDataState();
}

class _GetDbDataState extends State<GetDbData> {
  List<Map<String, dynamic>> playList = [];
  List<String> searchNotes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    BlocProvider.of<LoggerDbCubit>(context).getLogData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    var formattedTime = DateFormat('HH:mm:ss.SSS').format(now);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<LoggerDbCubit, LoggerDbState>(
              builder: (context, state) {
                if (state is LoggerDbLoaded) {
                  // List<Map<String, dynamic>> loadedPlayList = state.loadedData;
                  List<LogDataClass> logDataClass = state.logDataClass;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(logDataClass.first.id ?? ''),
                        // Text(formattedDate),
                        // Text(formattedTime),
                      ],
                    ),
                  );
                }
                if (state is LoggerDbLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: Text('No Data'),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
