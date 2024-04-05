import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedLanguage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app language',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: (){

          },
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                Radio<int>(
                  value: 0,
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage=value!;
                    });
                    
                  },
                ),
                Text('english',
                style: TextStyle(color: Colors.white),),
                 Radio<int>(
                  value: 1,
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage=value!;
                    });
                    
                  },
                ),
                Text('spanish',
                style: TextStyle(color: Colors.white),),
                 Radio<int>(
                  value: 2,
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage=value!;
                    });
                    
                  },
                ),
                Text('french',
                style: TextStyle(color: Colors.white),),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: (){
                  
                    },
                    child: Text('back'),
                  ),
                ),
        ],




      ),
      
      
      backgroundColor: Colors.black,
      
      
     
      
    );
  }
}