import 'package:flutter/material.dart';
import 'package:http_provider/Models/news_data.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Storypage extends StatelessWidget {
  const Storypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Newsdata>().fetchData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider With HTTP Practice'),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{},
        child: Center(
          child: Consumer<Newsdata>(
            builder: (context, value, child) {
              return value.map.isEmpty && !value.error?
              CircularProgressIndicator():
                  value.error? Text("Ooops Some thing wrong.${value.errorMessage}"):
                      ListView.builder(itemCount: value.map['user'.length],
                          itemBuilder: (context, index) {
                        return Newscard(map: value.map['user'][index]);
                      });



            },
          ),
        ),
      ),

    );
  }
}
class Newscard extends StatelessWidget {
  const Newscard({Key? key, required this.map}) : super(key: key);
  final Map<String,dynamic>map;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Image.network("${map['avatar']}"),
             Text("${map['name']}"),
           ],

        ),
      ),

    );
  }
}
