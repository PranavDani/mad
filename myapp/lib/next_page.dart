import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  Widget _buildListTile(BuildContext context, int title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  "Subtitle",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Title"),
          subtitle: Text("Subtitle"),
          leading: Image.network(
            "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(child: _buildListView(context)),
            ],
          ),
        ),
      ),
    );
  }
}
