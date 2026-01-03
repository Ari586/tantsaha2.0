import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class TilapiaNiloticaPageFlutter extends StatefulWidget {
  const TilapiaNiloticaPageFlutter({super.key});

  @override
  State<TilapiaNiloticaPageFlutter> createState() => _TilapiaNiloticaPageFlutterState();
}

class _TilapiaNiloticaPageFlutterState extends State<TilapiaNiloticaPageFlutter> {
  final ScrollController _scrollController = ScrollController();
  
  // Simulator State
  String _selectedSpecies = 'nilotica';
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
      backgroundColor: const Color(0xFFF8FAFC), // bg-slate-50
      appBar: AppBar(
        title: Text('Tilapia', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A), // text-slate-900
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFCCFBF1), height: 1), // border-teal-100
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
          colors: [Color(0xFFF97316), Color(0xFFFB923C)], // orange-500 to orange-400
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
            'Fiompiana Tilapia',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          Text(
            'Nilotica & Mena',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFCCFBF1), // teal-100 equivalent
              fontSize: 40,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Torolàlana teknika feno sy fitaovana fikajiana ho an\'ny mpandraharaha Malagasy.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFECFEFF), // cyan-50
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
                icon: const Icon(Icons.menu_book, color: Color(0xFF0F766E)), // teal-700
                label: Text('Hamaky Torolàlana', style: TextStyle(color: const Color(0xFF0F766E), fontWeight: FontWeight.bold)),
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
                  backgroundColor: const Color(0xFF115E59).withValues(alpha: 0.5), // teal-800/50
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Color(0xFF2DD4BF)), // teal-400
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
              icon: Icons.check,
              iconColor: const Color(0xFF0D9488), // teal-600
              iconBg: const Color(0xFFCCFBF1), // teal-100
              borderColor: const Color(0xFF14B8A6), // teal-500
              title: 'Niloticus & Mena',
              subtitle: 'Karazana tsara indrindra',
              isMobile: isMobile,
            ),
            if (!isMobile) const SizedBox(width: 16),
            if (isMobile) const SizedBox(height: 16),
            _buildStatCard(
              icon: Icons.trending_up,
              iconColor: const Color(0xFF0891B2), // cyan-600
              iconBg: const Color(0xFFCFFAFE), // cyan-100
              borderColor: const Color(0xFF06B6D4), // cyan-500
              title: 'Tsena Mandeha',
              subtitle: 'Tinady avo eto an-toerana',
              isMobile: isMobile,
            ),
            if (!isMobile) const SizedBox(width: 16),
            if (isMobile) const SizedBox(height: 16),
            _buildStatCard(
              icon: Icons.access_time,
              iconColor: const Color(0xFF059669), // emerald-600
              iconBg: const Color(0xFFD1FAE5), // emerald-100
              borderColor: const Color(0xFF10B981), // emerald-500
              title: '6 Volana',
              subtitle: 'Tsingerina famokarana',
              isMobile: isMobile,
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
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
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 20),
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
            Container(width: 8, height: 40, decoration: BoxDecoration(color: const Color(0xFF14B8A6), borderRadius: BorderRadius.circular(4))),
            const SizedBox(width: 16),
            Text('Dingana & Teknika', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
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
                  icon: Icons.fingerprint, // DNA icon replacement
                  iconColor: const Color(0xFF2563EB), // blue-600
                  iconBg: const Color(0xFFEFF6FF), // blue-50
                  borderColor: const Color(0xFFDBEAFE), // blue-100
                  title: '1. Fifantenana Karazana',
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ny Oreochromis niloticus (Tilapia du Nil) no tsara indrindra.', style: TextStyle(fontSize: 14, color: const Color(0xFF4B5563))),
                      const SizedBox(height: 8),
                      _buildBulletPoint('Vantony: Misafidiana zana-trondro "monosexe mâle" (lahy daholo) mba hisorohana ny fiterahana be loatra anaty dobo.', const Color(0xFF3B82F6)),
                      _buildBulletPoint('Fitomboana: Mahatratra 300g-500g ao anatin\'ny 6 volana raha tsara ny sakafo.', const Color(0xFF3B82F6)),
                      const Divider(height: 24),
                      Text('Safidy faharoa: Tilapia Mena (Rouge):', style: TextStyle(fontSize: 14, color: const Color(0xFF4B5563))),
                      const SizedBox(height: 8),
                      _buildBulletPoint('Vidiny ambony kokoa eo amin\'ny tsena satria manintona ny lokony.', const Color(0xFFF59E0B), icon: Icons.star),
                      _buildBulletPoint('Mora hitan\'ny vorona (mila fiarovana manokana).', const Color(0xFFEF4444), icon: Icons.error_outline),
                    ],
                  ),
                ),
                _buildFeatureCard(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 48) / 3 : (constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth),
                  icon: Icons.layers,
                  iconColor: const Color(0xFF16A34A), // green-600
                  iconBg: const Color(0xFFF0FDF4), // green-50
                  borderColor: const Color(0xFFDCFCE7), // green-100
                  title: '2. Rafitra & Dobo',
                  content: Column(
                    children: [
                      _buildExpandableItem(
                        title: 'Extensif (Dobo tany)',
                        color: const Color(0xFF166534), // green-800
                        bgColor: const Color(0xFFF0FDF4).withValues(alpha: 0.5),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset('assets/images/extensif.png', width: double.infinity, height: 120, fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 8),
                            Text('Ity no fomba mahazatra indrindra, mampiasa dobo tany voajanahary.', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: const Color(0xFF4B5563))),
                            const SizedBox(height: 4),
                            _buildBulletPoint('Fotodrafitrasa: Dobo tany 1m hatramin\'ny 1.5m ny halaliny.', Colors.black, size: 12),
                            _buildBulletPoint('Sakafo: Miantehitra amin\'ny plancton (sakafo voajanahary). Ampitomboina amin\'ny alalan\'ny zezika (compost).', Colors.black, size: 12),
                            _buildBulletPoint('Hakitroka: 1 hatramin\'ny 3 isa isaky ny metatra tora-droa (m²).', Colors.black, size: 12),
                            _buildBulletPoint('Tombony: Tsy mila fandaniana be amin\'ny sakafo sy fitaovana.', Colors.black, size: 12),
                            _buildBulletPoint('Fetran\'ny vokatra: Maharitra ela ny fitomboana (6-10 volana).', Colors.black, size: 12),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildExpandableItem(
                        title: 'Semi-Intensif (Cage/Beton)',
                        color: const Color(0xFF166534),
                        bgColor: const Color(0xFFF0FDF4).withValues(alpha: 0.5),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset('assets/images/semiintensif.png', width: double.infinity, height: 120, fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 8),
                            Text('Ity rafitra ity dia mitaky fifehezana bebe kokoa sy sakafo fanampiny.', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: const Color(0xFF4B5563))),
                            const SizedBox(height: 4),
                            _buildBulletPoint('Fotodrafitrasa: Dobo beton na cage apetraka amin\'ny renirano na farihy.', Colors.black, size: 12),
                            _buildBulletPoint('Sakafo: Sakafo voajanahary miampy sakafo fanampiny (katsaka, soja, bran).', Colors.black, size: 12),
                            _buildBulletPoint('Hakitroka: 5 hatramin\'ny 15 isa isaky ny m².', Colors.black, size: 12),
                            _buildBulletPoint('Tombony: Vokatra betsaka kokoa amin\'ny velarana kely.', Colors.black, size: 12),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildExpandableItem(
                        title: 'Intensif (RAS / Tanks)',
                        color: const Color(0xFF166534),
                        bgColor: const Color(0xFFF0FDF4).withValues(alpha: 0.5),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset('assets/images/intensif.png', width: double.infinity, height: 120, fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 8),
                            Text('Teknika avo lenta mampiasa teknolojia filtration (Recirculating Aquaculture System).', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: const Color(0xFF4B5563))),
                            const SizedBox(height: 4),
                            _buildBulletPoint('Fotodrafitrasa: Tanky boribory na mahitsizoro miaraka amin\'ny paompy sy sivana.', Colors.black, size: 12),
                            _buildBulletPoint('Sakafo: Sakafo voavoatra manokana (pellets) manankarena proteinina (30%+).', Colors.black, size: 12),
                            _buildBulletPoint('Hakitroka: 50 hatramin\'ny 100+ isa isaky ny metatra toratelo (m³).', Colors.black, size: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _buildFeatureCard(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 48) / 3 : (constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth),
                  icon: Icons.thermostat,
                  iconColor: const Color(0xFF0891B2), // cyan-600
                  iconBg: const Color(0xFFCFFAFE), // cyan-100
                  borderColor: const Color(0xFFA5F3FC), // cyan-100
                  title: '3. Rano & Tontolo',
                  content: Column(
                    children: [
                      Text('Ny Tilapia dia trondro mafana (tropical).', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: const Color(0xFF6B7280))),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(color: const Color(0xFFCFFAFE), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFA5F3FC))),
                              child: Column(
                                children: [
                                  Text('25-30°C', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF0E7490))),
                                  Text('Hafanana Tsara', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF06B6D4))),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(color: const Color(0xFFFEE2E2), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFFECACA))),
                              child: Column(
                                children: [
                                  Text('< 20°C', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFFB91C1C))),
                                  Text('Mijanona mitombo', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFFEF4444))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildBulletPoint('Oxygène: Mila > 3mg/L. Raha ambany dia mitsingevana ny trondro (pipage).', const Color(0xFF4B5563), size: 12),
                      _buildBulletPoint('pH: 6.5 hatramin\'ny 9 no tsara.', const Color(0xFF4B5563), size: 12),
                    ],
                  ),
                ),
                _buildFeatureCard(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 48) / 3 : (constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth),
                  icon: Icons.restaurant,
                  iconColor: const Color(0xFF059669), // emerald-600
                  iconBg: const Color(0xFFD1FAE5), // emerald-100
                  borderColor: const Color(0xFFA7F3D0), // emerald-200
                  title: '4. Sakafo sy Famahanana',
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sakafo Natoraly
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0FDF4),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFBBF7D0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Sakafo Natoraly', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF166534))),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: const Color(0xFF22C55E), borderRadius: BorderRadius.circular(12)),
                                  child: Text('Maimaim-poana', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Plancton vokarina amin\'ny alalan\'ny fanamamasahana ny dobo (zezika biby na compost).', style: TextStyle(fontSize: 12, color: const Color(0xFF4B5563))),
                            const SizedBox(height: 4),
                            Text('Rafitra Extensif', style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: const Color(0xFF6B7280))),
                          ],
                        ),
                      ),
                      // Sakafo Fanampiny
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF3C7),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFFDE68A)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Sakafo Fanampiny', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF92400E))),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: const Color(0xFFF59E0B), borderRadius: BorderRadius.circular(12)),
                                  child: Text('15-25% Prot.', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Fangaro vita an-trano mampiasa vovoka vary, soja, ary katsaka voatoto.', style: TextStyle(fontSize: 12, color: const Color(0xFF4B5563))),
                            const SizedBox(height: 4),
                            Text('In-2 isan\'andro', style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: const Color(0xFF6B7280))),
                          ],
                        ),
                      ),
                      // Sakafo Pellets
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDBEAFE),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFBFDBFE)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Sakafo Pellets', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1E40AF))),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: const Color(0xFF3B82F6), borderRadius: BorderRadius.circular(12)),
                                  child: Text('30-35% Prot.', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Sakafo namboarina tamin\'ny milina, miandingana eo ambony rano ka tsy mandoto.', style: TextStyle(fontSize: 12, color: const Color(0xFF4B5563))),
                            const SizedBox(height: 4),
                            Text('Fitomboana haingana', style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: const Color(0xFF6B7280))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Fatra Proteinina
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildProteinBadge('S', 'Zana-trondro (Kely)', '40-45% Proteinina', const Color(0xFFDCFCE7), const Color(0xFF166534)),
                          _buildProteinBadge('M', 'Trondro Lehibe', '28-32% Proteinina', const Color(0xFFFEF3C7), const Color(0xFF92400E)),
                          _buildProteinBadge('L', 'Fatra', '3-5% n\'ny lanja/andro', const Color(0xFFDBEAFE), const Color(0xFF1E40AF)),
                        ],
                      ),
                    ],
                  ),
                ),
                // Section 5: Fisorohana Aretina
                _buildFeatureCard(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 48) / 3 : (constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth),
                  icon: Icons.health_and_safety,
                  iconColor: const Color(0xFFDC2626), // red-600
                  iconBg: const Color(0xFFFEE2E2), // red-100
                  borderColor: const Color(0xFFFECACA), // red-200
                  title: '5. Fisorohana Aretina',
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ny fisorohana no tsara lavitra noho ny fitsaboana amin\'ny fiompiana trondro.', 
                        style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: const Color(0xFF6B7280))),
                      const SizedBox(height: 16),
                      // Fambara aretina
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF2F2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFFECACA)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.warning_amber, color: const Color(0xFFDC2626), size: 18),
                                const SizedBox(width: 8),
                                Text('Fambara aretina', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFFDC2626))),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Trondro tsy mety mihinana, milomano eo ambonin\'ny rano mitady rivotra, misy tasy fotsy na fery eo amin\'ny hoditra.', 
                              style: TextStyle(fontSize: 12, color: const Color(0xFF4B5563))),
                          ],
                        ),
                      ),
                      // Fisorohana
                      Text('Fisorohana:', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF374151))),
                      const SizedBox(height: 8),
                      _buildBulletPoint('Aza mampiditra trondro be loatra (surpopulation).', const Color(0xFFDC2626), size: 12, icon: Icons.block),
                      _buildBulletPoint('Ovay ny rano raha vao hita fa maloto.', const Color(0xFFDC2626), size: 12, icon: Icons.water_drop),
                      _buildBulletPoint('Atokàny ny trondro hita fa marary.', const Color(0xFFDC2626), size: 12, icon: Icons.medical_services),
                      _buildBulletPoint('Tandremo ny sisa sakafo tsy ho lo ao anaty rano.', const Color(0xFFDC2626), size: 12, icon: Icons.no_food),
                    ],
                  ),
                ),
                // Section 6: Toekarena
                _buildFeatureCard(
                  width: constraints.maxWidth > 800 ? (constraints.maxWidth - 48) / 3 : (constraints.maxWidth > 600 ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth),
                  icon: Icons.attach_money,
                  iconColor: const Color(0xFF7C3AED), // violet-600
                  iconBg: const Color(0xFFEDE9FE), // violet-100
                  borderColor: const Color(0xFFDDD6FE), // violet-200
                  title: '6. Toekarena',
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ny fiompiana Tilapia dia orinasa mahazo tombony raha arahina ny teknika.', 
                        style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: const Color(0xFF6B7280))),
                      const SizedBox(height: 16),
                      // Fanangonam-bokatra
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F3FF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFDDD6FE)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.shopping_basket, color: const Color(0xFF7C3AED), size: 18),
                                const SizedBox(width: 8),
                                Text('Fanangonam-bokatra', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF7C3AED))),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Ny Tilapia dia azo jonoina rehefa mahatratra 250g hatramin\'ny 500g. Amin\'ny rafitra semi-intensif, izany dia eo amin\'ny faha-6 volan\'ny trondro.', 
                              style: TextStyle(fontSize: 12, color: const Color(0xFF4B5563))),
                          ],
                        ),
                      ),
                      _buildBulletPoint('Tsena: Manana fangatahana be ny Tilapia eto an-toerana.', const Color(0xFF7C3AED), size: 12, icon: Icons.storefront),
                      const SizedBox(height: 8),
                      // Teti-bola
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [const Color(0xFF7C3AED), const Color(0xFF8B5CF6)]),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Teti-bola (100m²)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            const SizedBox(height: 4),
                            Text('Raha mampiasa dobo 100m² ianao, dia afaka mamokatra trondro 150kg hatramin\'ny 200kg isaky ny 6 volana.', 
                              style: TextStyle(fontSize: 12, color: Colors.white70)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Tsiambaratelo
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF3C7),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFFDE68A)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.lightbulb, color: const Color(0xFFF59E0B), size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text('Tsiambaratelo: Ny fahadiovan\'ny rano sy ny sakafo ara-potoana no antoky ny fahombiazana.', 
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: const Color(0xFF92400E))),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildProteinBadge(String size, String label, String protein, Color bgColor, Color textColor) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: Center(child: Text(size, style: TextStyle(fontWeight: FontWeight.bold, color: textColor))),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: textColor)),
        Text(protein, style: TextStyle(fontSize: 9, color: const Color(0xFF6B7280))),
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
        color: const Color(0xFF0F172A), // slate-900
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 25, offset: const Offset(0, 10))],
        border: Border(top: BorderSide(color: const Color(0xFF0D9488), width: 8)), // teal-600
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
                    color: const Color(0xFF0D9488).withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF14B8A6).withValues(alpha: 0.3)),
                  ),
                  child: Text('Simulator Tilapia', style: TextStyle(color: const Color(0xFF5EEAD4), fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                const SizedBox(height: 16),
                Text('Kajy & Fampitahana', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 16),
                Text('Safidio ny karazana trondro sy ny rafitra hanaovana kajy.', textAlign: TextAlign.center, style: TextStyle(color: const Color(0xFF94A3B8), fontWeight: FontWeight.w300)),
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
                      Text('1. SAFIDIO NY KARAZANA', style: TextStyle(color: const Color(0xFFFBBF24), fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.2)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _buildRadioOption('nilotica', 'Nilotica (Gris)', 'Tsara indrindra', Icons.check_circle)),
                          const SizedBox(width: 12),
                          Expanded(child: _buildRadioOption('rouge', 'Rouge (Mena)', 'Tsara vidy', Icons.star)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Divider(color: Colors.white10),
                      const SizedBox(height: 24),

                      // Step 2
                      Text('2. SAFIDIO NY RAFITRA (MAX 2)', style: TextStyle(color: const Color(0xFF2DD4BF), fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.2)),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final itemWidth = constraints.maxWidth > 700 ? (constraints.maxWidth - 48) / 5 : (constraints.maxWidth > 500 ? (constraints.maxWidth - 24) / 3 : (constraints.maxWidth - 12) / 2);
                          return Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              _buildCheckboxOption('dobo_tany', 'Dobo Tany', 'Extensif', Icons.landscape, itemWidth),
                              _buildCheckboxOption('cage', 'Cage', 'Semi-Intensif', Icons.grid_view, itemWidth),
                              _buildCheckboxOption('beton', 'Beton', 'Semi-Intensif', Icons.home, itemWidth),
                              _buildCheckboxOption('hors_sol', 'Hors Sol', 'Intensif', Icons.vertical_align_top, itemWidth),
                              _buildCheckboxOption('ras', 'RAS', 'Intensif', Icons.speed, itemWidth),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      const Divider(color: Colors.white10),
                      const SizedBox(height: 24),

                      // Step 3
                      Text('3. VELARANA (M²)', style: TextStyle(color: const Color(0xFF2DD4BF), fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.2)),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _surfaceController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF1E293B),
                          hintText: 'Ohatra: 500',
                          hintStyle: TextStyle(color: const Color(0xFF475569)),
                          suffixText: 'm²',
                          suffixStyle: TextStyle(color: const Color(0xFF64748B), fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF0D9488), width: 2)),
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
                            backgroundColor: MaterialStateProperty.resolveWith((states) => const Color(0xFF0D9488)), // Gradient approximation
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

  Widget _buildRadioOption(String value, String title, String subtitle, IconData icon) {
    bool isSelected = _selectedSpecies == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedSpecies = value),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFFBEB) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFFF59E0B) : Colors.transparent, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFFD97706) : const Color(0xFF9CA3AF), size: 32),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
            Text(subtitle, style: TextStyle(fontSize: 12, color: const Color(0xFF6B7280))),
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
          border: Border.all(color: isSelected ? const Color(0xFF0D9488) : Colors.transparent, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFF0D9488) : const Color(0xFF9CA3AF), size: 32),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
            Text(subtitle, style: TextStyle(fontSize: 12, color: const Color(0xFF6B7280))),
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
      'dobo_tany': {
        'title': "Dobo Tany (Extensif)",
        'description': "Fomba tsotra indrindra, tsy mila sakafo lafo vidy.",
        'densityMin': 1, 'densityMax': 3, 'densityText': "1 - 3 isa / m²",
        'productionFactor': 0.250, 
        'timeFrame': "8-10 volana",
        'cost': "Ambany (Zezika ihany)",
        'materials': "Angady, Vam (Vanne)",
        'advice': ["Omeo zezika (compost) ny dobo mba hisy plancton.", "Tsy mila aérateur.", "Mety amin'ny toerana lavitra tanàna."]
      },
      'cage': {
        'title': "Cage (Semi-Intensif)",
        'description': "Cage apetraka amin'ny renirano na farihy.",
        'densityMin': 10, 'densityMax': 20, 'densityText': "10 - 20 isa / m²",
        'productionFactor': 0.350,
        'timeFrame': "6-7 volana",
        'cost': "Antony (Sakafo + Cage)",
        'materials': "Cage (harato), Tady, Sakafo pellets",
        'advice': ["Omeo sakafo in-2 na in-3 isan'andro.", "Jereo matetika ny cage raha misy simba.", "Tsara raha eo akaikin'ny toeram-pivarotana."]
      },
      'beton': {
        'title': "Beton (Semi-Intensif)",
        'description': "Dobo vita amin'ny beton, mora diovina.",
        'densityMin': 5, 'densityMax': 15, 'densityText': "5 - 15 isa / m²",
        'productionFactor': 0.350,
        'timeFrame': "6-7 volana",
        'cost': "Antony (Sakafo + Fotodrafitrasa)",
        'materials': "Dobo Beton, Paompy rano",
        'advice': ["Omeo sakafo in-2 na in-3 isan'andro.", "Mila ovaina ny rano raha maloto.", "Tsara kokoa ny fitomboana."]
      },
      'hors_sol': {
        'title': "Hors Sol (Intensif)",
        'description': "Tanky na baseny plastika, tsy mila tany.",
        'densityMin': 30, 'densityMax': 60, 'densityText': "30 - 60 isa / m³",
        'productionFactor': 0.400,
        'timeFrame': "5-6 volana",
        'cost': "Ambony (Herinaratra + Sakafo)",
        'materials': "Tanky plastika, Paompy, Aérateur",
        'advice': ["Mila herinaratra tsy tapaka.", "Sakafo pellets (30% proteinina).", "Jereo ny kalitaon'ny rano matetika."]
      },
      'ras': {
        'title': "RAS (Intensif)",
        'description': "Recirculating Aquaculture System - Teknolojia avo lenta.",
        'densityMin': 50, 'densityMax': 100, 'densityText': "50 - 100 isa / m³",
        'productionFactor': 0.450,
        'timeFrame': "5-6 volana",
        'cost': "Ambony be (Herinaratra + Sivana + Sakafo)",
        'materials': "Tanky, Sivana (Filtre), Paompy, Aérateur",
        'advice': ["Mila herinaratra 24/24.", "Sakafo pellets (30% proteinina).", "Mila fahaizana manokana momba ny rano."]
      }
    };

    List<Map<String, dynamic>> results = [];
    for (var sysKey in _selectedSystems) {
      var data = Map<String, dynamic>.from(systemsData[sysKey]!);
      
      // Customize based on species
      if (_selectedSpecies == 'rouge') {
        data['title'] = "${data['title']} - Rouge";
        (data['advice'] as List).add("Ny Tilapia Mena dia mora hitan'ny vorona, mila arovana.");
      } else {
        data['title'] = "${data['title']} - Nilotica";
        (data['advice'] as List).add("Ny Nilotica dia matanjaka kokoa sy mitombo haingana.");
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
        border: const Border(top: BorderSide(color: Color(0xFF0D9488), width: 4)),
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
              decoration: const BoxDecoration(color: Color(0xFFCCFBF1), shape: BoxShape.circle),
              child: const Icon(Icons.assignment_turned_in, color: Color(0xFF0F766E)),
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
                decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE5E7EB))),
                child: Column(
                  children: [
                    Text('ISAN\'NY TRONDRO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF6B7280))),
                    const SizedBox(height: 8),
                    Text('${r['minFish']} - ${r['maxFish']}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
                    Text('(${r['densityText']})', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF6B7280))),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFFDE68A))),
                child: Column(
                  children: [
                    Text('VOKATRA (KG)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFFB45309))),
                    const SizedBox(height: 8),
                    Text('~ ${r['productionKg']} Kg', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF92400E))),
                    Text('Tsingerina: ${r['timeFrame']}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFFD97706))),
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
                  const Icon(Icons.info_outline, color: Color(0xFF059669), size: 20),
                  const SizedBox(width: 8),
                  Text('TOROHEVITRA', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFFECFDF5), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFD1FAE5))),
                child: Text(r['description'], style: TextStyle(fontStyle: FontStyle.italic, color: const Color(0xFF374151))),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE5E7EB))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('FANDANIANA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF9CA3AF))),
                          Text(r['cost'], style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE5E7EB))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('FITAOVANA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF9CA3AF))),
                          Text(r['materials'], style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
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
                    const Icon(Icons.check, size: 16, color: Color(0xFF059669)),
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
              decoration: const BoxDecoration(color: Color(0xFFFEF3C7), shape: BoxShape.circle),
              child: const Icon(Icons.balance, color: Color(0xFFB45309)),
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
          decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE5E7EB))),
          child: Column(
            children: [
              Text('ISAN\'NY TRONDRO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF6B7280))),
              Text('${r['minFish']} - ${r['maxFish']}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF1F2937))),
              Text(r['densityText'], style: TextStyle(fontSize: 10, color: const Color(0xFF6B7280))),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFFDE68A))),
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
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE5E7EB))),
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
