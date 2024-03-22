import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "W E L C O M E",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blue[100],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Center(
          child: ListView(
            children: [
              SizedBox(height: 50),
              Icon(
                Icons.account_circle_outlined,
                size: 150,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              SizedBox(height: 80),
              Divider(
                color: Theme.of(context).colorScheme.tertiary,
                thickness: 0.4,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 25,
                    ),
                    title: Text(
                      "P R O F I L E",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.people,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 25,
                    ),
                    title: Text(
                      "U S E R",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.settings,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 25,
                    ),
                    title: Text(
                      "S E T T I N G",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 200),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.logout_rounded,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 25,
                ),
                title: Text(
                  "L O G O U T",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:30),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.orange[100],
              border: Border.all(color: Colors.purple,width: 1)),
              margin:EdgeInsets.only(left: 20,right:20),
              height: 150,
              width:350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, 
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,
                    border: Border.all(color:Colors.black,width: 1)),
                    margin: EdgeInsets.only(left:10,top:30,bottom: 30,),
                    width: 150,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10, ),
                          Container(
                            padding: EdgeInsets.only(left:0,right:20),
                            child: Text(
                              'telePharmacy',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left:10,right:10,top:8),
                            child: Text(
                              'no:29, Ganeshan street, pilaiyar nagar,TamilNadu',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),                                                  
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/chatbox');
        },
        child: Icon(Icons.chat_outlined),
        backgroundColor: Colors.blue[200],
      ),
    );
  }
}
