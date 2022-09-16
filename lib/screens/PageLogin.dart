import 'package:flutter/material.dart';
import 'package:meucredito/screens/PageHome.dart';

import '../controller/Controller.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  static final loginController = TextEditingController();
  static final senhaController = TextEditingController();

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {

    Size _windowSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode()); //funciona
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: _windowSize.width,
            height: _windowSize.height,
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(
                  minWidth: 300,
                  minHeight: 500
              ),
              width: _windowSize.width * 0.8,
              height: _windowSize.height * 0.5,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(
                    'assets/images/money.png',
                    width: _windowSize.width * 0.5,
                    height: 100,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    controller: PageLogin.loginController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.fromLTRB(10, 25, 25, 0),
                        labelText: 'Login',
                        labelStyle: const TextStyle(
                            color: Colors.green
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.green,
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0
                            ),
                            borderRadius: BorderRadius.circular(6)
                        ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 0
                          ),
                          borderRadius: BorderRadius.circular(6)
                      )
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    controller: PageLogin.senhaController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(10, 25, 25, 0),
                      labelText: 'Senha',
                      labelStyle: const TextStyle(
                          color: Colors.green
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.green,
                            width: 1
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0
                        ),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 0
                          ),
                          borderRadius: BorderRadius.circular(6)
                      )
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  InkWell(
                    onTap: () async {

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => const PageHome()),
                          ModalRoute.withName('/')
                      );
                      
                      // String retorno = await Controller.postLogin(PageLogin.loginController.text, PageLogin.senhaController.text);
                      //
                      // if(retorno == 'true'){
                      //
                      //
                      //
                      // } else if(retorno == 'catch'){
                      //
                      // } else {
                      //
                      // }

                    },
                    child: Container(
                      width: _windowSize.width * 0.7,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Entrar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
