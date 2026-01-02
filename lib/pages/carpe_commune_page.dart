import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CarpeCommunePage extends StatefulWidget {
  const CarpeCommunePage({super.key});

  @override
  State<CarpeCommunePage> createState() => _CarpeCommunePageState();
}

class _CarpeCommunePageState extends State<CarpeCommunePage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      );
    
    // Load content immediately without images first
    _controller.loadHtmlString(_htmlContent);
    
    // Then load images and update
    _loadHtmlWithImages();
  }

  Future<void> _loadHtmlWithImages() async {
    String royaleBase64 = await _assetToBase64('assets/images/royale.png');
    String communeBase64 = await _assetToBase64('assets/images/commune.png');
    String chinoiseBase64 = await _assetToBase64('assets/images/chinoise.png');

    String html = _htmlContent;

    if (royaleBase64.isNotEmpty) {
      html = html.replaceFirst('<!-- ROYALE_IMAGE -->', '<img src="data:image/png;base64,$royaleBase64" class="w-full h-full object-cover rounded-full" alt="Karpa Royal">');
    } else {
      html = html.replaceFirst('<!-- ROYALE_IMAGE -->', '<div class="w-full h-full bg-yellow-100 rounded-full flex items-center justify-center text-yellow-700"><i class="fas fa-crown text-lg"></i></div>');
    }

    if (communeBase64.isNotEmpty) {
      html = html.replaceFirst('<!-- COMMUNE_IMAGE -->', '<img src="data:image/png;base64,$communeBase64" class="w-full h-full object-cover rounded-full" alt="Karpa Commune">');
    } else {
      html = html.replaceFirst('<!-- COMMUNE_IMAGE -->', '<div class="w-full h-full bg-green-100 rounded-full flex items-center justify-center text-green-700"><i class="fas fa-seedling text-lg"></i></div>');
    }

    if (chinoiseBase64.isNotEmpty) {
      html = html.replaceFirst('<!-- CHINOISE_IMAGE -->', '<img src="data:image/png;base64,$chinoiseBase64" class="w-full h-full object-cover rounded-full" alt="Karpa Chinoise">');
    } else {
      html = html.replaceFirst('<!-- CHINOISE_IMAGE -->', '<div class="w-full h-full bg-blue-100 rounded-full flex items-center justify-center text-blue-600"><i class="fas fa-leaf text-lg"></i></div>');
    }
    
    _controller.loadHtmlString(html);
  }

  Future<String> _assetToBase64(String path) async {
    try {
      final ByteData bytes = await rootBundle.load(path);
      final Uint8List list = bytes.buffer.asUint8List();
      return base64Encode(list);
    } catch (e) {
      debugPrint('Error loading image $path: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karpa (Royal, Commune, Chinoise)'),
        backgroundColor: const Color(0xFF166534), // Green theme from HTML
        foregroundColor: Colors.white,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }

  static const String _htmlContent = '''
<!DOCTYPE html>
<html lang="mg" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Torolàlana: Fiompiana Karpa (Royal, Commune, Chinoise)</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;700&display=swap');
        body { font-family: 'Outfit', sans-serif; }
        
        /* Hero Section Gradient - Thème Vert/Or pour la Carpe & Rizières */
        .hero-pattern {
            background: linear-gradient(135deg, #166534 0%, #ca8a04 100%);
            position: relative;
            overflow: hidden;
        }
        .hero-pattern::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: radial-gradient(circle at top right, rgba(255,255,255,0.1) 0%, transparent 60%);
        }

        /* Card Styles */
        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        /* Smooth Details Animation */
        details > summary { list-style: none; }
        details > summary::-webkit-details-marker { display: none; }
        
        details[open] summary ~ * {
            animation: sweep .3s ease-in-out;
        }

        @keyframes sweep {
            0%    {opacity: 0; transform: translateY(-10px)}
            100%  {opacity: 1; transform: translateY(0)}
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: #f0fdf4; }
        ::-webkit-scrollbar-thumb { background: #15803d; border-radius: 4px; }
        
        /* Checkbox styling */
        .checkbox-card-input:checked + div {
            border-color: #15803d;
            background-color: #f0fdf4;
            box-shadow: 0 0 0 2px #15803d;
            color: #14532d;
        }
        
        .checkbox-card-input:checked + div::after {
            content: '\\f00c';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            top: 10px;
            right: 10px;
            color: #15803d;
        }

        /* Species Radio Styling */
        .species-radio:checked + div {
            border-color: #ca8a04;
            background-color: #fefce8;
            box-shadow: 0 0 0 2px #ca8a04;
        }
        .species-radio:checked + div .check-icon {
            opacity: 1;
        }
    </style>
</head>
<body class="bg-stone-50 text-stone-700 antialiased">

    <!-- Navbar -->
    <nav class="fixed w-full z-50 bg-white/90 backdrop-blur-md border-b border-green-100 transition-all duration-300">
        <div class="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
            <div class="flex items-center gap-2">
                <i class="fas fa-fish text-yellow-600 text-xl"></i>
                
            </div>
            <div class="hidden md:flex items-center gap-6 text-sm font-medium text-slate-600">
                <a href="#guide" class="hover:text-green-700 transition">Torolàlana</a>
                <a href="#simulator" class="px-5 py-2 bg-gradient-to-r from-green-600 to-yellow-600 text-white rounded-full hover:shadow-lg transition">Kajy & Fampitahana</a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero-pattern pt-32 pb-24 px-6 shadow-xl rounded-b-[3rem] mb-12">
        <div class="max-w-4xl mx-auto text-center relative z-10 text-white">
            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white/20 backdrop-blur-sm border border-white/30 text-xs font-bold uppercase tracking-wider mb-6">
                Torolàlana 2026
            </div>
            <h1 class="text-5xl md:text-6xl font-bold mb-6 leading-tight">
                Fiompiana Karpa <br>
                <span class="text-yellow-300">Royal, Commune & Sinoa</span>
            </h1>
            <p class="text-xl text-green-50 max-w-2xl mx-auto mb-10 leading-relaxed font-light">
                Torolàlana feno momba ireo karazana Karpa sy ny fiompiana azy an-tanimbary na dobo.
            </p>
            
            <div class="flex flex-col sm:flex-row justify-center gap-4">
                <a href="#guide" class="px-8 py-4 bg-white text-green-800 rounded-full font-bold hover:bg-green-50 shadow-lg transition transform hover:-translate-y-1">
                    <i class="fas fa-book-open mr-2"></i> Hamaky ny Torolàlana
                </a>
                <a href="#simulator" class="px-8 py-4 bg-green-900/40 border border-green-300 text-white rounded-full font-bold hover:bg-green-800 shadow-lg transition transform hover:-translate-y-1">
                    <i class="fas fa-calculator mr-2"></i> Simulator
                </a>
            </div>
        </div>
    </header>

    <main class="max-w-6xl mx-auto px-4 pb-24 space-y-20 -mt-20 relative z-20">

        <!-- STATS STRIP -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div class="bg-white p-4 rounded-xl shadow-md border-b-2 border-yellow-500 flex items-center text-left">
                <div class="w-16 h-16 mr-3 shrink-0">
                    <!-- ROYALE_IMAGE -->
                </div>
                <div>
                    <h4 class="font-bold text-gray-800 text-sm">Karpa Royal</h4>
                    <p class="text-xs text-gray-500">Be nofo, tsara tsena</p>
                </div>
            </div>
            <div class="bg-white p-4 rounded-xl shadow-md border-b-2 border-green-600 flex items-center text-left">
                <div class="w-16 h-16 mr-3 shrink-0">
                    <!-- COMMUNE_IMAGE -->
                </div>
                <div>
                    <h4 class="font-bold text-gray-800 text-sm">Rizi-pisciculture</h4>
                    <p class="text-xs text-gray-500">Vary + Trondro</p>
                </div>
            </div>
            <div class="bg-white p-4 rounded-xl shadow-md border-b-2 border-blue-500 flex items-center text-left">
                <div class="w-16 h-16 mr-3 shrink-0">
                    <!-- CHINOISE_IMAGE -->
                </div>
                <div>
                    <h4 class="font-bold text-gray-800 text-sm">Karpa Sinoa</h4>
                    <p class="text-xs text-gray-500">Mpanadio, mpihinana ahitra</p>
                </div>
            </div>
        </div>

        <!-- SECTION GUIDE -->
        <section id="guide" class="pt-10">
            <div class="flex items-center gap-4 mb-8">
                <div class="h-10 w-2 bg-green-600 rounded-full"></div>
                <h2 class="text-3xl font-bold text-gray-800">Teknika & Karazana</h2>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                
                <!-- CARD 1: Karazana Karpa (UPDATED) -->
                <div class="feature-card bg-white p-6 rounded-2xl shadow-sm border border-yellow-100 transition-all duration-300">
                    <div class="w-14 h-14 bg-yellow-50 rounded-2xl flex items-center justify-center mb-4 text-yellow-600 shadow-sm">
                        <i class="fas fa-fish text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">1. Karazana Telo Lehibe</h3>
                    <p class="text-sm text-gray-600 mb-4">Mifidiana arakaraka ny tanjonao:</p>
                    
                    <ul class="text-sm text-gray-600 space-y-3">
                        <li class="bg-yellow-50/50 p-2 rounded border border-yellow-100">
                            <!-- ROYALE_IMAGE -->
                            <strong class="flex items-center text-yellow-800 mb-1 gap-2"><i class="fas fa-crown text-xs"></i> Karpa Royal (Miroir)</strong>
                            <span class="text-xs">Vitsy kirany, be hena, hoditra malemy. Ity no tena be mpitady sy tsara vidy indrindra.</span>
                        </li>
                        <li class="bg-stone-50 p-2 rounded border border-stone-200">
                            <!-- COMMUNE_IMAGE -->
                            <strong class="flex items-center text-stone-700 mb-1 gap-2"><i class="fas fa-shield-alt text-xs"></i> Karpa Commune (Tsotra)</strong>
                            <span class="text-xs">Feno kirany, matanjaka be (rustique), mahatanty rano ratsy, fa kelikely kokoa ny nofony.</span>
                        </li>
                        <li class="bg-green-50 p-2 rounded border border-green-100">
                            <!-- CHINOISE_IMAGE -->
                            <strong class="flex items-center text-green-800 mb-1 gap-2"><i class="fas fa-leaf text-xs"></i> Karpa Chinoise (Sinoa)</strong>
                            <span class="text-xs">Amour Blanc (mpihinana ahitra) na Argentée. Tsara atao 'Polyculture' hanadio dobo.</span>
                        </li>
                    </ul>
                </div>

                <!-- CARD 2: Rafitra -->
                <div class="feature-card bg-white p-6 rounded-2xl shadow-sm border border-green-100 transition-all duration-300">
                    <div class="w-14 h-14 bg-green-50 rounded-2xl flex items-center justify-center mb-4 text-green-600 shadow-sm">
                        <i class="fas fa-water text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">2. Rafitra Fiompiana</h3>
                    
                    <div class="space-y-3 text-sm">
                        <details class="group cursor-pointer bg-green-50/50 rounded-lg p-2">
                            <summary class="font-bold flex justify-between items-center text-green-800">
                                Rizi-pisciculture (An-tanimbary)
                                <i class="fas fa-chevron-down text-xs text-green-600 group-open:rotate-180 transition"></i>
                            </summary>
                            <div class="pt-2 text-xs text-gray-600 leading-relaxed mt-2 border-t border-green-100">
                                <p class="mb-2 italic">Fomba malagasy tena mahomby.</p>
                                <ul class="space-y-1 list-disc pl-4">
                                    <li><strong>Tombony:</strong> Ny trondro mihinana bibikely manimba vary + manome zezika (diky).</li>
                                    <li><strong>Fepetra:</strong> Mila hady (canal refuge) 50cm ny halaliny mba hiafenan'ny trondro.</li>
                                    <li><strong>Densit:</strong> 1 isa / 2-3m².</li>
                                </ul>
                            </div>
                        </details>

                        <details class="group cursor-pointer bg-stone-100 rounded-lg p-2">
                            <summary class="font-bold flex justify-between items-center text-stone-800">
                                Dobo Tany (Etang Classique)
                                <i class="fas fa-chevron-down text-xs text-stone-600 group-open:rotate-180 transition"></i>
                            </summary>
                            <div class="pt-2 text-xs text-gray-600 leading-relaxed mt-2 border-t border-stone-200">
                                <p class="mb-2 italic">Ho an'ny famokarana be kokoa.</p>
                                <ul class="space-y-1 list-disc pl-4">
                                    <li><strong>Fotodrafitrasa:</strong> Dobo lalina (1m - 1.5m).</li>
                                    <li><strong>Isan'ny trondro:</strong> 1-2 isa / m² (Extensif/Semi).</li>
                                    <li><strong>Fanamarihana:</strong> Ny karpa dia mikaroka sakafo any ambany rano (fouisseur), ka manabe fotaka ny rano.</li>
                                </ul>
                            </div>
                        </details>
                    </div>
                </div>

                <!-- CARD 3: Rano & Tontolo -->
                <div class="feature-card bg-white p-6 rounded-2xl shadow-sm border border-blue-100 transition-all duration-300">
                    <div class="w-14 h-14 bg-blue-50 rounded-2xl flex items-center justify-center mb-4 text-blue-600 shadow-sm">
                        <i class="fas fa-temperature-low text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">3. Rano & Tontolo</h3>
                    <p class="text-sm text-gray-500 italic mb-4">Ny Karpa dia matanjaka noho ny Tilapia amin'ny hatsiaka.</p>
                    
                    <div class="grid grid-cols-2 gap-3 mb-4">
                        <div class="p-3 bg-blue-50 rounded-lg text-center border border-blue-100">
                            <span class="block text-xl font-bold text-blue-700">18-28°C</span>
                            <span class="text-[10px] uppercase font-bold text-blue-500">Hafanana Tsara</span>
                        </div>
                        <div class="p-3 bg-stone-50 rounded-lg text-center border border-stone-200">
                            <span class="block text-xl font-bold text-stone-700">Ambany</span>
                            <span class="text-[10px] uppercase font-bold text-stone-500">Oxygène</span>
                        </div>
                    </div>
                    <ul class="text-xs text-gray-600 space-y-2">
                        <li class="flex items-start gap-2">
                            <i class="fas fa-snowflake text-blue-400 mt-0.5"></i>
                            <span>Mahatanty rano mangatsiaka (hatramin'ny 4°C) fa tsy mitombo intsony.</span>
                        </li>
                        <li class="flex items-start gap-2">
                            <i class="fas fa-tint text-blue-400 mt-0.5"></i>
                            <span>Mahatanty rano somary maloto sy misy fotaka.</span>
                        </li>
                    </ul>
                </div>

                <!-- CARD 4: Sakafo (Omnivore) -->
                <div class="feature-card bg-white p-0 rounded-2xl shadow-sm border border-orange-100 transition-all duration-300 md:col-span-2 lg:col-span-2 overflow-hidden">
                    <div class="bg-orange-50 p-4 border-b border-orange-100 flex items-center gap-3">
                        <div class="w-10 h-10 bg-white rounded-lg flex items-center justify-center text-orange-600 shadow-sm">
                            <i class="fas fa-utensils"></i>
                        </div>
                        <h3 class="text-xl font-bold text-gray-800">4. Sakafo (Omnivore)</h3>
                    </div>
                    
                    <div class="p-6">
                        <div class="grid md:grid-cols-2 gap-6 mb-6">
                            <!-- Natoraly -->
                            <div class="p-4 rounded-xl border border-green-100 bg-green-50/50">
                                <h4 class="font-bold text-green-800 mb-2 flex items-center"><i class="fas fa-leaf mr-2"></i> Sakafo Natoraly</h4>
                                <p class="text-xs text-gray-600 leading-relaxed">
                                    Ny karpa dia "Omnivore à tendance benthophage" (mihinana izay any ambany rano):
                                </p>
                                <ul class="text-xs text-gray-600 mt-2 list-disc pl-4">
                                    <li>Kankana (Vers de terre/vase).</li>
                                    <li>Bibikely anaty rano (Larves).</li>
                                    <li>Ahitra sy fako organika (indrindra ny <strong>Karpa Sinoa</strong>).</li>
                                </ul>
                            </div>

                            <!-- Fanampiny -->
                            <div class="p-4 rounded-xl border border-orange-100 bg-orange-50/50">
                                <h4 class="font-bold text-orange-800 mb-2 flex items-center"><i class="fas fa-bowl-rice mr-2"></i> Sakafo Fanampiny</h4>
                                <p class="text-xs text-gray-600 leading-relaxed">
                                    Mba hanafainganana ny fitomboana (indrindra ny <strong>Karpa Royal</strong>):
                                </p>
                                <ul class="text-xs text-gray-600 mt-2 list-disc pl-4">
                                    <li>Sisa-bary (Bran de riz), Katsaka, Mangahazo maina.</li>
                                    <li>Zezika (Tain'omby/akoho) hanamaroana ny bibikely kely.</li>
                                    <li>Fatra: Omeo amin'ny toerana iray raikitra isan'andro.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- CARD 6: Toekarena -->
                <div class="feature-card bg-white p-6 rounded-2xl shadow-sm border border-yellow-100 transition-all duration-300 lg:col-span-1">
                    <div class="w-14 h-14 bg-yellow-50 rounded-2xl flex items-center justify-center mb-4 text-yellow-600 shadow-sm">
                        <i class="fas fa-coins text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">5. Toekarena</h3>
                    
                    <div class="space-y-4">
                        <div class="bg-yellow-50 p-3 rounded-xl border border-yellow-100">
                            <h4 class="text-xs font-bold text-yellow-800 uppercase mb-1">Tsingerina Famokarana</h4>
                            <p class="text-xs text-gray-600">Lava kokoa: <strong>8 - 12 volana</strong> vao mahatratra 500g+.</p>
                        </div>
                        
                        <div class="space-y-2 text-xs text-gray-600">
                            <p class="flex items-start gap-2"><i class="fas fa-balance-scale text-yellow-500 mt-0.5"></i> <span><strong>Lanja:</strong> Mahatratra 1kg mahery raha avela elaela.</span></p>
                            <p class="flex items-start gap-2"><i class="fas fa-piggy-bank text-yellow-500 mt-0.5"></i> <span><strong>Vidiny:</strong> Lafo vidy ny Karpa Royal lehibe.</span></p>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <!-- SIMULATOR SECTION -->
        <section id="simulator" class="pt-16">
            <div class="bg-stone-900 rounded-3xl shadow-2xl overflow-hidden relative border-t-8 border-green-600">
                <div class="absolute inset-0 opacity-10 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')]"></div>
                
                <div class="relative z-10 p-8 md:p-12 text-center text-white">
                    <span class="inline-block py-1 px-3 rounded-full bg-green-600/30 text-green-300 text-xs font-bold mb-4 border border-green-500/30">Simulator Karpa</span>
                    <h2 class="text-3xl md:text-4xl font-bold mb-4">Kajy & Fampitahana</h2>
                    <p class="text-stone-400 mb-10 max-w-2xl mx-auto font-light">
                        Safidio ny karazana trondro sy ny rafitra hanaovana kajy.
                    </p>

                    <form id="carpForm" class="max-w-6xl mx-auto space-y-8 bg-white/5 p-6 md:p-8 rounded-2xl backdrop-blur-sm border border-white/10">
                        
                        <!-- Step 1: Species Selection -->
                        <div class="text-left">
                            <label class="block text-sm font-bold text-yellow-400 mb-4 uppercase tracking-wider">1. Safidio ny Karazana</label>
                            <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                                <label class="cursor-pointer group">
                                    <input type="radio" name="species" value="royal" class="species-radio hidden" checked>
                                    <div class="bg-white text-gray-700 border-2 border-transparent rounded-xl p-4 flex flex-col items-center gap-2 hover:bg-yellow-50 transition relative text-center h-full">
                                        <div class="w-12 h-12 bg-yellow-100 rounded-full flex items-center justify-center text-yellow-600"><i class="fas fa-crown text-xl"></i></div>
                                        <div>
                                            <span class="font-bold block">Royal (Miroir)</span>
                                            <span class="text-xs text-gray-500">Be hena, tsara vidy</span>
                                        </div>
                                        <i class="fas fa-check-circle text-green-600 absolute top-2 right-2 opacity-0 check-icon transition"></i>
                                    </div>
                                </label>
                                <label class="cursor-pointer group">
                                    <input type="radio" name="species" value="commune" class="species-radio hidden">
                                    <div class="bg-white text-gray-700 border-2 border-transparent rounded-xl p-4 flex flex-col items-center gap-2 hover:bg-stone-50 transition relative text-center h-full">
                                        <div class="w-12 h-12 bg-stone-200 rounded-full flex items-center justify-center text-stone-600"><i class="fas fa-shield-alt text-xl"></i></div>
                                        <div>
                                            <span class="font-bold block">Commune (Tsotra)</span>
                                            <span class="text-xs text-gray-500">Matanjaka, feno kirany</span>
                                        </div>
                                        <i class="fas fa-check-circle text-green-600 absolute top-2 right-2 opacity-0 check-icon transition"></i>
                                    </div>
                                </label>
                                <label class="cursor-pointer group">
                                    <input type="radio" name="species" value="chinoise" class="species-radio hidden">
                                    <div class="bg-white text-gray-700 border-2 border-transparent rounded-xl p-4 flex flex-col items-center gap-2 hover:bg-green-50 transition relative text-center h-full">
                                        <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center text-green-600"><i class="fas fa-leaf text-xl"></i></div>
                                        <div>
                                            <span class="font-bold block">Sinoa (Chinoise)</span>
                                            <span class="text-xs text-gray-500">Mpanadio, Herbivore</span>
                                        </div>
                                        <i class="fas fa-check-circle text-green-600 absolute top-2 right-2 opacity-0 check-icon transition"></i>
                                    </div>
                                </label>
                            </div>
                        </div>

                        <!-- Step 2: System Selection -->
                        <div class="text-left border-t border-white/10 pt-6">
                            <label class="block text-sm font-bold text-green-400 mb-4 uppercase tracking-wider">2. Safidio ny Rafitra (Max 2)</label>
                            <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                                <label class="cursor-pointer group">
                                    <input type="checkbox" name="system" value="rizi" class="checkbox-card-input hidden" onchange="limitSelection(this)">
                                    <div class="bg-white text-stone-700 border-2 border-transparent rounded-xl p-4 text-center hover:bg-green-50 transition h-full flex flex-col justify-center">
                                        <i class="fas fa-seedling text-3xl text-green-600 mb-2"></i>
                                        <span class="font-bold block">Rizi-pisciculture</span>
                                        <span class="text-xs text-gray-500">An-tanimbary</span>
                                    </div>
                                </label>
                                <label class="cursor-pointer group">
                                    <input type="checkbox" name="system" value="dobo" class="checkbox-card-input hidden" onchange="limitSelection(this)">
                                    <div class="bg-white text-stone-700 border-2 border-transparent rounded-xl p-4 text-center hover:bg-stone-100 transition h-full flex flex-col justify-center">
                                        <i class="fas fa-water text-3xl text-stone-500 mb-2"></i>
                                        <span class="font-bold block">Dobo Tany</span>
                                        <span class="text-xs text-gray-500">Extensif/Semi</span>
                                    </div>
                                </label>
                                <label class="cursor-pointer group">
                                    <input type="checkbox" name="system" value="cage" class="checkbox-card-input hidden" onchange="limitSelection(this)">
                                    <div class="bg-white text-stone-700 border-2 border-transparent rounded-xl p-4 text-center hover:bg-blue-50 transition h-full flex flex-col justify-center">
                                        <i class="fas fa-th-large text-3xl text-blue-500 mb-2"></i>
                                        <span class="font-bold block">Cage</span>
                                        <span class="text-xs text-gray-500">Semi-Intensif</span>
                                    </div>
                                </label>
                            </div>
                        </div>

                        <!-- Step 3: Surface -->
                        <div class="text-left border-t border-white/10 pt-6">
                            <label class="block text-sm font-bold text-green-400 mb-4 uppercase tracking-wider">3. Velarana (m²)</label>
                            <div class="relative">
                                <input type="number" id="surface" placeholder="Ohatra: 500" class="w-full bg-stone-800 border border-stone-600 text-white rounded-xl p-4 focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none text-xl font-mono" required min="1">
                                <span class="absolute right-6 top-1/2 transform -translate-y-1/2 text-stone-500 font-bold">m²</span>
                            </div>
                        </div>

                        <!-- Action -->
                        <button type="button" onclick="generateResponse()" class="w-full bg-gradient-to-r from-green-600 to-yellow-600 hover:from-green-700 hover:to-yellow-700 text-white font-bold py-5 rounded-xl text-lg shadow-lg hover:shadow-green-500/50 transition transform hover:-translate-y-1 flex items-center justify-center gap-3">
                            <span>Manao Kajy & Mampitaha</span>
                            <i class="fas fa-arrow-right"></i>
                        </button>
                    </form>

                    <!-- Results Area -->
                    <div id="resultBox" class="hidden mt-10 max-w-5xl mx-auto bg-white rounded-2xl text-slate-800 p-8 text-left animate-slide-up shadow-2xl border-t-4 border-green-600">
                        <!-- Content Injected via JS -->
                    </div>

                </div>
            </div>
        </section>

    </main>

    <footer class="bg-stone-900 text-stone-400 py-12 text-center relative z-10">
        <div class="max-w-4xl mx-auto px-4">
            <h3 class="text-2xl font-bold text-white mb-2">Fiompiana Karpa</h3>
            <p class="mb-6 opacity-60">Fampandrosoana ny tontolo ambanivohitra.</p>
            <p class="text-sm">&copy; 2026 Designed with <i class="fas fa-heart text-red-500 mx-1"></i> for Madagascar.</p>
        </div>
    </footer>

    <script>
        // Data Configuration for Carp
        const systemsData = {
            rizi: {
                title: "Rizi-pisciculture (Tanimbary)",
                description: "Fomba tsara indrindra ho an'ny tantsaha. Ny trondro dia miara-monina amin'ny vary.",
                densityMin: 0.5, densityMax: 1, densityText: "0.5 - 1 isa / m²",
                productionFactor: 0.300, 
                timeFrame: "12 volana",
                cost: "Ambany (Tsy mila dobo manokana)",
                materials: "Hady (Canal refuge), Tany",
                advice: ["Ataovy lalina (50cm) ny hady hialofan'ny trondro.", "Aza mampiasa pesticide amin'ny vary.", "Tombony roa: Vary + Trondro."]
            },
            dobo: {
                title: "Dobo Tany (Classique)",
                description: "Dobo natokana ho an'ny Karpa. Lalina ary misy fotaka any ambany.",
                densityMin: 1, densityMax: 2, densityText: "1 - 2 isa / m²",
                productionFactor: 0.400,
                timeFrame: "10-12 volana",
                cost: "Antony (Zezika + Sakafo)",
                materials: "Angady, Vam (Vanne)",
                advice: ["Omeo zezika voajanahary matetika ny dobo.", "Ny karpa dia manetsiketsika fotaka, ka mety ho motraka ny rano.", "Tsara ny polyculture."]
            },
            cage: {
                title: "Cage (Semi-Intensif)",
                description: "Mila sakafo feno (pellets) satria tsy mahazo sakafo avy amin'ny fotaka ny karpa.",
                densityMin: 20, densityMax: 40, densityText: "20 - 40 isa / m³",
                productionFactor: 0.450,
                timeFrame: "8-10 volana",
                cost: "Ambony (Sakafo 100%)",
                materials: "Harato, Barika",
                advice: ["Mila sakafo tsara kalitao.", "Tsy dia manome tombony be raha oharina amin'ny dobo tany."]
            }
        };

        // Species specifics
        const speciesData = {
            royal: { name: "Karpa Royal", note: "Mila rano madio kokoa, mitombo haingana raha tsara sakafo." },
            commune: { name: "Karpa Commune", note: "Matanjaka be, mety amin'ny rano somary ratsy." },
            chinoise: { name: "Karpa Sinoa", note: "Mihinana ahitra sy manadio rano (filtreur). Tsara atao polyculture." }
        };

        // UI Logic
        function limitSelection(checkbox) {
            const checkboxes = document.querySelectorAll('input[name="system"]:checked');
            if (checkboxes.length > 2) {
                checkbox.checked = false;
                alert("Azafady, rafitra roa (2) ihany no azo ampitahaina.");
            }
        }

        // Calculation
        function calculateData(systemKey, surface, speciesKey) {
            const data = JSON.parse(JSON.stringify(systemsData[systemKey]));
            const speciesInfo = speciesData[speciesKey];
            
            // Customize based on species
            data.title = `\${data.title} - \${speciesInfo.name}`;
            data.advice.push(speciesInfo.note);

            if (speciesKey === 'chinoise') {
                data.advice.push("Omeo ahitra sy zavamaniry maitso betsaka.");
            } else if (speciesKey === 'royal') {
                data.advice.push("Tena mila sakafo misy proteinina ampy.");
            }

            let minFish = Math.round(surface * data.densityMin);
            let maxFish = Math.round(surface * data.densityMax);
            
            const avgFish = (minFish + maxFish) / 2;
            const survivalRate = 0.85; 
            const productionKg = Math.round(avgFish * survivalRate * data.productionFactor);
            
            return { ...data, minFish, maxFish, productionKg };
        }

        // Generate HTML Response
        function generateResponse() {
            const selectedSystemCheckboxes = document.querySelectorAll('input[name="system"]:checked');
            const speciesValue = document.querySelector('input[name="species"]:checked').value;
            const surface = parseFloat(document.getElementById('surface').value);
            const resultBox = document.getElementById('resultBox');

            if (selectedSystemCheckboxes.length === 0) {
                alert("Safidio aloha ny rafitra tianao hojerena (1 na 2).");
                return;
            }
            if (isNaN(surface) || surface <= 0) {
                alert("Azafady, ampidiro ny velarana (m²) marina.");
                return;
            }

            const results = Array.from(selectedSystemCheckboxes).map(cb => calculateData(cb.value, surface, speciesValue));
            
            let htmlContent = '';

            // CASE 1: Single System
            if (results.length === 1) {
                const r = results[0];
                htmlContent = `
                    <div class="flex items-center gap-4 mb-6 pb-6 border-b border-green-100">
                        <div class="w-12 h-12 rounded-full bg-green-100 flex items-center justify-center text-green-700">
                            <i class="fas fa-clipboard-check text-xl"></i>
                        </div>
                        <div>
                            <h3 class="text-2xl font-bold text-gray-900">\${r.title}</h3>
                            <p class="text-sm text-gray-500">Tombana ho an'ny velarana \${surface} m²</p>
                        </div>
                    </div>

                    <div class="grid md:grid-cols-2 gap-6 mb-8">
                        <div class="bg-stone-100 rounded-xl p-5 border border-stone-200 text-center">
                            <span class="text-xs text-stone-500 uppercase font-bold tracking-wider mb-2 block">Isan'ny Karpa</span>
                            <span class="block text-4xl font-bold text-stone-800">\${r.minFish.toLocaleString()} - \${r.maxFish.toLocaleString()}</span>
                            <span class="text-xs font-semibold text-stone-500 mt-1 block">(\${r.densityText})</span>
                        </div>
                        <div class="bg-yellow-50 rounded-xl p-5 border border-yellow-200 text-center">
                            <span class="text-xs text-yellow-700 uppercase font-bold tracking-wider mb-2 block">Vokatra (Kg)</span>
                            <span class="block text-4xl font-bold text-yellow-800">~ \${r.productionKg.toLocaleString()} Kg</span>
                            <span class="text-xs font-semibold text-yellow-600 mt-1 block">Tsingerina: \${r.timeFrame}</span>
                        </div>
                    </div>

                    <div class="bg-white rounded-xl p-6 border border-stone-200 mb-6 shadow-sm">
                        <h4 class="font-bold text-gray-800 mb-4 text-sm uppercase flex items-center gap-2">
                            <i class="fas fa-info-circle text-green-600"></i> Torohevitra
                        </h4>
                        <div class="space-y-3 text-sm">
                            <p class="text-gray-700 italic bg-green-50 p-3 rounded border border-green-100">\${r.description}</p>
                            <div class="grid md:grid-cols-2 gap-4 mt-4 mb-4">
                                <div class="bg-stone-50 p-3 rounded border border-stone-200">
                                    <span class="block text-xs font-bold text-gray-400 uppercase mb-1">Fandaniana</span>
                                    <span class="font-semibold text-gray-800">\${r.cost}</span>
                                </div>
                                <div class="bg-stone-50 p-3 rounded border border-stone-200">
                                    <span class="block text-xs font-bold text-gray-400 uppercase mb-1">Fitaovana</span>
                                    <span class="font-semibold text-gray-800">\${r.materials}</span>
                                </div>
                            </div>
                            <ul class="space-y-2">
                                \${r.advice.map(adv => `<li class="flex items-start gap-2"><i class="fas fa-check text-green-600 mt-1"></i> <span>\${adv}</span></li>`).join('')}
                            </ul>
                        </div>
                    </div>
                `;
            } 
            // CASE 2: Comparison
            else if (results.length === 2) {
                const [r1, r2] = results;
                htmlContent = `
                    <div class="flex items-center gap-4 mb-6 pb-6 border-b border-green-100">
                        <div class="w-12 h-12 rounded-full bg-yellow-100 flex items-center justify-center text-yellow-700">
                            <i class="fas fa-balance-scale text-xl"></i>
                        </div>
                        <div>
                            <h3 class="text-2xl font-bold text-gray-900">Fampitahana</h3>
                            <p class="text-sm text-gray-500">Mijery ny fahasamihafana amin'ny velarana \${surface} m²</p>
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4 md:gap-8">
                        <!-- Column 1 -->
                        <div class="space-y-4">
                            <div class="p-4 bg-green-700 text-white rounded-xl text-center shadow-md">
                                <h4 class="font-bold text-lg">\${r1.title}</h4>
                            </div>
                            
                            <div class="bg-stone-50 p-4 rounded-xl border border-stone-200 text-center">
                                <span class="text-xs text-stone-500 uppercase font-bold tracking-wider block mb-1">Isan'ny Karpa</span>
                                <span class="block text-xl md:text-2xl font-bold text-stone-800">\${r1.minFish.toLocaleString()} - \${r1.maxFish.toLocaleString()}</span>
                                <span class="text-xs text-stone-500 block">\${r1.densityText}</span>
                            </div>

                            <div class="bg-yellow-50 p-4 rounded-xl border border-yellow-200 text-center">
                                <span class="text-xs text-yellow-700 uppercase font-bold tracking-wider block mb-1">Vokatra (Kg)</span>
                                <span class="block text-xl md:text-2xl font-bold text-yellow-800">~ \${r1.productionKg.toLocaleString()}</span>
                                <span class="text-xs text-yellow-700 block">\${r1.timeFrame}</span>
                            </div>

                            <div class="bg-white p-3 rounded-xl border border-stone-200 text-xs md:text-sm shadow-sm">
                                <p class="mb-2"><strong class="block text-gray-400 uppercase text-[10px]">Fandaniana:</strong> <span class="text-gray-700">\${r1.cost}</span></p>
                                <div class="mt-3 pt-2 border-t border-gray-100">
                                    \${r1.advice.map(adv => `<p class="text-[10px] text-gray-500 mb-1 flex items-start gap-1"><i class="fas fa-caret-right text-green-500"></i> \${adv}</p>`).join('')}
                                </div>
                            </div>
                        </div>

                        <!-- Column 2 -->
                        <div class="space-y-4">
                            <div class="p-4 bg-yellow-600 text-white rounded-xl text-center shadow-md">
                                <h4 class="font-bold text-lg">\${r2.title}</h4>
                            </div>
                            
                            <div class="bg-stone-50 p-4 rounded-xl border border-stone-200 text-center">
                                <span class="text-xs text-stone-500 uppercase font-bold tracking-wider block mb-1">Isan'ny Karpa</span>
                                <span class="block text-xl md:text-2xl font-bold text-stone-800">\${r2.minFish.toLocaleString()} - \${r2.maxFish.toLocaleString()}</span>
                                <span class="text-xs text-stone-500 block">\${r2.densityText}</span>
                            </div>

                            <div class="bg-yellow-50 p-4 rounded-xl border border-yellow-200 text-center">
                                <span class="text-xs text-yellow-700 uppercase font-bold tracking-wider block mb-1">Vokatra (Kg)</span>
                                <span class="block text-xl md:text-2xl font-bold text-yellow-800">~ \${r2.productionKg.toLocaleString()}</span>
                                <span class="text-xs text-yellow-700 block">\${r2.timeFrame}</span>
                            </div>

                            <div class="bg-white p-3 rounded-xl border border-stone-200 text-xs md:text-sm shadow-sm">
                                <p class="mb-2"><strong class="block text-gray-400 uppercase text-[10px]">Fandaniana:</strong> <span class="text-gray-700">\${r2.cost}</span></p>
                                <div class="mt-3 pt-2 border-t border-gray-100">
                                    \${r2.advice.map(adv => `<p class="text-[10px] text-gray-500 mb-1 flex items-start gap-1"><i class="fas fa-caret-right text-yellow-500"></i> \${adv}</p>`).join('')}
                                </div>
                            </div>
                        </div>
                    </div>
                `;
            }

            resultBox.innerHTML = htmlContent;
            resultBox.classList.remove('hidden');
            resultBox.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }
    </script>
</body>
</html>
''';
}
