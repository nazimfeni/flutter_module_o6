import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Photo Gallery"),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {


  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {



  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
  var myItems = [
    {
      "img":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKboCkjXUKztIj7P8a5UjeFn0lAMQSp_TqhQ&usqp=CAU",
      "title": "Photo 0",
      "caption": "Caption 0",
    },
    {
      "img":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr_-62a40u3lSIyRP5EKOjJeQiZROwTeVCOQ&usqp=CAU",
      "title": "Photo 1",
      "caption": "Caption 1",
    },
    {
      "img":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0cf6jcfBR56-w0-_ChVozZfDmwh6F2z0NbQ&usqp=CAU",
      "title": "Photo 2",
      "caption": "Caption 2",
    },
    {
      "img":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnOrOwY43A2IXz1v0yLjmHVWj0d2_YMm_6eA&usqp=CAU",
      "title": "Photo 3",
      "caption": "Caption 3",
    },
    {
      "img":
      "https://img.freepik.com/free-photo/beautiful-kitten-with-flowers-outdoors_23-2150752804.jpg?size=626&ext=jpg",
      "title": "Photo 4",
      "caption": "Caption 4",
    },
    {
      "img":
      "https://img.freepik.com/free-photo/cute-kitten-walking-outdoors_23-2150752830.jpg?size=626&ext=jpg",
      "title": "Photo 5",
      "caption": "Caption 5",
    },
  ];
  var listItems = [
    {
      "img": "https://img.freepik.com/premium-photo/cat-bridge-forest_865967-105980.jpg?size=626&ext=jpg",
      "title": "Photo 1",
      "caption": "Description for Photo 1",
    },
    {
      "img":
      "https://img.freepik.com/premium-photo/cat-with-green-eyes-white-stripe-its-face_865967-105888.jpg?size=626&ext=jpg",
      "title": "Photo 2",
      "caption": "Description for Photo 2",
    },
    {
      "img":
      "https://img.freepik.com/free-photo/white-cat-garden_1150-43925.jpg?size=626&ext=jpg&ga=GA1.2.1046328686.1694962208&semt=ais",
      "title": "Photo 2",
      "caption": "Description for Photo 3",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Welcome to My Photo Gallery!",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Search for photos",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: myItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  MySnackBar(myItems[index]['title'], context);
                },
                child: Column(
                  children: [
                    Card(
                      elevation: 0.0,
                      margin: EdgeInsets.all(14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            myItems[index]['img']!,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            myItems[index]['title']!,
                            style: TextStyle(
                              fontSize: 8.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(

            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network( listItems[index]['img']!,
                  fit: BoxFit.fill,), // You can customize the leading icon
                title: Text(listItems[index]['title']!),
                subtitle: Text(listItems[index]['caption']!), // Optional subtitle
                onTap: () {
                  // Handle item tap here
                  //print("Tapped on ${items[index]}");
                },


              );
            },
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: FloatingActionButton(
            onPressed: () {
              MySnackBar("Photos Uploaded Successfully!", context);
            },
            child: Icon(Icons.upload),

          ),

        ),
        SizedBox(height: 40.0),

      ],
    );
  }
}
