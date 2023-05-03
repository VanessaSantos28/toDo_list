import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/notifier/default_listener_notifier.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_logo.dart';
import 'package:todo_list_provider/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final defaultListener = DefaultListenerNotifier(
        changeNotifier: context.read<RegisterController>());
    defaultListener.listener(
        context: context,
        sucessCallback: (notifier, listenerInstance) {
          listenerInstance.dispose();
          Navigator.of(context).pop();
        });
    // errorCallback: (notifier, listenerInstance) {
    //   print('houve um erro');
    // });
    // context.read<RegisterController>().addListener(() {
    //   final controller = context.read<RegisterController>();
    //   var sucess = controller.sucess;
    //   var error = controller.error;
    //   if (sucess) {
    //     Navigator.of(context).pop();
    //   } else if (error != null && error.isNotEmpty) {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text(error),
    //       backgroundColor: Colors.red,
    //     ));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(fontSize: 10, color: context.primaryColor),
            ),
            Text(
              'Cadastro',
              style: TextStyle(fontSize: 15, color: context.primaryColor),
            )
          ],
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(Icons.arrow_back_ios_outlined,
                  size: 20, color: context.primaryColor),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * .5,
            child: const FittedBox(
              fit: BoxFit.fitHeight,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: TodoListLogo(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TodoListField(
                        label: 'E-mail',
                        controller: _emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('E-mail obrigatório'),
                          Validatorless.email('E-mail inválido'),
                        ])),
                    const SizedBox(height: 20),
                    TodoListField(
                      label: 'Senha',
                      controller: _passwordEC,
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha obrigatório'),
                        Validatorless.min(
                            6, 'Senha deve ter pelo menos 6 caracteres'),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TodoListField(
                      label: 'Confirma Senha',
                      controller: _confirmPasswordEC,
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Confirma senha obrigatório'),
                        Validatorless.compare(
                            _passwordEC, 'Senha diferente de confirma senha')
                      ]),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            var email = _emailEC.text;
                            var password = _passwordEC.text;
                            context
                                .read<RegisterController>()
                                .registerUser(email, password);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Salvar'),
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
