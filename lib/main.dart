import 'package:flutter/material.dart';

void main() {
  runApp(const SteakHouseApp());
}

class SteakHouseApp extends StatelessWidget {
  const SteakHouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Curva superior
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                height: 120,
                color: const Color(0xFF990000),
              ),
            ),
          ),
          // Curva inferior
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                height: 80,
                color: const Color(0xFF990000),
              ),
            ),
          ),
          // Contenido centrado
          Center(
            child: SizedBox(
              height: screenHeight * 0.88,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LOGO + HERRAMIENTA
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage('assets/logo.png'),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.build, size: 25, color: Colors.black),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: _userController,
                    icon: Icons.person,
                    hintText: "Usuario",
                  ),
                  const SizedBox(height: 10),
                  _buildTextField(
                    controller: _passwordController,
                    icon: Icons.lock,
                    hintText: "Contraseña",
                    obscureText: true,
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (val) {
                            setState(() {
                              rememberMe = val!;
                            });
                          },
                          activeColor: const Color(0xFF990000),
                        ),
                        const Text("Recuérdame"),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "¿Olvidaste tu contraseña?",
                            style: TextStyle(color: Color(0xFF990000)),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),

                  // BOTÓN ROJO LETRAS BLANCAS
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF990000),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                    ),
                    child: const Text(
                      "Iniciar Sesión",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Text("Otras maneras de iniciar sesión"),
                  const SizedBox(height: 10),

                  // ICONOS REDES SOCIALES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(
                          icon: Icons.facebook, color: Color(0xFF1877F2)),
                      const SizedBox(width: 15),
                      _buildSocialIcon(
                          icon: Icons.g_mobiledata, color: Color(0xFFDB4437)),
                      const SizedBox(width: 15),
                      _buildSocialIcon(icon: Icons.close, color: Colors.black),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // REGISTRO
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("¿No tienes una cuenta? "),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Regístrate",
                          style: TextStyle(
                            color: Color(0xFF990000),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF990000), width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF990000), width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon({required IconData icon, required Color color}) {
    return Container(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 80);
    path.quadraticBezierTo(size.width * 0.25, 110, size.width * 0.5, 90);
    path.quadraticBezierTo(size.width * 0.75, 60, size.width, 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.25, 40, size.width * 0.5, 20);
    path.quadraticBezierTo(size.width * 0.75, -10, size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
