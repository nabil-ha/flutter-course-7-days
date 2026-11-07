import 'package:day_4/api/dio.dart';
import 'package:day_4/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestAPIPage extends StatefulWidget {
  const TestAPIPage({super.key});

  @override
  State<TestAPIPage> createState() => _TestAPIPageState();
}

class _TestAPIPageState extends State<TestAPIPage> {
  dynamic data = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: Text("Test API Page")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (value.status != null && value.status == STATUS.loading)
                CircularProgressIndicator(),
              if (value.status != null && value.status == STATUS.error)
                Text("Error"),
              ElevatedButton(
                onPressed: () async {
                  final dio = DioClient();
                  value.setLoading();

                  try {
                    final response = await dio.get('/nabil');
                    value.setSuccess(response.data);
                  } on Exception catch (error) {
                    value.setError(error);
                  }
                },
                child: Text("POST DATA"),
              ),
              Text("DATA:"),
              Text(value.data.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
