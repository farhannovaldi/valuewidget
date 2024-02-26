import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum SearchType {
  mobil,
  motor,
  pesawat,
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Value Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isChecked = false;
  SearchType _searchType = SearchType.mobil;
  double _sliderValue = 50.0;
  String _selectedItem = 'Mobil';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Icon(Icons.cake, color: Color.fromARGB(255, 0, 0, 0)),
            SizedBox(width: 4),
            Text("Just Try"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image.asset(
                        'assets/images/sda.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image.network(
                        'https://th.bing.com/th/id/OIP.8ielmYhWS_UhXJc2ieeYBAHaNK?rs=1&pid=ImgDetMain',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: '@yourmail.com',
                    icon: Icon(Icons.contact_mail),
                  ),
                  onChanged: (value) {},
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.password),
                  ),
                ),
                CheckboxListTile(
                  title: const Text('Are you human?'),
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text('Pilih Kendaraan Anda :'),
                Row(
                  children: <Widget>[
                    Radio<SearchType>(
                      groupValue: _searchType,
                      value: SearchType.mobil,
                      onChanged: (SearchType? val) {
                        setState(() {
                          _searchType = val!;
                        });
                      },
                    ),
                    const Text('Mobil'),
                    Radio<SearchType>(
                      groupValue: _searchType,
                      value: SearchType.motor,
                      onChanged: (SearchType? val) {
                        setState(() {
                          _searchType = val!;
                        });
                      },
                    ),
                    const Text('Motor'),
                    Radio<SearchType>(
                      groupValue: _searchType,
                      value: SearchType.pesawat,
                      onChanged: (SearchType? val) {
                        setState(() {
                          _searchType = val!;
                        });
                      },
                    ),
                    const Text('Pesawat'),
                  ],
                ),
                SizedBox(height: 16),
                Text('Pilih Opsi Kendaraan:'),
                DropdownButton<String>(
                  value: _selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue!;
                    });
                  },
                  items: <String>['Mobil', 'Motor', 'Pesawat', 'Kapal']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                Slider(
                  value: _sliderValue,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  min: 0.0,
                  max: 100.0,
                  divisions: 100,
                  label: 'Tingkat Kepuasan: $_sliderValue',
                ),
                TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: 'Kirim pesan disini',
                    icon: Icon(Icons.send),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text!';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String message = messageController.text;
                        // Lakukan sesuatu dengan nilai pesan (message)
                        print('Message: $message');
                        messageController.clear();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
