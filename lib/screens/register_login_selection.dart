import 'package:flutter/material.dart';

class AuthSelectionScreen extends StatelessWidget {
  const AuthSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      body: SafeArea(
        child: isMobile
            ? Column(
                children: [
                  // Top panel
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    color: const Color(0xffd5d1bf),
                    child: Center(
                      child: Text(
                        'One Step',
                        style: TextStyle(
                          fontFamily: 'JetBrainsMono Nerd Font',
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1d2528),
                        ),
                      ),
                    ),
                  ),

                  // Bottom panel
                  Expanded(
                    child: Container(
                      color: const Color(0xff1d2528),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildActionButton(
                                context: context,
                                label: 'Login',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                              ),
                              const SizedBox(height: 24),
                              _buildActionButton(
                                context: context,
                                label: 'Register',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  // Left panel
                  Container(
                    width: screenWidth * 0.4,
                    color: const Color(0xffd5d1bf),
                    child: Center(
                      child: Text(
                        'One Step',
                        style: TextStyle(
                          fontFamily: 'JetBrainsMono Nerd Font',
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1d2528),
                        ),
                      ),
                    ),
                  ),

                  // Right panel
                  Expanded(
                    child: Container(
                      color: const Color(0xff1d2528),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildActionButton(
                              context: context,
                              label: 'Login',
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                            ),
                            const SizedBox(height: 32),
                            _buildActionButton(
                              context: context,
                              label: 'Register',
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffd9f316),
          foregroundColor: const Color(0xff1d2528),
          textStyle: TextStyle(
            fontFamily: 'JetBrainsMono Nerd Font',
            fontStyle: FontStyle.italic,
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.w300,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 32 : 48,
            vertical: isMobile ? 16 : 20,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
