import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ==========================================
// 1. DESIGN SYSTEM (V36.1 CRÈME DOUX)
// ==========================================ter
class AppColors {
  static const Color bgTop = Color(0xFFFFF8DC); // Crème
  static const Color bgBottom = Color(0xFFF5F5DC); // Beige clair
  static const Color surface = Color.fromRGBO(245, 235, 220, 0.90); // Beige rosé
  static const Color glass = Color.fromRGBO(250, 240, 230, 0.75);
  static const Color primaryGreen = Color(0xFF2E7D32); // Vert foncé
  static const Color primaryOrange = Color(0xFFE65100); // Orange foncé
  static const Color accentBlue = Color(0xFF0277BD); // Bleu foncé
  static const Color accentPurple = Color(0xFF7B1FA2); // Violet foncé
  static const Color textMain = Color(0xFF3E2723); // Marron foncé
  static const Color textMuted = Color(0xFF6D4C41); // Marron moyen
  static const Color glassBorder = Color.fromRGBO(139, 110, 99, 0.3);
  static const Color border = Color.fromRGBO(139, 110, 99, 0.2);
}

// ==========================================
// 2. DATA MODEL
// ==========================================
class AgriItem {
  final double cost;
  final double rev;
  final int weeks;
  final List<double> ratio;
  final String cat;
  final String tip;

  const AgriItem({
    required this.cost,
    required this.rev,
    required this.weeks,
    required this.ratio,
    this.cat = '',
    this.tip = '',
  });
}

// --- V36.1 INSIGHTS DATABASE ---
final Map<String, Map<String, AgriItem>> database = {
  'fambolena': {
    // CEREALES
    "Vary Antanety (Pluvial)": const AgriItem(cost: 200, rev: 500, weeks: 20, ratio: [0.15, 0.35, 0.50], cat: "Céréales", tip: "Mila P-K. Phosphore ho an'ny faka."),
    "Vary Anaty Rano (Irrigué)": const AgriItem(cost: 250, rev: 600, weeks: 22, ratio: [0.10, 0.40, 0.50], cat: "Céréales", tip: "Mila Urea (Azote) hanamafisana ny ravina."),
    "Katsaka (Maïs)": const AgriItem(cost: 120, rev: 350, weeks: 16, ratio: [0.10, 0.40, 0.50], cat: "Céréales", tip: "Mila Azote betsaka. Tsara atao 'Rotation'."),
    // TUBERCULES
    "Mangahazo (Manioc)": const AgriItem(cost: 80, rev: 280, weeks: 36, ratio: [0.15, 0.05, 0.80], cat: "Tubercules", tip: "Tany maivana (fasika) no tsara."),
    "Vomanga (Patate Douce)": const AgriItem(cost: 100, rev: 350, weeks: 16, ratio: [0.1, 0.1, 0.8], cat: "Tubercules", tip: "Tandremo ny N be loatra."),
    "Ovy (Pomme de terre)": const AgriItem(cost: 600, rev: 1800, weeks: 14, ratio: [0.4, 0.3, 0.3], cat: "Tubercules", tip: "Mila K (Potazy) be dia be."),
    "Saonjo": const AgriItem(cost: 150, rev: 450, weeks: 24, ratio: [0.2, 0.3, 0.5], cat: "Tubercules", tip: "Tia tany mando na misy rano mihitsy."),
    // RACINES
    "Sakamalao (Gingembre)": const AgriItem(cost: 800, rev: 3000, weeks: 40, ratio: [0.5, 0.2, 0.3], cat: "Racines", tip: "Tia tany maivana sy aloka kely."),
    "Karoty": const AgriItem(cost: 250, rev: 950, weeks: 14, ratio: [0.15, 0.35, 0.5], cat: "Racines", tip: "Tany vaky tsara (lalina) no ilaina."),
    // LEGUMINEUSES
    "Tsaramaso (Haricot)": const AgriItem(cost: 200, rev: 650, weeks: 12, ratio: [0.3, 0.2, 0.5], cat: "Légumineuses", tip: "Fixateur Azote."),
    "Voanjo (Arachide)": const AgriItem(cost: 180, rev: 550, weeks: 16, ratio: [0.25, 0.25, 0.5], cat: "Légumineuses", tip: "Mila Calcium (Chaux)."),
    "Voanjobory": const AgriItem(cost: 250, rev: 850, weeks: 20, ratio: [0.2, 0.3, 0.5], cat: "Légumineuses", tip: "Mahatanty haintany."),
    // LEGUMES
    "Voatabia (Standard)": const AgriItem(cost: 500, rev: 1800, weeks: 14, ratio: [0.1, 0.4, 0.5], cat: "Légumes", tip: "Mila N-P-K. Priezy matetika."),
    "Sakay (Piment)": const AgriItem(cost: 400, rev: 1600, weeks: 16, ratio: [0.05, 0.45, 0.5], cat: "Légumes", tip: "Tia hafanana."),
    "Angivy": const AgriItem(cost: 200, rev: 600, weeks: 14, ratio: [0.1, 0.4, 0.5], cat: "Légumes", tip: "Mila zezika betsaka."),
    "Baranjely (Aubergine)": const AgriItem(cost: 300, rev: 900, weeks: 16, ratio: [0.1, 0.4, 0.5], cat: "Légumes", tip: "Mila rano sy zezika."),
    "Voatavo (Citrouille)": const AgriItem(cost: 100, rev: 400, weeks: 16, ratio: [0.1, 0.2, 0.7], cat: "Légumes", tip: "Mila toerana malalaka."),
    // FEUILLES
    "Anana (Brèdes)": const AgriItem(cost: 100, rev: 450, weeks: 6, ratio: [0.1, 0.5, 0.4], cat: "Feuilles", tip: "Tsingerina fohy (Cycle court)."),
    "Petsay": const AgriItem(cost: 150, rev: 600, weeks: 8, ratio: [0.1, 0.5, 0.4], cat: "Feuilles", tip: "Mila rano sy Azote."),
    "Salady": const AgriItem(cost: 200, rev: 800, weeks: 8, ratio: [0.15, 0.45, 0.4], cat: "Feuilles", tip: "Mila rano tsy tapaka."),
    // BULBES
    "Tongolo (Oignon)": const AgriItem(cost: 350, rev: 1300, weeks: 18, ratio: [0.3, 0.4, 0.3], cat: "Bulbes", tip: "Atsaharo ny rano rehefa maina ny ravina."),
    "Tongolo Gasy (Ail)": const AgriItem(cost: 500, rev: 1600, weeks: 20, ratio: [0.4, 0.3, 0.3], cat: "Bulbes", tip: "Mila P sy K betsaka."),
    // ARBRES
    "Voasary (Orange)": const AgriItem(cost: 500, rev: 2000, weeks: 150, ratio: [0.5, 0.2, 0.3], cat: "Arbres", tip: "Mila rantsanana. Maharitra."),
    "Voasary (Mandarine)": const AgriItem(cost: 600, rev: 2500, weeks: 150, ratio: [0.5, 0.2, 0.3], cat: "Arbres", tip: "Tia masoandro. Saro-pady."),
    "Voasary (Clémentine)": const AgriItem(cost: 650, rev: 2800, weeks: 150, ratio: [0.5, 0.2, 0.3], cat: "Arbres", tip: "Vokatra lafo vidy."),
    "Voasary Grefy (Greffé)": const AgriItem(cost: 1200, rev: 4500, weeks: 100, ratio: [0.6, 0.2, 0.2], cat: "Arbres", tip: "Miakatra haingana (2-3 taona) ary mamy."),
    // NOUVEAUX - 2025
    "Oviala (Igname)": const AgriItem(cost: 1500, rev: 4000, weeks: 36, ratio: [0.3, 0.2, 0.5], cat: "Tubercules", tip: "Mila buttage 3 heny. Tany lalina."),
    "Menthe": const AgriItem(cost: 200, rev: 1000, weeks: 8, ratio: [0.1, 0.3, 0.6], cat: "Herbes", tip: "Maniry haingana. Tsingerina fohy."),
    "Céleri": const AgriItem(cost: 350, rev: 1200, weeks: 20, ratio: [0.15, 0.35, 0.5], cat: "Légumes", tip: "Mila buttage sy rano be."),
    "Kabaro (Gombo)": const AgriItem(cost: 180, rev: 700, weeks: 12, ratio: [0.1, 0.35, 0.55], cat: "Légumes", tip: "Jinjao matetika. Mora ambolena."),
    "Amarante Queue-de-Renard": const AgriItem(cost: 100, rev: 400, weeks: 14, ratio: [0.05, 0.2, 0.75], cat: "Grains", tip: "Mahatanty haintany. Protein be."),
  },
  'fiompiana': {
    // POISSONS
    "Trondro (HORS SOL)": const AgriItem(cost: 4500, rev: 9500, weeks: 24, ratio: [0.1, 0.2, 0.1], cat: "Poissons", tip: "Mila Oxygène 24h/24."),
    "Trondro (Dobo Tany)": const AgriItem(cost: 3500, rev: 7000, weeks: 24, ratio: [0.2, 0.1, 0.1], cat: "Poissons", tip: "Mila zezika organika."),
    // VOLAILLE
    "Akoho Gasy": const AgriItem(cost: 15000, rev: 25000, weeks: 16, ratio: [0.4, 0.1, 0.1], cat: "Volaille", tip: "Vaksiny amin'ny faha-3 volana."),
    "Akoho Chair": const AgriItem(cost: 14000, rev: 19000, weeks: 7, ratio: [0.25, 0.1, 0.1], cat: "Volaille", tip: "Démarrage 15 andro mafana."),
    "Gana (Canard)": const AgriItem(cost: 18000, rev: 32000, weeks: 14, ratio: [0.3, 0.1, 0.1], cat: "Volaille", tip: "Tia rano sy ahitra."),
    "Vorontsiloza (Dinde)": const AgriItem(cost: 40000, rev: 95000, weeks: 24, ratio: [0.4, 0.5, 0.1], cat: "Volaille", tip: "Saro-pady kely. Tsara amidy amin'ny fety."),
    "Sarindokotra (Foie Gras)": const AgriItem(cost: 60000, rev: 120000, weeks: 15, ratio: [0.3, 0.6, 0.1], cat: "Volaille", tip: "Teknika 'Gavage'. Vola be."),
    "Akanga (Pintade)": const AgriItem(cost: 20000, rev: 35000, weeks: 20, ratio: [0.4, 0.5, 0.1], cat: "Volaille", tip: "Hena matsiro. Tia mandehandeha."),
    "Gisa (Oie)": const AgriItem(cost: 30000, rev: 65000, weeks: 24, ratio: [0.4, 0.5, 0.1], cat: "Volaille", tip: "Mpiambina tsara. Mihinana ahitra."),
    "Dokotra (Barbarie)": const AgriItem(cost: 25000, rev: 48000, weeks: 20, ratio: [0.3, 0.6, 0.1], cat: "Volaille", tip: "Mora ompiana."),
    "Papelika (Caille)": const AgriItem(cost: 3000, rev: 5000, weeks: 6, ratio: [0.3, 0.6, 0.1], cat: "Volaille", tip: "Manatody haingana."),
    // ELEVAGE
    "Kisoa (Porc)": const AgriItem(cost: 400000, rev: 750000, weeks: 20, ratio: [0.30, 0.1, 0.05], cat: "Elevage", tip: "Sakafo no 70% ny fandaniana."),
    "Bitro (Lapin)": const AgriItem(cost: 12000, rev: 25000, weeks: 12, ratio: [0.4, 0.1, 0.1], cat: "Elevage", tip: "Tandremo ny rano sy rivotra."),
    // SPECIAL
    "Tantely (Ruche)": const AgriItem(cost: 150000, rev: 350000, weeks: 52, ratio: [0.8, 0.1, 0.1], cat: "Special", tip: "Tsy mila provende."),
    "Olitra (BSF)": const AgriItem(cost: 50000, rev: 150000, weeks: 4, ratio: [0.5, 0.1, 0.3], cat: "Special", tip: "Famadihana fako."),
  },
};

// ==========================================
// 3. MAIN APP
// ==========================================
void main() => runApp(const MadaAgriApp());

class MadaAgriApp extends StatelessWidget {
  const MadaAgriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tombony Analyzer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.bgBottom,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          ThemeData.dark().textTheme,
        ).apply(bodyColor: AppColors.textMain, displayColor: AppColors.textMain),
        colorScheme: const ColorScheme.dark(primary: AppColors.primaryGreen),
      ),
      home: const DashboardPage(),
    );
  }
}

// ==========================================
// 4. MAIN DASHBOARD
// ==========================================
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  // Logic State
  final TextEditingController _budgetController = TextEditingController(text: "1000000");
  String _mode = 'fambolena';
  String _strat = 'std';
  String _selectedKey = "Vary Antanety (Pluvial)";
  
  // Settings State
  double _laborFactor = 1.0;
  String _matType = 'angady';

  // UI State
  bool _showResults = false;
  double _resProfit = 0, _resInvest = 0, _resROI = 0;
  String _resQty = "", _mixTitle = "", _tipText = "";
  List<BreakdownItem> _breakdown = [];

  // Animation
  late final List<AnimationController> _floaters;
  final Random _rnd = Random();

  @override
  void initState() {
    super.initState();
    _floaters = List.generate(7, (i) => AnimationController(
      duration: Duration(seconds: 20 + _rnd.nextInt(15)),
      vsync: this,
    )..repeat());
    _updateMatContext();
  }

  @override
  void dispose() {
    for (var c in _floaters) c.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  // --- LOGIC ENGINE ---
  
  void _updateMatContext() {
    if (_mode == 'fambolena') {
      if (!['angady', 'angadinomby', 'kubota'].contains(_matType)) _matType = 'angady';
    } else {
      if (_selectedKey.contains('Tantely')) {
        if (!['ala', 'tanana', 'siramamy'].contains(_matType)) _matType = 'ala';
      } else {
        if (!['low', 'mid', 'pro', 'max'].contains(_matType)) _matType = 'mid';
      }
    }
    _runCalculation(false);
  }

  Map<String, dynamic> _getCost(AgriItem item, double laborFactor, String matType, bool isFarm) {
    double hardCost = item.cost * (item.ratio[0] + item.ratio[1]);
    double laborCost = (item.cost * item.ratio[2]) * laborFactor;
    double baseVarCost = item.cost * (1 - (item.ratio[0] + item.ratio[1] + item.ratio[2]));
    
    double varAdjust = 0;
    double revBonus = 1.0;

    if (isFarm) {
      // Fambolena logic
      if (matType == 'angadinomby') { varAdjust = item.cost * 0.15; revBonus = 1.10; }
      else if (matType == 'kubota') { varAdjust = item.cost * 0.30; revBonus = 1.25; }
    } else {
      // Fiompiana logic
      if (matType == 'low') { varAdjust = -(baseVarCost * 0.30); revBonus = 0.75; }
      else if (matType == 'pro') { varAdjust = baseVarCost * 0.20; revBonus = 1.15; }
      else if (matType == 'max') { varAdjust = baseVarCost * 0.40; revBonus = 1.35; }
      
      // Tantely special
      if (item.cat == 'Special' && matType == 'ala') { varAdjust = -baseVarCost; revBonus = 1.30; }
      if (item.cat == 'Special' && matType == 'tanana') { varAdjust = -baseVarCost; revBonus = 0.90; }
    }

    final bk = {
      'c1': item.cost * item.ratio[0],
      'c2': item.cost * item.ratio[1],
      'c3': laborCost,
      'c4': baseVarCost + varAdjust
    };

    return {
      'total': hardCost + laborCost + baseVarCost + varAdjust,
      'bonus': revBonus,
      'bk': bk
    };
  }

  void _runCalculation(bool show) {
    double budget = double.tryParse(_budgetController.text) ?? 0;
    
    if (_strat == 'std') {
      final item = database[_mode]![_selectedKey]!;
      bool isFarm = _mode == 'fambolena';
      final res = _getCost(item, _laborFactor, _matType, isFarm);
      
      int qty = (budget / res['total']).floor();
      double invest = (qty * res['total']).toDouble();
      double profit = (qty * item.rev * res['bonus']) - invest;
      
      var bk = res['bk'] as Map<String, double>;
      String icon1 = isFarm ? "🌱" : "🌱";
      String icon2 = isFarm ? "🧪" : "🥣";
      String icon4 = _selectedKey.contains('Tantely') ? "🌳" : (isFarm ? "⚙️" : "🥣");
      
      List<BreakdownItem> bars = [
        BreakdownItem(isFarm ? "Masomboly" : "Vidin'ny Biby", (qty * bk['c1']!).toDouble(), AppColors.accentBlue, icon1),
        BreakdownItem(isFarm ? "Zezika & Fanafody" : "Fahasalamana & Pitsopitsony", (qty * bk['c2']!).toDouble(), AppColors.primaryGreen, icon2),
        BreakdownItem("Mpiasa", (qty * bk['c3']!).toDouble(), AppColors.accentPurple, "👷‍♂️"),
        BreakdownItem(_selectedKey.contains('Tantely') ? "Tontolo" : (isFarm ? "Fitaovana" : "Sakafo"), max(0, (qty * bk['c4']!).toDouble()), AppColors.primaryOrange, icon4),
      ];

      setState(() {
        _resProfit = profit;
        _resInvest = invest;
        _resROI = invest > 0 ? (profit / invest) * 100 : 0;
        _resQty = "$qty ${isFarm ? 'm²' : 'Isa'}";
        _tipText = item.tip;
        _mixTitle = "";
        _breakdown = bars;
        if (show) _showResults = true;
      });
    } else if (_strat != 'random') {
      _calcMix(budget);
    }
  }

  void _generateRandomMix() {
    double budget = double.tryParse(_budgetController.text) ?? 0;
    var fKeys = database['fambolena']!.keys.toList();
    var bKeys = database['fiompiana']!.keys.toList();
    String k1 = fKeys[_rnd.nextInt(fKeys.length)];
    String k2 = bKeys[_rnd.nextInt(bKeys.length)];
    _renderMixResult([
      MixObj(k1, 'fambolena', budget * 0.5),
      MixObj(k2, 'fiompiana', budget * 0.5)
    ], "🎲 Mix Aléatoire: $k1 + $k2");
  }

  void _calcMix(double budget) {
    List<MixObj> list = [];
    String name = "";
    
    if (_strat == 'mix3') {
      name = "🌱 Milpa (Katsaka+Tsaramaso+Voatavo)";
      list = [
        MixObj("Katsaka (Maïs)", 'fambolena', budget / 3),
        MixObj("Tsaramaso (Haricot)", 'fambolena', budget / 3),
        MixObj("Voatavo (Citrouille)", 'fambolena', budget / 3)
      ];
    } else if (_strat == 'fish') {
      name = "🐟 Rizipisciculture (Vary + Trondro)";
      list = [
        MixObj("Vary Anaty Rano (Irrigué)", 'fambolena', budget * 0.7),
        MixObj("Trondro (Dobo Tany)", 'fiompiana', budget * 0.3)
      ];
    } else if (_strat == 'duck') {
      name = "🦆 Katsaka + Gana";
      list = [
        MixObj("Katsaka (Maïs)", 'fambolena', budget * 0.6),
        MixObj("Gana (Canard)", 'fiompiana', budget * 0.4)
      ];
    }
    _renderMixResult(list, name);
  }

  void _renderMixResult(List<MixObj> list, String name) {
    double totalProfit = 0, totalInvest = 0;
    List<BreakdownItem> bars = [];
    
    for (var obj in list) {
      if (!database[obj.m]!.containsKey(obj.k)) continue;
      var item = database[obj.m]![obj.k]!;
      String safeMat = _matType;
      
      if (obj.m == 'fambolena') safeMat = 'angady';
      if (obj.m == 'fiompiana') safeMat = 'mid';
      if (obj.k.contains('Tantely')) safeMat = 'ala';

      var res = _getCost(item, _laborFactor, safeMat, obj.m == 'fambolena');
      int qty = (obj.b / res['total']).floor();
      double invest = (qty * res['total']).toDouble();
      double profit = (qty * item.rev * res['bonus']) - invest;

      totalInvest += invest;
      totalProfit += profit;
      
      bars.add(BreakdownItem(
        obj.k,
        profit,
        obj.m == 'fambolena' ? AppColors.primaryGreen : AppColors.primaryOrange,
        "$qty ${obj.m == 'fambolena' ? 'm²' : 'Isa'}",
      ));
    }

    setState(() {
      _resProfit = totalProfit;
      _resInvest = totalInvest;
      _resROI = totalInvest > 0 ? (totalProfit / totalInvest) * 100 : 0;
      _resQty = "MIX";
      _tipText = "💡 Mix: $name";
      _mixTitle = name;
      _breakdown = bars;
      _showResults = true;
    });
  }

  // --- UI BUILD ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.5, -1),
                end: Alignment(0.5, 1),
                colors: [AppColors.bgTop, AppColors.bgBottom],
              ),
            ),
          ),
          // Ambient Floating Icons
          ...List.generate(7, (i) => AnimatedBuilder(
            animation: _floaters[i],
            builder: (ctx, ch) {
              double h = MediaQuery.of(context).size.height;
              double y = h - (_floaters[i].value * (h + 100));
              return Positioned(
                left: [0.1, 0.3, 0.5, 0.7, 0.85, 0.2, 0.6][i] * MediaQuery.of(context).size.width,
                top: y,
                child: Opacity(
                  opacity: 0.03,
                  child: Text(
                    ["🌱", "🐟", "🐓", "🐖", "🌿", "🦆", "🌾"][i],
                    style: TextStyle(fontSize: [60, 30, 50, 40, 55, 35, 45][i].toDouble()),
                  ),
                ),
              );
            },
          )),
          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 60),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 25),
                    _buildBudgetHero(),
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "SAFIDY STRATEGIE",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildStrategyScroll(),
                    const SizedBox(height: 20),
                    if (_strat == 'std') ...[
                      _buildStandardControls(),
                      const SizedBox(height: 15),
                      _buildSettingsGrid(),
                      const SizedBox(height: 20),
                      _buildDescription(),
                      const SizedBox(height: 20),
                      _buildStatsGrid(),
                      const SizedBox(height: 25),
                    ],
                    _buildActionButton(),
                    if (_showResults) _buildResultsCard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGETS ---
  Widget _buildHeader() {
    return Column(
      children: [
        const Text(
          "MADA AGRI",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
            color: Color(0xFF000000),
            shadows: [Shadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 2))],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "TOMBONY ANALYZER",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Color(0xFF000000),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.glassBorder, width: 1),
          ),
          child: Row(children: [_tabItem('fambolena', "FAMBOLENA"), _tabItem('fiompiana', "FIOMPIANA")]),
        ),
      ],
    );
  }

  Widget _buildBudgetHero() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(15, 23, 42, 0.6),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 15, spreadRadius: 0, offset: Offset(0, 15)),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "VOLA AMPIASAINA (ARIARY)",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: Color(0xFFCBD5E1),
            ),
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: TextField(
                      controller: _budgetController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF8D6E63),
                        shadows: [Shadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 2))],
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (v) => _runCalculation(false),
                    ),
                  ),
                ),
              );
            },
          ),
          if (_strat == 'std') ...[
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.1))),
              ),
              child: _buildQuickInsights(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildQuickInsights() {
    final insights = _mode == 'fambolena'
        ? [
            {'icon': '⚡', 'label': 'Haingana', 'value': 'Anana, Salade'},
            {'icon': '🐢', 'label': 'Maharitra', 'value': 'Voasary, Manioc'},
            {'icon': '💰', 'label': 'Vola be', 'value': 'Voatabia, Oignon'},
          ]
        : [
            {'icon': '⚡', 'label': 'Haingana', 'value': 'Akoho Chair, Papelika'},
            {'icon': '🐢', 'label': 'Maharitra', 'value': 'Kisoa, Omby'},
            {'icon': '💰', 'label': 'Vola be', 'value': 'Foie Gras, Kisoa'},
          ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: insights.map((item) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFA1887F), Color(0xFF8D6E63)],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.05), width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(item['icon']!, style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 6),
              Text(
                '${item['label']}: ',
                style: const TextStyle(fontSize: 11, color: Color(0xFF000000), fontWeight: FontWeight.w700),
              ),
              Text(
                item['value']!,
                style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStrategyScroll() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _stratChip('std', "👤 Iray ihany", false),
            _stratChip('mix3', "🌱 Milpa (Mix 3)", true),
            _stratChip('fish', "🐟 Vary + Trondro", true),
            _stratChip('duck', "🦆 Katsaka + Gana", true),
            _stratChip('random', "🎲 Mix Aléatoire", true),
          ],
        ),
      ),
    );
  }

  Widget _stratChip(String id, String label, bool isMix) {
    bool active = _strat == id;
    return GestureDetector(
      onTap: () => setState(() { _strat = id; if(id=='std') _updateMatContext(); else _showResults=false; }),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: active 
              ? (isMix ? AppColors.accentPurple : Colors.white) 
              : const Color.fromRGBO(15, 23, 42, 0.7),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: active 
                ? (isMix ? AppColors.accentPurple : Colors.white)
                : AppColors.glassBorder,
            width: 1,
          ),
          boxShadow: active ? [
            const BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 4)),
          ] : null,
        ),
        child: Text(
          label, 
          style: TextStyle(
            fontSize: 12, 
            fontWeight: active ? FontWeight.w800 : FontWeight.w600,
            color: active 
                ? (isMix ? Colors.white : const Color(0xFF064E3B))
                : const Color(0xFFCBD5E1),
          ),
        ),
      ),
    );
  }

  Widget _buildStandardControls() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF78909C), Color(0xFF546E7A)],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.glassBorder, width: 1),
          boxShadow: const [
            BoxShadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 8)),
          ],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: database[_mode]!.containsKey(_selectedKey) ? _selectedKey : database[_mode]!.keys.first,
            isExpanded: true,
            dropdownColor: const Color(0xFF546E7A),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
            items: _buildGroupedDropdownItems(),
            onChanged: (v) => setState(() { _selectedKey = v!; _updateMatContext(); }),
          ),
        ),
      )
    ]);
  }

  Widget _tabItem(String id, String label) {
    bool active = _mode == id;
    Color activeBg = id == 'fambolena' ? AppColors.primaryGreen : AppColors.primaryOrange;
    
    return Expanded(child: GestureDetector(
      onTap: () => setState(() { _mode = id; _selectedKey = database[id]!.keys.first; _updateMatContext(); }),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: active ? activeBg : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: active ? [
            BoxShadow(
              color: activeBg.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ] : null,
        ),
        child: Text(
          label, 
          textAlign: TextAlign.center, 
          style: TextStyle(
            fontSize: 13, 
            fontWeight: FontWeight.w700, 
            color: active ? const Color(0xFF0C4A6E) : const Color(0xFF000000),
          ),
        ),
      ),
    ));
  }

  Widget _buildSettingsGrid() {
    return Row(
      children: [
        Expanded(
          child: _settingCard(
            "👷 MPIASA",
            DropdownButton<double>(
              value: _laborFactor,
              dropdownColor: const Color(0xFF546E7A),
              isExpanded: true,
              underline: Container(),
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
              items: const [
                DropdownMenuItem(value: 1.0, child: Text("Karama (100%)", style: TextStyle(color: Colors.white))),
                DropdownMenuItem(value: 0.5, child: Text("Fanampiana (50%)", style: TextStyle(color: Colors.white))),
                DropdownMenuItem(value: 0.0, child: Text("Asa Tena (0%)", style: TextStyle(color: Colors.white))),
              ],
              onChanged: (v) => setState(() {
                _laborFactor = v!;
                _runCalculation(false);
              }),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _settingCard(
            _mode == 'fambolena'
                ? "🚜 FITAOVANA"
                : (_selectedKey.contains('Tantely') ? "🌳 TONTOLO" : "🥣 SAKAFO"),
            DropdownButton<String>(
              value: _matType,
              dropdownColor: const Color(0xFF546E7A),
              isExpanded: true,
              underline: Container(),
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
              items: _getMatOptions()
                  .map((e) => DropdownMenuItem(value: e['k'], child: Text(e['v']!, style: const TextStyle(color: Colors.white))))
                  .toList(),
              onChanged: (v) => setState(() {
                _matType = v!;
                _runCalculation(false);
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _settingCard(String lbl, Widget child) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF78909C), Color(0xFF546E7A)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 8)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lbl,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Color(0xFF000000),
            ),
          ),
          const SizedBox(height: 5),
          child,
        ],
      ),
    );
  }

  Widget _buildDescription() {
    String descLabor = _laborFactor == 1.0
        ? "Karama feno + Sakafo antoandro."
        : _laborFactor == 0.5
            ? "Fianakaviana na Namana (Valin-tanana)."
            : "Hery manokana (Tsy mamoaka vola).";

    String descMat = "";
    if (_mode == 'fambolena') {
      if (_matType == 'angady') {
        descMat = "Miasa tany marivo. Mora. Standard.";
      } else if (_matType == 'angadinomby') {
        descMat = "Miditra lalina, mivadika ny tany (+10% Vokatra).";
      } else {
        descMat = "Tany vaky madinika, masaka tsara (+25% Vokatra).";
      }
    } else if (_selectedKey.contains('Tantely')) {
      if (_matType == 'ala') {
        descMat = "Toerana be voninkazo (Eucalyptus/Litchi). Vokatra tsara (+30%).";
      } else if (_matType == 'tanana') {
        descMat = "Vitsy ny voninkazo. Vokatra somary kely (-10%).";
      } else {
        descMat = "Sakafo ririnina. Miaro ny tantely tsy ho faty.";
      }
    } else {
      if (_matType == 'low') {
        descMat = "Sisa-sakafo, bozaka. Miadana ny fitomboana (-25%).";
      } else if (_matType == 'mid') {
        descMat = "Provende Ferme: Afangaro an-trano (Katsaka+CMV).";
      } else if (_matType == 'pro') {
        descMat = "Granulés Standard. Voalanjalanja, haingana (+15%).";
      } else {
        descMat = "Granulés Importé. Faran'izay haingana (+35%).";
      }
    }

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF78909C), Color(0xFF546E7A)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "MPIASA",
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    color: AppColors.accentBlue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  descLabor,
                  style: const TextStyle(fontSize: 11, color: Colors.white, height: 1.35),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _mode == 'fambolena' ? "FITAOVANA" : (_selectedKey.contains('Tantely') ? "TONTOLO" : "SAKAFO"),
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    color: AppColors.accentBlue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  descMat,
                  style: const TextStyle(fontSize: 11, color: Colors.white, height: 1.35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    final item = database[_mode]![_selectedKey]!;
    final res = _getCost(item, _laborFactor, _matType, _mode == 'fambolena');

    return Row(
      children: [
        Expanded(
          child: _statCard(
            "MASON-KARENA",
            "${NumberFormat.currency(locale: 'fr_FR', symbol: '', decimalDigits: 0).format(res['total'])} Ar",
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statCard(
            "VOKATRA",
            "${NumberFormat.currency(locale: 'fr_FR', symbol: '', decimalDigits: 0).format((item.rev * res['bonus']).toDouble())} Ar",
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 12, 5, 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFA1887F), Color(0xFF6D4C41)],
              ),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: Column(
              children: [
                const Text(
                  "FAHARETANY",
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFCBD5E1),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  "${item.weeks}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 3),
                const Text(
                  "Herinandro (Semaines)",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFCBD5E1),
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _statCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 12, 5, 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFA1887F), Color(0xFF6D4C41)],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: Color(0xFFCBD5E1),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    String label = _strat == 'random' ? "GENERER UN MIX ALEATOIRE" : (_strat == 'std' ? "KAJIO NY TOMBONY" : "KAJIO NY MIX");
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF87CEEB), Color(0xFF00BFFF)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00BFFF).withValues(alpha: 0.3),
            blurRadius: 25,
            spreadRadius: -5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (_strat == 'random') _generateRandomMix(); else _runCalculation(true);
          },
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              label, 
              style: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w800, 
                letterSpacing: 1.5,
                color: Color(0xFF0F172A),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultsCard() {
    final fmt = NumberFormat.currency(locale: 'fr_FR', symbol: 'Ar', decimalDigits: 0);
    
    return Container(
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.glassBorder),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 50, offset: Offset(0, 20), spreadRadius: -10),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.5),
                radius: 1.2,
                colors: [
                  AppColors.primaryGreen.withValues(alpha: 0.1),
                  Colors.transparent,
                ],
              ),
              border: const Border(
                bottom: BorderSide(color: AppColors.glassBorder, style: BorderStyle.solid),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  "TOMBONY MADIO (NET PROFIT)",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF94A3B8),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  fmt.format(_resProfit),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF00D4FF),
                    shadows: [
                      Shadow(color: Color.fromRGBO(0, 212, 255, 0.3), blurRadius: 40),
                    ],
                  ),
                ),
                if (_mixTitle.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    _mixTitle,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: _kpi("ROI", "+${_resROI.toStringAsFixed(0)}%", AppColors.primaryGreen)),
                    const SizedBox(width: 20),
                    Expanded(child: _kpi("VOLA NIVOAKA", fmt.format(_resInvest), Colors.white)),
                    const SizedBox(width: 20),
                    Expanded(child: _kpi("HABE / ISA", _resQty, Colors.white)),
                  ],
                ),
              ],
            ),
          ),
          // Tip
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(96, 165, 250, 0.1),
                border: const Border(left: BorderSide(color: AppColors.accentBlue, width: 3)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                _tipText.isNotEmpty 
                    ? (_mixTitle.isNotEmpty ? "💡 Mix: $_mixTitle" : "💡 Torohevitra: $_tipText")
                    : "💡 Calculer pour voir les conseils",
                style: const TextStyle(fontSize: 12, color: Color(0xFFBFDBFE), height: 1.5),
              ),
            ),
          ),
          // Breakdown
          Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            child: Column(
              children: _breakdown.map((e) => _bar(e, _resInvest, fmt)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _kpi(String label, String value, Color color) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: Color(0xFFCBD5E1),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w700, 
                color: color,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bar(BreakdownItem item, double total, NumberFormat fmt) {
    double pct = total > 0 ? (item.val / total) : 0;
    bool isMix = _strat != 'std';
    
    if (isMix) {
      // Mix item style (from HTML)
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(10),
          border: Border(
            left: BorderSide(
              color: item.color,
              width: 3,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.icon, // In mix mode, icon contains the quantity string
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "+${fmt.format(item.val)}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryGreen,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      );
    }
    
    // Standard bar style
    String valStr = fmt.format(item.val);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (item.icon.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Text(item.icon, style: const TextStyle(fontSize: 14)),
                    ),
                  Text(
                    item.label,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFE2E8F0)),
                  ),
                ],
              ),
              Text(
                valStr,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 6,
              child: LinearProgressIndicator(
                value: pct.clamp(0.0, 1.0),
                backgroundColor: Colors.white.withValues(alpha: 0.08),
                valueColor: AlwaysStoppedAnimation<Color>(item.color),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildGroupedDropdownItems() {
    final items = <DropdownMenuItem<String>>[];
    final groups = <String, List<String>>{};
    
    // Group items by category
    for (var entry in database[_mode]!.entries) {
      final cat = entry.value.cat.isEmpty ? 'Autres' : entry.value.cat;
      if (!groups.containsKey(cat)) groups[cat] = [];
      groups[cat]!.add(entry.key);
    }
    
    // Build dropdown items with category headers
    for (var category in groups.keys) {
      // Add category header (disabled)
      items.add(
        DropdownMenuItem<String>(
          value: null,
          enabled: false,
          child: Text(
            category.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A237E),
            ),
          ),
        ),
      );
      
      // Add items in this category
      for (var itemKey in groups[category]!) {
        items.add(
          DropdownMenuItem<String>(
            value: itemKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(itemKey),
            ),
          ),
        );
      }
    }
    
    return items;
  }

  List<Map<String, String>> _getMatOptions() {
    if (_mode == 'fambolena') {
      return [
        {'k': 'angady', 'v': 'Asa Tànana (Angady)'},
        {'k': 'angadinomby', 'v': 'Asa Omby (Charrue)'},
        {'k': 'kubota', 'v': 'Masinina (Kubota)'}
      ];
    }
    if (_selectedKey.contains('Tantely')) {
      return [
        {'k': 'ala', 'v': '🌲 Ala / Voninkazo'},
        {'k': 'tanana', 'v': '🏡 Tanàna / Zavaha'},
        {'k': 'siramamy', 'v': '🍬 Fanampiana (Sirop)'}
      ];
    }
    return [
      {'k': 'low', 'v': 'Low Cost (Mora)'},
      {'k': 'mid', 'v': 'Middle Range (Antonony)'},
      {'k': 'pro', 'v': 'Pro (Avo Lenta)'},
      {'k': 'max', 'v': 'Pro Max (Tena Raitra)'}
    ];
  }
}

// ==========================================
// 5. HELPER CLASSES
// ==========================================
class BreakdownItem {
  final String label;
  final double val;
  final Color color;
  final String icon;

  BreakdownItem(this.label, this.val, this.color, this.icon);
}

class MixObj {
  final String k;
  final String m;
  final double b;

  MixObj(this.k, this.m, this.b);
}