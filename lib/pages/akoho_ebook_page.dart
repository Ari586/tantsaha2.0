import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

/// Page eBook pour les guides AkohoTech
/// Affiche les guides de volailles en format livre similaire à Voly
class AkohoEbookPage extends StatefulWidget {
  final List<Map<String, dynamic>> guides;
  final String initialGuideTitle;

  const AkohoEbookPage({
    super.key,
    required this.guides,
    required this.initialGuideTitle,
  });

  @override
  State<AkohoEbookPage> createState() => _AkohoEbookPageState();
}

class _AkohoEbookPageState extends State<AkohoEbookPage> {
  late String _selectedGuide;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedGuide = widget.initialGuideTitle;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Map<String, dynamic> get currentGuide {
    return widget.guides.firstWhere(
      (g) => g['title'] == _selectedGuide,
      orElse: () => widget.guides.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    final guide = currentGuide;
    final guideIndex = widget.guides.indexOf(guide);
    final totalGuides = widget.guides.length;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header - Book style
            _buildBookHeader(guideIndex, totalGuides),
            
            // Main content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Chapter header
                    _buildChapterHeader(guide),
                    const SizedBox(height: 32),
                    
                    // Overview
                    _buildSection('Fintinana', _buildOverviewContent(guide)),
                    const SizedBox(height: 28),
                    
                    // Steps (sections détaillées)
                    _buildSection('Torolalana Feno', _buildStepsContent(guide)),
                    const SizedBox(height: 28),
                    
                    // Feeding guide
                    if (guide.containsKey('feed'))
                      _buildSection('Sakafo sy Fatra', _buildFeedContent(guide)),
                    const SizedBox(height: 28),
                    
                    // Timeline
                    if (guide.containsKey('timeline'))
                      _buildSection('Dingana sy Fotoana', _buildTimelineContent(guide)),
                    const SizedBox(height: 28),
                    
                    // Health tips (if available)
                    if (guide.containsKey('health'))
                      _buildSection('Fahasalamana & Tips', _buildHealthContent(guide)),
                  ],
                ),
              ),
            ),
            
            // Navigation footer
            _buildNavigationFooter(guideIndex, totalGuides),
          ],
        ),
      ),
    );
  }

  Widget _buildBookHeader(int currentIndex, int total) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5EFE7),
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFF2C1810).withValues(alpha: 0.1),
            width: 2,
          ),
        ),
      ),
      child: Column(
        children: [
          // Title
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF2C1810)),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Text(
                  'Bokin\'ny Fiompiana',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF2C1810),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 48), // Balance the back button
            ],
          ),
          const SizedBox(height: 8),
          
          // Page indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Toko ${currentIndex + 1}',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF5D4E37),
                ),
              ),
              Text(
                ' / ',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF5D4E37),
                ),
              ),
              Text(
                '$total',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF5D4E37),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Progress dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              total > 10 ? 10 : total,
              (index) {
                final actualIndex = total > 10
                    ? (currentIndex / (total / 10)).floor().clamp(0, 9)
                    : index;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: currentIndex == index || (total > 10 && actualIndex == index) ? 8 : 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: currentIndex == index || (total > 10 && actualIndex == index)
                        ? const Color(0xFF8B7355)
                        : const Color(0xFFD4C4B0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChapterHeader(Map<String, dynamic> guide) {
    final emoji = guide['emoji'] as String? ?? '🐔';
    final title = guide['title'] as String? ?? '';
    final subtitle = guide['subtitle'] as String? ?? '';
    
    return Column(
      children: [
        // Decorative line top
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: const Color(0xFF2C1810).withValues(alpha: 0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '✦',
                style: TextStyle(
                  color: const Color(0xFF8B7355),
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: const Color(0xFF2C1810).withValues(alpha: 0.2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        
        // Emoji
        Text(
          emoji,
          style: const TextStyle(fontSize: 64),
        ),
        const SizedBox(height: 16),
        
        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF2C1810),
            letterSpacing: 0.5,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        
        // Subtitle
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF5D4E37),
            fontStyle: FontStyle.italic,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),
        
        // Decorative line bottom
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: const Color(0xFF2C1810).withValues(alpha: 0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '✦',
                style: TextStyle(
                  color: const Color(0xFF8B7355),
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: const Color(0xFF2C1810).withValues(alpha: 0.2),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Container(
          padding: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: const Color(0xFF8B7355).withValues(alpha: 0.3),
                width: 2,
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFF8B7355),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2C1810),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        content,
      ],
    );
  }

  Widget _buildOverviewContent(Map<String, dynamic> guide) {
    final badges = guide['badges'] as List<dynamic>? ?? [];
    
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: badges.map((badge) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF5EFE7),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF8B7355).withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
          child: Text(
            badge.toString(),
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF2C1810),
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStepsContent(Map<String, dynamic> guide) {
    final steps = guide['steps'] as List<dynamic>? ?? [];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: steps.asMap().entries.map((entry) {
        final index = entry.key;
        final step = entry.value as Map<String, dynamic>;
        final stepTitle = step['title'] as String? ?? '';
        final points = step['points'] as List<dynamic>? ?? [];
        
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF8B7355).withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step header
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B7355),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      stepTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2C1810),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              
              // Step points
              ...points.map((point) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '•',
                        style: TextStyle(
                          color: Color(0xFF8B7355),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          point.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xFF2C1810),
                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFeedContent(Map<String, dynamic> guide) {
    final feed = guide['feed'] as List<dynamic>? ?? [];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: feed.map((item) {
        final feedItem = item as Map<String, dynamic>;
        final label = feedItem['label'] as String? ?? '';
        final value = feedItem['value'] as String? ?? '';
        
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8F0),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFE8D5C4),
              width: 1.5,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B7355),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF2C1810),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimelineContent(Map<String, dynamic> guide) {
    final timeline = guide['timeline'] as List<dynamic>? ?? [];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: timeline.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value as Map<String, dynamic>;
        final label = item['label'] as String? ?? '';
        final value = item['value'] as String? ?? '';
        final isLast = index == timeline.length - 1;
        
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B7355),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 50,
                    color: const Color(0xFF8B7355).withValues(alpha: 0.3),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            
            // Timeline content
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF8B7355),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF2C1810),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildHealthContent(Map<String, dynamic> guide) {
    final health = guide['health'] as List<dynamic>? ?? [];
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4E6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE8B951).withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: health.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value as Map<String, dynamic>;
          final label = item['label'] as String? ?? '';
          final value = item['value'] as String? ?? '';
          
          return Padding(
            padding: EdgeInsets.only(bottom: index < health.length - 1 ? 12 : 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '💡',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (label.isNotEmpty)
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2C1810),
                          ),
                        ),
                      if (label.isNotEmpty) const SizedBox(height: 4),
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color(0xFF2C1810),
                          height: 1.6,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNavigationFooter(int currentIndex, int total) {
    final hasPrevious = currentIndex > 0;
    final hasNext = currentIndex < total - 1;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous button
          if (hasPrevious)
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _selectedGuide = widget.guides[currentIndex - 1]['title'];
                });
              },
              icon: const Icon(Icons.arrow_back, size: 18),
              label: const Text('Teo aloha'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B7355),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            )
          else
            const SizedBox(),
          
          // Next button
          if (hasNext)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedGuide = widget.guides[currentIndex + 1]['title'];
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B7355),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Manaraka'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
