
import 'package:flutter/material.dart';
import 'package:flutter_common_dio_class/Models/get_model.dart';
import 'package:flutter_common_dio_class/repos/main_repo.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  bool loader = true;
  List<GetModel> getModel = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final response = await MainRepo.getApi('/posts');

      // Handle response
      if (response != null && response.statusCode == 200) {
        debugPrint('Post created successfully: ${response.data}');
        List<dynamic> data = response.data;
        getModel = data.map((json) => GetModel.fromJson(json)).toList();
        setState(() {
          loader = false;
        });
      } else {
        debugPrint('Failed to create post.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loader ? const CircularProgressIndicator() : _buildListView());
  }

  ListView _buildListView() => ListView.builder(
      itemCount: getModel.length,
      itemBuilder: (context, index) => ListTile(
          title: Text("${getModel[index].id.toString()}).  ${getModel[index].title.toString()}"),
          subtitle: Text(getModel[index].body.toString())));
}
