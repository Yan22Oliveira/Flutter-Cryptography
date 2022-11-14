import 'package:flutter/material.dart';

import '../security/security.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _security = ImplementationSecurity(cryptographyAdapter: CryptographyAdapter());

  String encrypted = '';
  String decrypted = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptography'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Texto para criptografar:',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 24,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Texto',
                  isDense: true,
                ),
                onChanged: (text){
                  setState(() {
                    if(text.isNotEmpty){
                      encrypted = _security.encrypt(text);
                      decrypted = _security.decrypt(encrypted);
                    }else{
                      encrypted = '';
                      decrypted = '';
                    }
                  });
                },
              ),
              const SizedBox(height: 60,),

              Text(
                'Criptografia:',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8,),
              Text(
                encrypted,
                style: Theme.of(context).textTheme.button,
              ),

              const SizedBox(height: 24,),
              Text(
                'Descriptografia:',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8,),
              Text(
                decrypted,
                style: Theme.of(context).textTheme.button,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
