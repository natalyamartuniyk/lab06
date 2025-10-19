import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Реєстрація'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Ім'я користувача",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                labelText: 'Логін (E-mail)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Пароль',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final login = _loginController.text;
                final password = _passwordController.text;

                if (name.isEmpty || login.isEmpty || password.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Помилка'),
                      content: const Text('Будь ласка, заповніть всі поля'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Успіх!'),
                      content: Text('Акаунт для $name створено!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                            Navigator.pop(context);
                          },
                          child: const Text('Чудово!'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Зареєструватися'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Повернутися до авторизації'),
            ),
          ],
        ),
      ),
    );
  }
}