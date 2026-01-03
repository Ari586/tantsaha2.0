import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CarpeCommunePageFlutter extends StatefulWidget {
  const CarpeCommunePageFlutter({super.key});

  @override
  State<CarpeCommunePageFlutter> createState() => _CarpeCommunePageFlutterState();
}

class _CarpeCommunePageFlutterState extends State<CarpeCommunePageFlutter> {
  final ScrollController _scrollController = ScrollController();
  
  // Simulator State
  String _selectedSpecies = 'royal';
  final List<String> _selectedSystems = [];
  final TextEditingController _surfaceController = TextEditingController();
  Map<String, dynamic>? _simulationResult;
  List<Map<String, dynamic>>? _comparisonResults;

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  final GlobalKey _guideKey = GlobalKey();
  final GlobalKey _simulatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF9), // stone-50
      appBar: AppBar(
        title: Text('Karpa (Royal, Commune, Chinoise)', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1C1917), // stone-900
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFDCFCE7), height: 1), // green-100
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeroSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -40),
                    child: _buildStatsStrip(),
                  ),
                  const SizedBox(height: 20),
                  _buildGuideSection(),
                  const SizedBox(height: 60),
                  _buildSimulatorSection(),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 40, bottom: 80, left: 24, right: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF166534), Color(0xFFCA8A04)], // green-800 to yellow-600
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            'Fiompiana Karpa',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          Text(
            'Royal, Commune & Sinoa',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFFDE047), // yellow-300
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Torolàlana feno momba ireo karazana Karpa sy ny fiompiana azy an-tanimbary na dobo.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFF0FDF4), // green-50
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => _scrollToSection(_guideKey),
                icon: const Icon(Icons.menu_book, color: Color(0xFF166534)), // green-800
                label: Text('Hamaky Torolàlana', style: TextStyle(color: const Color(0xFF166534), fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: const StadiumBorder(),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _scrollToSection(_simulatorKey),
                icon: const Icon(Icons.calculate, color: Colors.white),
                label: Text('Simulator', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF14532D).withValues(alpha: 0.4), // green-900/40
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Color(0xFF86EFAC)), // green-300
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsStrip() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        return Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            _buildStatCard(
              imagePath: 'assets/images/royale.png',
              fallbackIcon: Icons.star, // Crown icon replacement
              fallbackColor: const Color(0xFFCA8A04), // yellow-600
              fallbackBg: const Color(0xFFFEF9C3), // yellow-100
              borderColor: const Color(0xFFEAB308), // yellow-500
              title: 'Karpa Royal',
              subtitle: 'Be nofo, tsara tsena',
              isMobile: isMobile,
            ),
            if (!isMobile) const SizedBox(width: 16),
            if (isMobile) const SizedBox(height: 16),
            _buildStatCard(
              imagePath: 'assets/images/commune.png',
              fallbackIcon: Icons.shield,
              fallbackColor: const Color(0xFF16A34A), // green-600
              fallbackBg: const Color(0xFFDCFCE7), // green-100
              borderColor: const Color(0xFF16A34A), // green-600
              title: 'Rizi-pisciculture',
              subtitle: 'Vary + Trondro',
              isMobile: isMobile,
            ),
            if (!isMobile) const SizedBox(width: 16),
            if (isMobile) const SizedBox(height: 16),
            _buildStatCard(
              imagePath: 'assets/images/chinoise.png',
              fallbackIcon: Icons.eco, // Leaf icon replacement
              fallbackColor: const Color(0xFF2563EB), // blue-600
              fallbackBg: const Color(0xFFDBEAFE), // blue-100
              borderColor: const Color(0xFF3B82F6), // blue-500
              title: 'Karpa Sinoa',
              subtitle: 'Mpanadio, mpihinana ahitra',
              isMobile: isMobile,
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard({
    required String imagePath,
    required IconData fallbackIcon,
    required Color fallbackColor,
    required Color fallbackBg,
    required Color borderColor,
    required String title,
    required String subtitle,
    required bool isMobile,
  }) {
    Widget card = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
        border: Border(bottom: BorderSide(color: borderColor, width: 2)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: fallbackBg,
                    child: Icon(fallbackIcon, color: fallbackColor, size: 32),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1F2937), fontSize: 14)),
                Text(subtitle, style: TextStyle(color: const Color(0xFF6B7280), fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
    return isMobile ? card : Expanded(child: card);
  }

  Widget _buildGuideSection() {
    return Column(
      key: _guideKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 8, height: 40, decoration: BoxDecoration(color: const Color(0xFF16A34A), borderRadius: BorderRadius.circular(4))),
            const SizedBox(width: 16),
            Text('Teknika & Karazana', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
          ],
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                _buildFeatureCard(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 48) / 3 : (constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth),
                  icon: Icons.set_meal, // Fish icon replacement
                  iconColor: const Color(0xFFCA8A04), // yellow-600
                  iconBg: const Color(0xFFFEFCE8), // yellow-50
                  borderColor: const Color(0xFFFEF9C3), // yellow-100
                  title: '1. Karazana Telo Lehibe',
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mifidiana arakaraka ny tanjonao:', style: TextStyle(fontSize: 14, color: const Color(0xFF4B5563))),
                      const SizedBox(height: 12),
                      _buildSpeciesItem('Karpa Royal (Miroir)', 'Vitsy kirany, be hena, hoditra malemy. Ity no tena be mpitady sy tsara vidy indrindra.', Icons.star, const Color(0xFF854D0E), const Color(0xFFFEFCE8), const Color(0xFFFEF9C3)),
                      const SizedBox(height: 8),
                      _buildSpeciesItem('Karpa Commune (Tsotra)', 'Feno kirany, matanjaka be (rustique), mahatanty rano ratsy, fa kelikely kokoa ny nofony.', Icons.shield, const Color(0xFF44403C), const Color(0xFFFAFAF9), const Color(0xFFE7E5E4)),
                      const SizedBox(height: 8),
                      _buildSpeciesItem('Karpa Chinoise (Sinoa)', 'Amour Blanc (mpihinana ahitra) na Argentée. Tsara atao \'Polyculture\' hanadio dobo.', Icons.eco, const Color(0xFF166534), const Color(0xFFF0FDF4), const Color(0xFFDCFCE7)),
                    ],
                  ),
                ),
                _buildFeatureCard(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 48) / 3 : (constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth),
                  icon: Icons.water,
                  iconColor: const Color(0xFF16A34A), // green-600
                  iconBg: const Color(0xFFF0FDF4), // green-50
                  borderColor: const Color(0xFFDCFCE7), // green-100
                  title: '2. Rafitra Fiompiana',
                  content: Column(
                    children: [
                      _buildExpandableItem(
                        title: 'Rizi-pisciculture (An-tanimbary)',
                        color: const Color(0xFF166534), // green-800
                        bgColor: const Color(0xFFF0FDF4).withValues(alpha: 0.5),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Fomba malagasy tena mahomby.', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: const Color(0xFF4B5563))),
                            const SizedBox(height: 4),
                            _buildBulletPoint('Tombony: Ny trondro mihinana bibikely manimba vary + manome zezika (diky).', Colors.black, size: 12),
                            _buildBulletPoint('Fepetra: Mila hady (canal refuge) 50cm ny halaliny mba hiafenan\'ny trondro.', Colors.black, size: 12),
                            _buildBulletPoint('Densit: 1 isa / 2-3m².', Colors.black, size: 12),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildExpandableItem(
                        title: 'Dobo Tany (Etang Classique)',
                        color: const Color(0xFF292524), // stone-800
                        bgColor: const Color(0xFFF5F5F4), // stone-100
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ho an\'ny famokarana be kokoa.', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: const Color(0xFF4B5563))),
                            const SizedBox(height: 4),
                            _buildBulletPoint('Fotodrafitrasa: Dobo lalina (1m - 1.5m).', Colors.black, size: 12),
                            _buildBulletPoint('Isan\'ny trondro: 1-2 isa / m² (Extensif/Semi).', Colors.black, size: 12),
                            _buildBulletPoint('Fanamarihana: Ny karpa dia mikaroka sakafo any ambany rano (fouisseur), ka manabe fotaka ny rano.', Colors.black, size: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _buildFeatureCard(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 48) / 3 : (constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth),
                  icon: Icons.thermostat,
                  iconColor: const Color(0xFF2563EB), // blue-600
                  iconBg: const Color(0xFFEFF6FF), // blue-50
                  borderColor: const Color(0xFFDBEAFE), // blue-100
                  title: '3. Rano & Tontolo',
                  content: Column(
                    children: [
                      Text('Ny Karpa dia matanjaka noho ny Tilapia amin\'ny hatsiaka.', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: const Color(0xFF6B7280))),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFDBEAFE))),
                              child: Column(
                                children: [
                                  Text('18-28°C', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF1D4ED8))),
                                  Text('Hafanana Tsara', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF3B82F6))),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(color: const Color(0xFFFAFAF9), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE7E5E4))),
                              child: Column(
                                children: [
                                  Text('Ambany', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF44403C))),
                                  Text('Oxygène', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF78716C))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildBulletPoint('Mahatanty rano mangatsiaka (hatramin\'ny 4°C) fa tsy mitombo intsony.', const Color(0xFF60A5FA), size: 12, icon: Icons.ac_unit),
                      _buildBulletPoint('Mahatanty rano somary maloto sy misy fotaka.', const Color(0xFF60A5FA), size: 12, icon: Icons.water_drop),
                    ],
                  ),
                ),
                
                // Card 4: Sakafo (Full width on mobile/tablet, span 2 on large)
                Container(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 48) / 3 * 2 + 24 : constraints.maxWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFFFEDD5)), // orange-100
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF7ED), // orange-50
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                          border: Border(bottom: BorderSide(color: Color(0xFFFFEDD5))),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                              child: const Icon(Icons.restaurant, color: Color(0xFFEA580C)), // orange-600
                            ),
                            const SizedBox(width: 12),
                            Text('4. Sakafo (Omnivore)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: LayoutBuilder(
                          builder: (context, innerConstraints) {
                            return Flex(
                              direction: innerConstraints.maxWidth < 600 ? Axis.vertical : Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: innerConstraints.maxWidth < 600 ? 0 : 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF0FDF4).withValues(alpha: 0.5),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: const Color(0xFFDCFCE7)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          const Icon(Icons.eco, size: 16, color: Color(0xFF166534)),
                                          const SizedBox(width: 8),
                                          Text('Sakafo Natoraly', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF166534))),
                                        ]),
                                        const SizedBox(height: 8),
                                        Text('Ny karpa dia "Omnivore à tendance benthophage" (mihinana izay any ambany rano):', style: TextStyle(fontSize: 12, color: const Color(0xFF4B5563))),
                                        const SizedBox(height: 8),
                                        _buildBulletPoint('Kankana (Vers de terre/vase).', Colors.black, size: 12),
                                        _buildBulletPoint('Bibikely anaty rano (Larves).', Colors.black, size: 12),
                                        _buildBulletPoint('Ahitra sy fako organika (indrindra ny Karpa Sinoa).', Colors.black, size: 12),
                                      ],
                                    ),
                                  ),
                                ),
                                if (innerConstraints.maxWidth >= 600) const SizedBox(width: 24),
                                if (innerConstraints.maxWidth < 600) const SizedBox(height: 16),
                                Expanded(
                                  flex: innerConstraints.maxWidth < 600 ? 0 : 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFF7ED).withValues(alpha: 0.5),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: const Color(0xFFFFEDD5)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          const Icon(Icons.rice_bowl, size: 16, color: Color(0xFF9A3412)),
                                          const SizedBox(width: 8),
                                          Text('Sakafo Fanampiny', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF9A3412))),
                                        ]),
                                        const SizedBox(height: 8),
                                        Text('Mba hanafainganana ny fitomboana (indrindra ny Karpa Royal):', style: TextStyle(fontSize: 12, color: const Color(0xFF4B5563))),
                                        const SizedBox(height: 8),
                                        _buildBulletPoint('Sisa-bary (Bran de riz), Katsaka, Mangahazo maina.', Colors.black, size: 12),
                                        _buildBulletPoint('Zezika (Tain\'omby/akoho) hanamaroana ny bibikely kely.', Colors.black, size: 12),
                                        _buildBulletPoint('Fatra: Omeo amin\'ny toerana iray raikitra isan\'andro.', Colors.black, size: 12),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Card 5: Toekarena
                _buildFeatureCard(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 48) / 3 : constraints.maxWidth,
                  icon: Icons.monetization_on,
                  iconColor: const Color(0xFFCA8A04), // yellow-600
                  iconBg: const Color(0xFFFEFCE8), // yellow-50
                  borderColor: const Color(0xFFFEF9C3), // yellow-100
                  title: '5. Toekarena',
                  content: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: const Color(0xFFFEFCE8), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFFEF9C3))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('TSINGERINA FAMOKARANA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF854D0E))),
                            const SizedBox(height: 4),
                            Text('Lava kokoa: 8 - 12 volana vao mahatratra 500g+.', style: TextStyle(fontSize: 12, color: const Color(0xFF4B5563))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildBulletPoint('Lanja: Mahatratra 1kg mahery raha avela elaela.', const Color(0xFFEAB308), size: 12, icon: Icons.scale),
                      _buildBulletPoint('Vidiny: Lafo vidy ny Karpa Royal lehibe.', const Color(0xFFEAB308), size: 12, icon: Icons.savings),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required double width,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required Color borderColor,
    required String title,
    required Widget content,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(height: 16),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }

  Widget _buildSpeciesItem(String title, String desc, IconData icon, Color titleColor, Color bgColor, Color borderColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 12, color: titleColor),
              const SizedBox(width: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: titleColor, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 4),
          Text(desc, style: TextStyle(fontSize: 12, color: const Color(0xFF4B5563))),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text, Color iconColor, {double size = 14, IconData icon = Icons.check}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Icon(icon, size: 16, color: iconColor),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: TextStyle(fontSize: size, color: const Color(0xFF4B5563)))),
        ],
      ),
    );
  }

  Widget _buildExpandableItem({required String title, required Color color, required Color bgColor, required Widget content}) {
    return Container(
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 14)),
          childrenPadding: const EdgeInsets.all(12),
          children: [content],
        ),
      ),
    );
  }

  Widget _buildSimulatorSection() {
    return Container(
      key: _simulatorKey,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1917), // stone-900
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 25, offset: const Offset(0, 10))],
        border: Border(top: BorderSide(color: const Color(0xFF16A34A), width: 8)), // green-600
      ),
      child: Stack(
        children: [
          // Background pattern placeholder
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Container(color: Colors.black), // Placeholder for pattern
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF16A34A).withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF22C55E).withValues(alpha: 0.3)),
                  ),
                  child: Text('Simulator Karpa', style: TextStyle(color: const Color(0xFF86EFAC), fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                const SizedBox(height: 16),
                Text('Kajy & Fampitahana', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 16),
                Text('Safidio ny karazana trondro sy ny rafitra hanaovana kajy.', textAlign: TextAlign.center, style: TextStyle(color: const Color(0xFFA8A29E), fontWeight: FontWeight.w300)),
                const SizedBox(height: 40),
                
                // Form
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Step 1
                      Text('1. SAFIDIO NY KARAZANA', style: TextStyle(color: const Color(0xFFFACC15), fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.2)),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              _buildRadioOption('royal', 'Royal (Miroir)', 'Be hena, tsara vidy', Icons.star, constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 3 : constraints.maxWidth),
                              _buildRadioOption('commune', 'Commune (Tsotra)', 'Matanjaka, feno kirany', Icons.shield, constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 3 : constraints.maxWidth),
                              _buildRadioOption('chinoise', 'Sinoa (Chinoise)', 'Mpanadio, Herbivore', Icons.eco, constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 3 : constraints.maxWidth),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      const Divider(color: Colors.white10),
                      const SizedBox(height: 24),

                      // Step 2
                      Text('2. SAFIDIO NY RAFITRA (MAX 2)', style: TextStyle(color: const Color(0xFF4ADE80), fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.2)),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              _buildCheckboxOption('rizi', 'Rizi-pisciculture', 'An-tanimbary', Icons.grass, constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 3 : constraints.maxWidth),
                              _buildCheckboxOption('dobo', 'Dobo Tany', 'Extensif/Semi', Icons.water, constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 3 : constraints.maxWidth),
                              _buildCheckboxOption('cage', 'Cage', 'Semi-Intensif', Icons.grid_view, constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 3 : constraints.maxWidth),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      const Divider(color: Colors.white10),
                      const SizedBox(height: 24),

                      // Step 3
                      Text('3. VELARANA (M²)', style: TextStyle(color: const Color(0xFF4ADE80), fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.2)),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _surfaceController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF292524),
                          hintText: 'Ohatra: 500',
                          hintStyle: TextStyle(color: const Color(0xFF78716C)),
                          suffixText: 'm²',
                          suffixStyle: TextStyle(color: const Color(0xFFA8A29E), fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF16A34A), width: 2)),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Action Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _calculate,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            elevation: 0,
                          ).copyWith(
                            backgroundColor: MaterialStateProperty.resolveWith((states) => const Color(0xFF16A34A)), // Gradient approximation
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Manao Kajy & Mampitaha', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 12),
                              const Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Results
                if (_simulationResult != null || _comparisonResults != null)
                  _buildResults(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String value, String title, String subtitle, IconData icon, double width) {
    bool isSelected = _selectedSpecies == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedSpecies = value),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFEFCE8) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFFCA8A04) : Colors.transparent, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFFCA8A04) : const Color(0xFFA8A29E), size: 32),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1C1917))),
            Text(subtitle, style: TextStyle(fontSize: 12, color: const Color(0xFF78716C))),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxOption(String value, String title, String subtitle, IconData icon, double width) {
    bool isSelected = _selectedSystems.contains(value);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedSystems.remove(value);
          } else {
            if (_selectedSystems.length < 2) {
              _selectedSystems.add(value);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Azafady, rafitra roa (2) ihany no azo ampitahaina.')));
            }
          }
        });
      },
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0FDF4) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFF16A34A) : Colors.transparent, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFF16A34A) : const Color(0xFFA8A29E), size: 32),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1C1917))),
            Text(subtitle, style: TextStyle(fontSize: 12, color: const Color(0xFF78716C))),
          ],
        ),
      ),
    );
  }

  void _calculate() {
    if (_selectedSystems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Safidio aloha ny rafitra tianao hojerena (1 na 2).')));
      return;
    }
    double? surface = double.tryParse(_surfaceController.text);
    if (surface == null || surface <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Azafady, ampidiro ny velarana (m²) marina.')));
      return;
    }

    final systemsData = {
      'rizi': {
        'title': "Rizi-pisciculture (Tanimbary)",
        'description': "Fomba tsara indrindra ho an'ny tantsaha. Ny trondro dia miara-monina amin'ny vary.",
        'densityMin': 0.5, 'densityMax': 1, 'densityText': "0.5 - 1 isa / m²",
        'productionFactor': 0.300, 
        'timeFrame': "12 volana",
        'cost': "Ambany (Tsy mila dobo manokana)",
        'materials': "Hady (Canal refuge), Tany",
        'advice': ["Ataovy lalina (50cm) ny hady hialofan'ny trondro.", "Aza mampiasa pesticide amin'ny vary.", "Tombony roa: Vary + Trondro."]
      },
      'dobo': {
        'title': "Dobo Tany (Classique)",
        'description': "Dobo natokana ho an'ny Karpa. Lalina ary misy fotaka any ambany.",
        'densityMin': 1, 'densityMax': 2, 'densityText': "1 - 2 isa / m²",
        'productionFactor': 0.400,
        'timeFrame': "10-12 volana",
        'cost': "Antony (Zezika + Sakafo)",
        'materials': "Angady, Vam (Vanne)",
        'advice': ["Omeo zezika voajanahary matetika ny dobo.", "Ny karpa dia manetsiketsika fotaka, ka mety ho motraka ny rano.", "Tsara ny polyculture."]
      },
      'cage': {
        'title': "Cage (Semi-Intensif)",
        'description': "Mila sakafo feno (pellets) satria tsy mahazo sakafo avy amin'ny fotaka ny karpa.",
        'densityMin': 20, 'densityMax': 40, 'densityText': "20 - 40 isa / m³",
        'productionFactor': 0.450,
        'timeFrame': "8-10 volana",
        'cost': "Ambony (Sakafo 100%)",
        'materials': "Harato, Barika",
        'advice': ["Mila sakafo tsara kalitao.", "Tsy dia manome tombony be raha oharina amin'ny dobo tany."]
      }
    };

    final speciesData = {
      'royal': { 'name': "Karpa Royal", 'note': "Mila rano madio kokoa, mitombo haingana raha tsara sakafo." },
      'commune': { 'name': "Karpa Commune", 'note': "Matanjaka be, mety amin'ny rano somary ratsy." },
      'chinoise': { 'name': "Karpa Sinoa", 'note': "Mihinana ahitra sy manadio rano (filtreur). Tsara atao polyculture." }
    };

    List<Map<String, dynamic>> results = [];
    for (var sysKey in _selectedSystems) {
      var data = Map<String, dynamic>.from(systemsData[sysKey]!);
      var speciesInfo = speciesData[_selectedSpecies]!;
      
      // Customize based on species
      data['title'] = "${data['title']} - ${speciesInfo['name']}";
      (data['advice'] as List).add(speciesInfo['note']);

      if (_selectedSpecies == 'chinoise') {
        (data['advice'] as List).add("Omeo ahitra sy zavamaniry maitso betsaka.");
      } else if (_selectedSpecies == 'royal') {
        (data['advice'] as List).add("Tena mila sakafo misy proteinina ampy.");
      }

      int minFish = (surface * (data['densityMin'] as num)).round();
      int maxFish = (surface * (data['densityMax'] as num)).round();
      double avgFish = (minFish + maxFish) / 2;
      double survivalRate = 0.85;
      int productionKg = (avgFish * survivalRate * (data['productionFactor'] as num)).round();

      data['minFish'] = minFish;
      data['maxFish'] = maxFish;
      data['productionKg'] = productionKg;
      results.add(data);
    }

    setState(() {
      if (results.length == 1) {
        _simulationResult = results[0];
        _comparisonResults = null;
      } else {
        _simulationResult = null;
        _comparisonResults = results;
      }
    });
  }

  Widget _buildResults() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: const Border(top: BorderSide(color: Color(0xFF16A34A), width: 4)),
      ),
      child: _simulationResult != null ? _buildSingleResult(_simulationResult!) : _buildComparisonResult(_comparisonResults!),
    );
  }

  Widget _buildSingleResult(Map<String, dynamic> r) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: Color(0xFFDCFCE7), shape: BoxShape.circle),
              child: const Icon(Icons.assignment_turned_in, color: Color(0xFF15803D)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r['title'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF111827))),
                  Text('Tombana ho an\'ny velarana ${_surfaceController.text} m²', style: TextStyle(color: const Color(0xFF6B7280))),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0xFFF5F5F4), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE7E5E4))),
                child: Column(
                  children: [
                    Text('ISAN\'NY TRONDRO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF78716C))),
                    const SizedBox(height: 8),
                    Text('${r['minFish']} - ${r['maxFish']}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF292524))),
                    Text('(${r['densityText']})', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF78716C))),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0xFFFEFCE8), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFFEF9C3))),
                child: Column(
                  children: [
                    Text('VOKATRA (KG)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFFA16207))),
                    const SizedBox(height: 8),
                    Text('~ ${r['productionKg']} Kg', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF854D0E))),
                    Text('Tsingerina: ${r['timeFrame']}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFFCA8A04))),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE5E7EB))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.info_outline, color: Color(0xFF16A34A), size: 20),
                  const SizedBox(width: 8),
                  Text('TOROHEVITRA', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFFF0FDF4), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFDCFCE7))),
                child: Text(r['description'], style: TextStyle(fontStyle: FontStyle.italic, color: const Color(0xFF374151))),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: const Color(0xFFFAFAF9), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE7E5E4))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('FANDANIANA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFFA8A29E))),
                          Text(r['cost'], style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1C1917))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: const Color(0xFFFAFAF9), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE7E5E4))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('FITAOVANA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFFA8A29E))),
                          Text(r['materials'], style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1C1917))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...((r['advice'] as List).map((adv) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check, size: 16, color: Color(0xFF16A34A)),
                    const SizedBox(width: 8),
                    Expanded(child: Text(adv, style: TextStyle(color: const Color(0xFF4B5563)))),
                  ],
                ),
              ))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComparisonResult(List<Map<String, dynamic>> results) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: Color(0xFFFEFCE8), shape: BoxShape.circle),
              child: const Icon(Icons.balance, color: Color(0xFFA16207)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Fampitahana', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF111827))),
                  Text('Mijery ny fahasamihafana amin\'ny velarana ${_surfaceController.text} m²', style: TextStyle(color: const Color(0xFF6B7280))),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildComparisonColumn(results[0], const Color(0xFF15803D))), // green-700
            const SizedBox(width: 16),
            Expanded(child: _buildComparisonColumn(results[1], const Color(0xFFCA8A04))), // yellow-600
          ],
        ),
      ],
    );
  }

  Widget _buildComparisonColumn(Map<String, dynamic> r, Color headerColor) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: headerColor, borderRadius: BorderRadius.circular(12)),
          child: Text(r['title'], textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: const Color(0xFFFAFAF9), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE7E5E4))),
          child: Column(
            children: [
              Text('ISAN\'NY TRONDRO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF78716C))),
              Text('${r['minFish']} - ${r['maxFish']}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF292524))),
              Text(r['densityText'], style: TextStyle(fontSize: 10, color: const Color(0xFF78716C))),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: const Color(0xFFFEFCE8), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFFEF9C3))),
          child: Column(
            children: [
              Text('VOKATRA (KG)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFFB45309))),
              Text('~ ${r['productionKg']}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF92400E))),
              Text(r['timeFrame'], style: TextStyle(fontSize: 10, color: const Color(0xFFD97706))),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE7E5E4))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('FANDANIANA: ${r['cost']}', style: TextStyle(fontSize: 10, color: const Color(0xFF374151))),
              const Divider(height: 16),
              ...((r['advice'] as List).map((adv) => Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_right, size: 16, color: headerColor),
                    Expanded(child: Text(adv, style: TextStyle(fontSize: 10, color: const Color(0xFF6B7280)))),
                  ],
                ),
              ))),
            ],
          ),
        ),
      ],
    );
  }
}
