// lib/splash.dart - Complete EchoChat Onboarding (Single File)
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const EchoChatApp());
}

class EchoChatApp extends StatelessWidget {
  const EchoChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EchoChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'PlusJakartaSans',
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0b1326),
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _mouseMoveController;
  int _currentPage = 1;
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> pages = [
    {
      'title': 'Moment-Based\nSharing',
      'subtitle': 'Share moments that fade naturally,\nleaving only the best memories.',
      'bubbles': [
        {'text': 'Just had the best coffee ☕', 'type': 'inbound', 'top': 20.0, 'left': 30.0, 'right': null, 'active': false},
        {'text': 'Same! The aroma was unreal', 'type': 'outbound', 'top': 70.0, 'left': null, 'right': 20.0, 'active': false},
        {'text': 'Your moment is now preserved', 'type': 'inbound', 'top': 130.0, 'left': 50.0, 'right': null, 'active': true},
      ],
    },
    {
      'title': 'EchoChat –\nChats with memory',
      'subtitle': 'Your conversations evolve with you,\nremembering what matters most.',
      'bubbles': [
        {'text': 'Remember our trip to the coast?', 'type': 'inbound', 'top': 20.0, 'left': 30.0, 'right': null, 'active': false},
        {'text': 'The one with the neon sunset!', 'type': 'outbound', 'top': 70.0, 'left': null, 'right': 20.0, 'active': false},
        {'text': 'EchoChat recalls your favorite spots. Ready to go back?', 'type': 'inbound', 'top': 130.0, 'left': 30.0, 'right': null, 'active': true},
      ],
    },
    {
      'title': 'Your Feed,\nYour Rhythm',
      'subtitle': 'Customize how you consume content —\nfast, slow, or in the zone.',
      'bubbles': [
        {'text': 'Slow mode engaged 📖', 'type': 'inbound', 'top': 20.0, 'left': 30.0, 'right': null, 'active': false},
        {'text': 'Deep reading activated', 'type': 'outbound', 'top': 70.0, 'left': null, 'right': 20.0, 'active': false},
        {'text': 'Set your pace. We\'ll handle the rest.', 'type': 'inbound', 'top': 130.0, 'left': 30.0, 'right': null, 'active': true},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _mouseMoveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..repeat();
  }

  @override
  void dispose() {
    _mouseMoveController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to next screen (auth or home)
      debugPrint('Navigate to Auth/Home screen');
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Animated Wave Background
            _WaveBackground(controller: _mouseMoveController),
            
            // Main Content
            SafeArea(
              child: Column(
                children: [
                  // Top Navigation Bar
                  _buildTopBar(),
                  
                  // Page View
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: pages.length,
                      itemBuilder: (context, index) {
                        return _buildPageContent(pages[index]);
                      },
                    ),
                  ),
                  
                  // Bottom Navigation
                  _buildBottomNavigation(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.bubble_chart,
                color: Color(0xFF3cddc7),
                size: 28,
              ),
              const SizedBox(width: 8),
              const Text(
                'EchoChat',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3cddc7),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              debugPrint('Skip to Auth/Home');
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3cddc7),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent(Map<String, dynamic> pageData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Bubbles Container
        SizedBox(
          height: 300,
          child: Stack(
            children: (pageData['bubbles'] as List).map((bubble) {
              return Positioned(
                top: bubble['top'],
                left: bubble['left'],
                right: bubble['right'],
                child: _AnimatedBubble(
                  text: bubble['text'],
                  type: bubble['type'],
                  isActive: bubble['active'],
                  delay: bubble['top'] as double,
                ),
              );
            }).toList(),
          ),
        ),
        
        const SizedBox(height: 40),
        
        // Text Content
        Container(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            children: [
              Text(
                pageData['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.02,
                  color: Color(0xFFdae2fd),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                pageData['subtitle'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF908fa0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Page Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pages.length, (index) {
              final isActive = index == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive 
                      ? const Color(0xFF3cddc7) 
                      : const Color(0xFF464554).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          
          const SizedBox(height: 16),
          
          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button
              GestureDetector(
                onTap: _previousPage,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.12),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.06),
                        Colors.white.withOpacity(0.03),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFFdae2fd),
                    ),
                  ),
                ),
              ),
              
              // Continue Button
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    onTap: _nextPage,
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFddb7ff), Color(0xFF3cddc7)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF3cddc7).withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentPage == pages.length - 1 ? 'Get Started' : 'Continue',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2c0051),
                            ),
                          ),
                                          const SizedBox(width: 8),
                          const Icon(
                            Icons.east,
                            color: Color(0xFF2c0051),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Animated Bubble Widget
class _AnimatedBubble extends StatefulWidget {
  final String text;
  final String type;
  final bool isActive;
  final double delay;

  const _AnimatedBubble({
    required this.text,
    required this.type,
    required this.isActive,
    required this.delay,
  });

  @override
  State<_AnimatedBubble> createState() => _AnimatedBubbleState();
}

class _AnimatedBubbleState extends State<_AnimatedBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10),
    );
    
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    
    // Start animation after delay
    Future.delayed(Duration(milliseconds: widget.delay.toInt()), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isOutbound = widget.type == 'outbound';
    
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Transform.scale(
                scale: _isPressed ? 0.98 : 1.0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  constraints: const BoxConstraints(minWidth: 120, maxWidth: 200),
                  decoration: BoxDecoration(
                    color: isOutbound
                        ? const Color(0xFF6f00be).withOpacity(0.15)
                        : const Color(0xFF131b2e).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(widget.isActive ? 32 : 24),
                    border: Border.all(
                      color: isOutbound
                          ? const Color(0xFFddb7ff).withOpacity(0.2)
                          : Colors.white.withOpacity(0.08),
                    ),
                    boxShadow: widget.isActive
                        ? [
                            BoxShadow(
                              color: const Color(0xFF3cddc7).withOpacity(0.1),
                              blurRadius: 40,
                              spreadRadius: 5,
                            ),
                          ]
                        : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text,
                        style: TextStyle(
                          fontSize: widget.isActive ? 14 : 13,
                          fontWeight: widget.isActive ? FontWeight.w500 : FontWeight.w400,
                          color: widget.isActive
                              ? const Color(0xFFdae2fd)
                              : const Color(0xFFc7c4d7),
                        ),
                      ),
                      if (widget.isActive) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.memory,
                              color: Color(0xFF3cddc7),
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Active Recall',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Color(0xFF3cddc7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Animated Wave Background
class _WaveBackground extends StatefulWidget {
  final AnimationController controller;

  const _WaveBackground({required this.controller});

  @override
  State<_WaveBackground> createState() => _WaveBackgroundState();
}

class _WaveBackgroundState extends State<_WaveBackground>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _wave1Animation;
  late Animation<Offset> _wave2Animation;

  @override
  void initState() {
    super.initState();
    
    _wave1Animation = Tween<Offset>(
      begin: const Offset(-0.1, -0.1),
      end: const Offset(0.1, 0.1),
    ).animate(CurvedAnimation(
      parent: widget.controller,
      curve: Curves.linear,
    ));
    
    _wave2Animation = Tween<Offset>(
      begin: const Offset(0.1, 0.1),
      end: const Offset(-0.1, -0.1),
    ).animate(CurvedAnimation(
      parent: widget.controller,
      curve: Curves.linear,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Container(
      color: const Color(0xFF0b1326),
      child: Stack(
        children: [
          // Radial gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.8,
                colors: [
                  Color(0xFF131b2e),
                  Color(0xFF0b1326),
                ],
                stops: [0, 1],
              ),
            ),
          ),
          
          // Wave 1 - Tertiary color
          AnimatedBuilder(
            animation: _wave1Animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  _wave1Animation.value.dx * size.width,
                  _wave1Animation.value.dy * size.height,
                ),
                child: Transform.rotate(
                  angle: _wave1Animation.value.dx * pi,
                  child: Container(
                    width: size.width * 2,
                    height: size.height * 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const RadialGradient(
                        center: Alignment.topLeft,
                        radius: 1,
                        colors: [
                          Color(0xFF3cddc7),
                          Colors.transparent,
                        ],
                        stops: [0, 0.5],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          
          // Wave 2 - Secondary color
          AnimatedBuilder(
            animation: _wave2Animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  _wave2Animation.value.dx * size.width,
                  _wave2Animation.value.dy * size.height,
                ),
                child: Transform.rotate(
                  angle: _wave2Animation.value.dx * pi,
                  child: Container(
                    width: size.width * 2,
                    height: size.height * 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const RadialGradient(
                        center: Alignment.bottomRight,
                        radius: 1,
                        colors: [
                          Color(0xFFddb7ff),
                          Colors.transparent,
                        ],
                        stops: [0, 0.5],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}