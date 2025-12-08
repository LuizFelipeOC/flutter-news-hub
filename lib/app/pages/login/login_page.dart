import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 18),

              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text('Cancelar'),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                height: 220,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/login_image.svg',
                    fit: BoxFit.contain,
                    height: 180,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Text(
                'Entrar',
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),

              const SizedBox(height: 8),

              Text(
                'Acesse sua conta para comentar e discurtir sobre as notícias com a comunidade.',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: 18),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Informe seu email';
                        if (!RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$").hasMatch(value)) {
                          return 'Email inválido';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Informe sua senha';
                        if (value.length < 6) return 'Senha muito curta';
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Login button
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Placeholder login action
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login realizado (placeholder)')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Entrar'),
                ),
              ),

              const SizedBox(height: 12),

              // Footer actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Esqueci minha senha')),
                  TextButton(onPressed: () {}, child: const Text('Criar conta')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
