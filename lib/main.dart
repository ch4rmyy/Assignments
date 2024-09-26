import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello and Welcome to My Profile!'),
          //centerTitle: false,
        ),
        body: SafeArea(
          //padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile section
              Container(
                padding: EdgeInsets.all(15.0),
                
                child: Row(
                  children: [
                    // Profile Picture
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/pic.jpg'),
                    ),
                    SizedBox(width: 16),
                    // Name
                    Text('Charmie B. Continente',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ),

            SizedBox(height: 24,),
            
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              _buildInfoRow(Icons.email, 'Email', 'charmie.continente@wvsu.edu.ph'),
              _buildInfoRow(Icons.phone, 'Phone', '+63 958 182 1686'),
              _buildInfoRow(Icons.location_on, 'Address', 'Brgy. Jelicuon Lusaya, Cabatuan, Iloilo'),
              _buildInfoRow(Icons.brush, 'Hobbies', 'Sketching, Painting, Playing Minecraft, Watching K-Drama, '),
              _buildInfoRow(Icons.work, 'Profession', 'Student'),
              _buildInfoRow(Icons.computer, 'Course', 'Bachelor of Science in Information Technology'),
              _buildInfoRow(Icons.school, 'School', 'West Visayas State University (Main Campus)'),
                ],
              )
            ),

            SizedBox(height: 15),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [          
                Text('My Biography',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                )
             
                ]
              ),
              ),

              Container(
              padding: EdgeInsets.only(left: 60, top: 10, right: 25, bottom: 20),
              child: Column(
                children: [          
                Text(
                'I am presently in my third year of studies at West Visayas State University. Currently, I am studying Software Technology in order to create better websites and apps in the future. I developed an interest in software development after presenting my first website in my first year. I recall the exhilarating sensation of showcasing a website I created, while I remember back then I was just exploring websites and pondering their creation process. I also like animals, especially dogs, I have 3 dogs and they always give me the warmest welcome home whenever I arrive. I also love the paintings by Mr. Van Gogh, specifically the The Starry Night, Starry Night over the Rhone, and Irises. I also like coffee every morning. These are generally my life everyday, pursuing my dream with a cup of coffee together with my warm little companions cheering me up every day. Sketching and appreciating artworks online or in real-life which helps me relieve my stress.',
                style: TextStyle(fontSize: 13),
                )
                ]
              ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Function to build each row with icon, label, and value
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 30)),
          Icon(icon, size: 25),
          //SizedBox(width: 16),
          Padding(padding:EdgeInsets.only(left: 20)),
          Text(     
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Flexible(
          Padding(padding:EdgeInsets.only(left: 50)),
          Text(
           value,
             style: TextStyle(fontSize: 16),
          ),
          // Padding(padding:EdgeInsets.all(15))
         // ),
        ],
      ),
    );
  }
}
