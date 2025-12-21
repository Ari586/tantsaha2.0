import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// --- DATA MODEL ---
class AgriItem {
  final double cost; // c
  final double rev; // r
  final int weeks; // w
  final List<double> ratio; // [Seed, Feed, Labor]
  final String cat;
  final int risk; // 0: Safe, 1: Med, 2: High

  const AgriItem({
    required this.cost,
    required this.rev,
    required this.weeks,
    required this.ratio,
    this.cat = '',
    this.risk = 0,
  });
}

// --- DATABASE (V13.5 Complete) ---
final Map<String, Map<String, AgriItem>> database = {
  'fambolena': {
    "Vary Antanety (Pluvial)": const AgriItem(cost: 200, rev: 500, weeks: 20, ratio: [0.15, 0.35, 0.50], cat: "Céréales"),
    "Vary Anaty Rano (Irrigué)": const AgriItem(cost: 250, rev: 600, weeks: 22, ratio: [0.10, 0.40, 0.50], cat: "Céréales"),
    "Katsaka (Maïs)": const AgriItem(cost: 120, rev: 350, weeks: 16, ratio: [0.10, 0.40, 0.50], cat: "Céréales"),
    "Mangahazo (Manioc)": const AgriItem(cost: 80, rev: 280, weeks: 36, ratio: [0.15, 0.05, 0.80], cat: "Tubercules"),
    "Vomanga (Patate douce)": const AgriItem(cost: 100, rev: 350, weeks: 16, ratio: [0.1, 0.1, 0.8], cat: "Tubercules"),
    "Ovy (Pomme de terre)": const AgriItem(cost: 600, rev: 1800, weeks: 14, ratio: [0.4, 0.3, 0.3], cat: "Tubercules", risk: 1),
    "Saonjo": const AgriItem(cost: 150, rev: 450, weeks: 24, ratio: [0.2, 0.3, 0.5], cat: "Tubercules"),
    "Sakamalao (Gingembre)": const AgriItem(cost: 800, rev: 3000, weeks: 40, ratio: [0.5, 0.2, 0.3], cat: "Racines", risk: 1),
    "Karoty": const AgriItem(cost: 250, rev: 950, weeks: 14, ratio: [0.15, 0.35, 0.5], cat: "Racines", risk: 1),
    "Tsaramaso (Haricot)": const AgriItem(cost: 200, rev: 650, weeks: 12, ratio: [0.3, 0.2, 0.5], cat: "Légumineuses", risk: 1),
    "Voanjo (Arachide)": const AgriItem(cost: 180, rev: 550, weeks: 16, ratio: [0.25, 0.25, 0.5], cat: "Légumineuses", risk: 1),
    "Voanjobory": const AgriItem(cost: 250, rev: 850, weeks: 20, ratio: [0.2, 0.3, 0.5], cat: "Légumineuses", risk: 1),
    "Voatabia (Standard)": const AgriItem(cost: 500, rev: 1800, weeks: 14, ratio: [0.1, 0.4, 0.5], cat: "Légumes Fruit", risk: 2),
    "Sakay (Piment)": const AgriItem(cost: 400, rev: 1600, weeks: 16, ratio: [0.05, 0.45, 0.5], cat: "Légumes Fruit", risk: 2),
    "Angivy": const AgriItem(cost: 200, rev: 600, weeks: 14, ratio: [0.1, 0.4, 0.5], cat: "Légumes Fruit", risk: 1),
    "Baranjely (Aubergine)": const AgriItem(cost: 300, rev: 900, weeks: 16, ratio: [0.1, 0.4, 0.5], cat: "Légumes Fruit", risk: 1),
    "Voatavo (Citrouille)": const AgriItem(cost: 100, rev: 400, weeks: 16, ratio: [0.1, 0.2, 0.7], cat: "Légumes Fruit"),
    "Anana (Brèdes Mix)": const AgriItem(cost: 100, rev: 450, weeks: 6, ratio: [0.1, 0.5, 0.4], cat: "Feuilles", risk: 1),
    "Petsay": const AgriItem(cost: 150, rev: 600, weeks: 8, ratio: [0.1, 0.5, 0.4], cat: "Feuilles", risk: 1),
    "Salady": const AgriItem(cost: 200, rev: 800, weeks: 8, ratio: [0.15, 0.45, 0.4], cat: "Feuilles", risk: 1),
    "Tongolo (Oignon)": const AgriItem(cost: 350, rev: 1300, weeks: 18, ratio: [0.3, 0.4, 0.3], cat: "Bulbes", risk: 1),
    "Tongolo Gasy (Ail)": const AgriItem(cost: 500, rev: 1600, weeks: 20, ratio: [0.4, 0.3, 0.3], cat: "Bulbes", risk: 1),
    "Voasary (Agrumes)": const AgriItem(cost: 500, rev: 2000, weeks: 150, ratio: [0.5, 0.2, 0.3], cat: "Arbres"),
  },
  'fiompiana': {
    "Trondro (HORS SOL - Bassin)": const AgriItem(cost: 4500, rev: 9500, weeks: 24, ratio: [0.1, 0.7, 0.2], cat: "Poissons", risk: 2),
    "Trondro (Etang/Dobo Tany)": const AgriItem(cost: 3500, rev: 7000, weeks: 24, ratio: [0.2, 0.7, 0.1], cat: "Poissons", risk: 1),
    "Trondro (Tilapia)": const AgriItem(cost: 3500, rev: 7000, weeks: 24, ratio: [0.2, 0.7, 0.1], cat: "Poissons", risk: 1),
    "Akoho Gasy": const AgriItem(cost: 15000, rev: 25000, weeks: 16, ratio: [0.6, 0.3, 0.1], cat: "Volailles"),
    "Akoho Chair": const AgriItem(cost: 14000, rev: 19000, weeks: 7, ratio: [0.25, 0.65, 0.1], cat: "Volailles", risk: 1),
    "Gana (Canard)": const AgriItem(cost: 18000, rev: 32000, weeks: 14, ratio: [0.3, 0.6, 0.1], cat: "Volailles"),
    "Dokotra (Barbarie)": const AgriItem(cost: 25000, rev: 48000, weeks: 20, ratio: [0.3, 0.6, 0.1], cat: "Volailles"),
    "Sarindokotra (Foie Gras)": const AgriItem(cost: 60000, rev: 120000, weeks: 15, ratio: [0.3, 0.6, 0.1], cat: "Volailles", risk: 2),
    "Gisa (Oie)": const AgriItem(cost: 30000, rev: 65000, weeks: 24, ratio: [0.4, 0.5, 0.1], cat: "Volailles"),
    "Vorontsiloza (Dinde)": const AgriItem(cost: 40000, rev: 95000, weeks: 24, ratio: [0.4, 0.5, 0.1], cat: "Volailles", risk: 1),
    "Akanga (Pintade)": const AgriItem(cost: 20000, rev: 35000, weeks: 20, ratio: [0.4, 0.5, 0.1], cat: "Volailles", risk: 1),
    "Papelika (Caille)": const AgriItem(cost: 3000, rev: 5000, weeks: 6, ratio: [0.3, 0.6, 0.1], cat: "Volailles", risk: 1),
    "Kisoa (Porc)": const AgriItem(cost: 400000, rev: 750000, weeks: 20, ratio: [0.35, 0.6, 0.05], cat: "Mammifères", risk: 1),
    "Bitro (Lapin)": const AgriItem(cost: 12000, rev: 25000, weeks: 12, ratio: [0.4, 0.5, 0.1], cat: "Mammifères", risk: 1),
    "Bitro Voalavo": const AgriItem(cost: 4000, rev: 10000, weeks: 10, ratio: [0.3, 0.6, 0.1], cat: "Mammifères"),
    "Tantely (Abeilles)": const AgriItem(cost: 150000, rev: 350000, weeks: 52, ratio: [0.8, 0.1, 0.1], cat: "Insectes", risk: 1),
    "Olitra (BSF)": const AgriItem(cost: 50000, rev: 150000, weeks: 4, ratio: [0.5, 0.2, 0.3], cat: "Insectes"),
  },
};

// --- STYLES & COLORS ---
const kGreenGrad = LinearGradient(colors: [Color(0xFF22C55E), Color(0xFF16A34A)]);
const kOrangeGrad = LinearGradient(colors: [Color(0xFFF97316), Color(0xFFFFAB40)]);
const kBlueGrad = LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF00B0FF)]);
const kMixGrad = LinearGradient(colors: [Color(0xFF6366F1), Color(0xFFA855F7)]);
const kBgColor = Color(0xFF0F172A);
const kCardColor = Color(0xFF1E293B);
const kBorderColor = Color(0xFF334155);
const kMutedColor = Color(0xFF94A3B8);

// ==========================================
// WIDGET PRINCIPAL : A IMPORTER DANS TON APP
// ==========================================
class TombonyAnalyzerPage extends StatefulWidget {
  const TombonyAnalyzerPage({super.key});

  @override
  State<TombonyAnalyzerPage> createState() => _TombonyAnalyzerPageState();
}

class _TombonyAnalyzerPageState extends State<TombonyAnalyzerPage> {
  // State
  final TextEditingController _budgetController = TextEditingController(text: "1000000");
  String _mode = 'fambolena';
  String _strat = 'std';
  String _selectedKey = "Vary Antanety (Pluvial)";
  bool _swMat = false;
  bool _swLabor = false;
  bool _showResults = false;

  final _formatter = NumberFormat.currency(locale: 'fr_MG', symbol: 'Ar', decimalDigits: 0);

  // Core Logic (Exact copy of JS)
  double getRealCost(AgriItem item, String m) {
    double c = item.cost;
    // Discount Material (5% Fiom, 15% Fam)
    if (_swMat) {
      c -= item.cost * (m == 'fambolena' ? 0.15 : 0.05);
    }
    // Discount Labor (Ratio index 2)
    if (_swLabor) {
      c -= item.cost * item.ratio[2];
    }
    return c > 0 ? c : item.cost * 0.1;
  }

  @override
  Widget build(BuildContext context) {
    // Force Dark Theme for this specific page to keep design consistency
    return Theme(
      data: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBgColor,
        cardColor: kCardColor,
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
          bodyColor: const Color(0xFFF8FAFC),
          displayColor: const Color(0xFFF8FAFC),
        ),
      ),
      child: Scaffold(
        backgroundColor: kBgColor,
        appBar: AppBar(
          backgroundColor: kBgColor,
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF22C55E), Color(0xFF3B82F6)]
                ).createShader(bounds),
                child: Text("TOMBONY ANALYZER PRO", 
                  style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white)
                ),
              ),
              const SizedBox(height: 2),
              Text("MANAGER ULTIME", style: TextStyle(fontSize: 10, color: kMutedColor, letterSpacing: 2)),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: kBorderColor, height: 1),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // BUDGET
              _buildBudgetInput(),
              const SizedBox(height: 20),

              // STRATEGIES
              Text("SAFIDY HAINGANA (STRATEGIES)", style: _labelStyle()),
              const SizedBox(height: 8),
              _buildStrategyBar(),
              const SizedBox(height: 20),

              // PANEL (Conditional)
              if (_strat == 'std') ...[
                _buildStandardControls(),
              ],

              // SWITCHES
              const SizedBox(height: 20),
              _buildOptions(),

              // ACTION BUTTON
              const SizedBox(height: 25),
              _buildActionButton(),

              // RESULTS
              if (_showResults) ...[
                const SizedBox(height: 30),
                _strat == 'std' ? _buildStandardResults() : _buildMixResults(),
              ],
              
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildBudgetInput() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("VOLA AMPIASAINA (AR)", style: _labelStyle()),
          TextField(
            controller: _budgetController,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            decoration: const InputDecoration(border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.only(top: 5)),
            onChanged: (v) => setState(() => _showResults = false),
          ),
        ],
      ),
    );
  }

  Widget _buildStrategyBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _stratBtn('std', '👤 Iray ihany'),
          const SizedBox(width: 8),
          _stratBtn('mix3', '🌱 Mix 3 (Milpa)', isMix: true),
          const SizedBox(width: 8),
          _stratBtn('fish', '🐟 Vary+Trondro', isMix: true),
          const SizedBox(width: 8),
          _stratBtn('horssol', '💧 Hors-Sol', isMix: true),
          const SizedBox(width: 8),
          _stratBtn('duck', '🦆 Katsaka+Gana', isMix: true),
          const SizedBox(width: 8),
          _stratBtn('mix2', '🔄 Mix 2 (Auto)', isMix: true),
        ],
      ),
    );
  }

  Widget _stratBtn(String id, String label, {bool isMix = false}) {
    bool active = _strat == id;
    return GestureDetector(
      onTap: () => setState(() {
        _strat = id;
        _showResults = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: active ? (isMix ? null : Colors.white) : kCardColor,
          gradient: (active && isMix) ? kMixGrad : null,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: active ? Colors.transparent : kBorderColor),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12, 
            fontWeight: FontWeight.w600, 
            color: active ? (isMix ? Colors.white : Colors.black) : kMutedColor
          ),
        ),
      ),
    );
  }

  Widget _buildStandardControls() {
    AgriItem item = database[_mode]![_selectedKey] ?? database[_mode]!.values.first;
    double realCost = getRealCost(item, _mode);

    return Column(
      children: [
        // Tabs
        Row(
          children: [
            Expanded(child: _modeTab('fambolena', '🌱 FAMBOLENA')),
            const SizedBox(width: 10),
            Expanded(child: _modeTab('fiompiana', '🐔 FIOMPIANA')),
          ],
        ),
        const SizedBox(height: 15),
        
        // Dropdown
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(color: kCardColor, borderRadius: BorderRadius.circular(12), border: Border.all(color: kBorderColor)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedKey,
              isExpanded: true,
              dropdownColor: kCardColor,
              items: _buildDropdownItems(),
              onChanged: (val) {
                if (val != null) setState(() { _selectedKey = val; _showResults = false; });
              },
            ),
          ),
        ),
        const SizedBox(height: 15),

        // Info Grid
        Row(
          children: [
            _infoBox("MASON-KARENA", _formatter.format(realCost), _mode == 'fambolena' ? "Ar / m²" : "Ar / Biby"),
            const SizedBox(width: 8),
            _infoBox("MIDITRA (REV)", _formatter.format(item.rev), _mode == 'fambolena' ? "Ar / m²" : "Ar / Biby"),
            const SizedBox(width: 8),
            _infoBox("FAHARETANY", "${item.weeks} Sem", "Herinandro"),
          ],
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    // Group by category
    Map<String, List<String>> groups = {};
    database[_mode]!.forEach((key, value) {
      if (!groups.containsKey(value.cat)) groups[value.cat] = [];
      groups[value.cat]!.add(key);
    });

    groups.forEach((cat, keys) {
      items.add(DropdownMenuItem(
        enabled: false, 
        value: "HEADER_$cat",
        child: Text(cat.toUpperCase(), style: TextStyle(color: kMutedColor, fontStyle: FontStyle.italic, fontSize: 12))
      ));
      for (var k in keys) {
        items.add(DropdownMenuItem(
          value: k,
          child: Text(k, style: const TextStyle(color: Colors.white)),
        ));
      }
    });
    return items;
  }

  Widget _modeTab(String id, String label) {
    bool active = _mode == id;
    Color bg = active ? (id == 'fambolena' ? const Color(0xFF22C55E) : const Color(0xFFF97316)) : const Color(0xFF0F172A);
    Color txt = active ? Colors.black : kMutedColor;
    
    return GestureDetector(
      onTap: () => setState(() {
        _mode = id;
        _selectedKey = database[id]!.keys.first;
        _showResults = false;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10), border: Border.all(color: active ? Colors.transparent : kBorderColor)),
        child: Center(child: Text(label, style: TextStyle(color: txt, fontWeight: FontWeight.bold, fontSize: 13))),
      ),
    );
  }

  Widget _infoBox(String label, String val, String unit) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Column(
          children: [
            Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(val, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
            Text(unit, style: const TextStyle(fontSize: 9, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildOptions() {
    return Row(
      children: [
        _optionSwitch('mat', '🛠️ Fitaovana', 'Hindrana (Tsy vidiana)', _swMat),
        const SizedBox(width: 10),
        _optionSwitch('labor', '💪 Asa Tena', 'Tsy mampiasa olona', _swLabor),
      ],
    );
  }

  Widget _optionSwitch(String id, String title, String sub, bool active) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          if (id == 'mat') _swMat = !_swMat;
          if (id == 'labor') _swLabor = !_swLabor;
          _showResults = false;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF22C55E).withValues(alpha: 0.1) : kCardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: active ? const Color(0xFF22C55E) : kBorderColor),
          ),
          child: Row(
            children: [
              Container(
                width: 16, height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active ? const Color(0xFF22C55E) : null,
                  border: Border.all(color: active ? const Color(0xFF22C55E) : kMutedColor, width: 2),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    Text(sub, style: TextStyle(fontSize: 10, color: kMutedColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    bool isMix = _strat != 'std';
    return GestureDetector(
      onTap: () => setState(() => _showResults = true),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          gradient: isMix ? kMixGrad : kGreenGrad,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: (isMix ? const Color(0xFF6366F1) : const Color(0xFF22C55E)).withValues(alpha: 0.4),
              blurRadius: 15, offset: const Offset(0, 4)
            )
          ]
        ),
        child: Center(
          child: Text(
            isMix ? "KAJIO NY MIX" : "KAJIO NY TOMBONY",
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }

  // --- RESULTS ---

  Widget _buildStandardResults() {
    double budget = double.tryParse(_budgetController.text) ?? 0;
    AgriItem item = database[_mode]![_selectedKey]!;
    double cost = getRealCost(item, _mode);
    int qty = (budget / cost).floor();
    double invest = qty * cost;
    double rev = qty * item.rev;
    double profit = rev - invest;
    double roi = invest > 0 ? (profit / invest) * 100 : 0;
    String unit = _mode == 'fambolena' ? 'm²' : 'Isa';

    // Breakdown
    double raw = qty * item.cost;
    double c1 = raw * item.ratio[0];
    double c2 = raw * item.ratio[1];
    double c3 = _swLabor ? 0 : raw * item.ratio[2];

    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kBorderColor),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Text("TOMBONY AZO (BENEFICE)", style: _labelStyle()),
          Text(_formatter.format(profit), style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: const Color(0xFF22C55E))),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _resCell("HABE / ISA", "$qty $unit"),
              _resCell("ROI %", "+${roi.toStringAsFixed(0)}%"),
              _resCell("INVEST", _formatter.format(invest)),
              _resCell("FOTOANA", "${item.weeks} Sem"),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: kBorderColor),
          const SizedBox(height: 10),
          _barRow(_mode == 'fambolena' ? "Masomboly" : "Achat", c1, invest, const Color(0xFF60A5FA)),
          _barRow(_mode == 'fambolena' ? "Zezika" : "Sakafo", c2, invest, const Color(0xFFC084FC)),
          _barRow("Asa & Fitaovana", c3, invest, const Color(0xFFFB923C)),
        ],
      ),
    );
  }

  Widget _resCell(String label, String val) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 10, color: kMutedColor)),
        const SizedBox(height: 2),
        Text(val, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _barRow(String label, double val, double total, Color color) {
    double pct = total > 0 ? (val / total) : 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 12)),
              Text(_formatter.format(val), style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(value: pct, backgroundColor: const Color(0xFF0F172A), color: color, minHeight: 8),
          ),
        ],
      ),
    );
  }

  Widget _buildMixResults() {
    double budget = double.tryParse(_budgetController.text) ?? 0;
    List<Map<String, dynamic>> items = [];
    String title = "";
    String desc = "";

    if (_strat == 'mix3') {
      title = "🌱 MIX 3 (MILPA)"; desc = "Katsaka + Tsaramaso + Voatavo";
      double b = budget / 3;
      items = [
        {'k': "Katsaka (Maïs)", 'm': 'fambolena', 'b': b},
        {'k': "Tsaramaso (Haricot)", 'm': 'fambolena', 'b': b},
        {'k': "Voatavo (Citrouille)", 'm': 'fambolena', 'b': b},
      ];
    } else if (_strat == 'fish') {
      title = "🐟 VARY + TRONDRO"; desc = "Vary (70%) + Trondro (30%)";
      items = [
        {'k': "Vary Anaty Rano (Irrigué)", 'm': 'fambolena', 'b': budget * 0.7},
        {'k': "Trondro (Etang/Dobo Tany)", 'm': 'fiompiana', 'b': budget * 0.3},
      ];
    } else if (_strat == 'horssol') {
      title = "💧 HORS-SOL (INTENSIF)"; desc = "Elevage Piscicole sur bâche";
      items = [
        {'k': "Trondro (HORS SOL - Bassin)", 'm': 'fiompiana', 'b': budget},
      ];
    } else if (_strat == 'duck') {
      title = "🦆 KATSAKA + GANA"; desc = "Katsaka (60%) + Gana (40%)";
      items = [
        {'k': "Katsaka (Maïs)", 'm': 'fambolena', 'b': budget * 0.6},
        {'k': "Gana (Canard)", 'm': 'fiompiana', 'b': budget * 0.4},
      ];
    } else {
      title = "🔄 MIX AUTO"; desc = "Katsaka (50%) + Akoho (50%)";
      items = [
        {'k': "Katsaka (Maïs)", 'm': 'fambolena', 'b': budget * 0.5},
        {'k': "Akoho Chair", 'm': 'fiompiana', 'b': budget * 0.5},
      ];
    }

    double totProfit = 0;
    double totInvest = 0;
    List<Widget> rows = [];

    for (var i in items) {
      String mode = i['m'];
      String key = i['k'];
      double b = i['b'];
      AgriItem item = database[mode]![key]!;
      double cost = getRealCost(item, mode);
      int qty = (b / cost).floor();
      double inv = qty * cost;
      double prof = (qty * item.rev) - inv;
      totProfit += prof;
      totInvest += inv;
      
      String unit = mode == 'fambolena' ? 'm²' : 'Isa';
      Color borderCol = mode == 'fambolena' ? const Color(0xFF22C55E) : const Color(0xFFF97316);

      rows.add(Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(10),
          border: Border(left: BorderSide(color: borderCol, width: 3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(key, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("Habe: $qty $unit | ${item.weeks} Sem", style: TextStyle(fontSize: 11, color: kMutedColor)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("+${_formatter.format(prof)}", style: TextStyle(color: borderCol, fontWeight: FontWeight.bold)),
                Text("Inv: ${_formatter.format(inv)}", style: TextStyle(fontSize: 10, color: kMutedColor)),
              ],
            )
          ],
        ),
      ));
    }

    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFA855F7)),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Text(title, style: _labelStyle()),
          Text(_formatter.format(totProfit), style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: Color(0xFFA855F7))),
          Text(desc, style: TextStyle(fontSize: 12, color: kMutedColor)),
          const SizedBox(height: 20),
          ...rows,
          const Divider(color: kBorderColor),
          Align(
            alignment: Alignment.centerRight,
            child: Text("TOTAL INVEST : ${_formatter.format(totInvest)}", style: const TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: kMutedColor, letterSpacing: 0.5);
  }
}
