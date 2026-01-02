import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TilapiaNiloticaPage extends StatefulWidget {
  const TilapiaNiloticaPage({super.key});

  @override
  State<TilapiaNiloticaPage> createState() => _TilapiaNiloticaPageState();
}

class _TilapiaNiloticaPageState extends State<TilapiaNiloticaPage> {
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
      )
      ..loadHtmlString(_htmlContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tilapia Nilotica'),
        backgroundColor: Colors.orange,
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
    <title>Torolàlana: Fiompiana Tilapia (Nil &amp; Mena)</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;700&display=swap');
        body { font-family: 'Outfit', sans-serif; }
        
        .hero-pattern {
            background: linear-gradient(120deg, #f97316 0%, #fb923c 100%);
            position: relative;
            overflow: hidden;
        }
        .hero-pattern::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: radial-gradient(circle at top right, rgba(255,255,255,0.1) 0%, transparent 60%);
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        details > summary { list-style: none; }
        details > summary::-webkit-details-marker { display: none; }
        
        details[open] summary ~ * {
            animation: sweep .3s ease-in-out;
        }

        @keyframes sweep {
            0%    {opacity: 0; transform: translateY(-10px)}
            100%  {opacity: 1; transform: translateY(0)}
        }

        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: #f0fdfa; }
        ::-webkit-scrollbar-thumb { background: #0d9488; border-radius: 4px; }
        
        .checkbox-card-input:checked + div {
            border-color: #0d9488;
            background-color: #f0fdfa;
            box-shadow: 0 0 0 2px #0d9488;
            color: #115e59;
        }
        
        .checkbox-card-input:checked + div::after {
            content: '\\f00c';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            top: 10px;
            right: 10px;
            color: #0d9488;
        }

        .species-radio:checked + div {
            border-color: #f59e0b;
            background-color: #fffbeb;
            box-shadow: 0 0 0 2px #f59e0b;
        }
        .species-radio:checked + div .check-icon {
            opacity: 1;
        }
    </style>
</head>
<body class="bg-gray-50 text-slate-700 antialiased">

    <nav class="fixed w-full z-50 bg-white/90 backdrop-blur-md border-b border-teal-100 transition-all duration-300">
        <div class="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
            <div class="flex items-center gap-2">
                <i class="fas fa-fish text-teal-600 text-xl"></i>
                <span class="font-bold text-slate-800 text-lg">Tilapia<span class="text-teal-600">Tech</span></span>
            </div>
            <div class="hidden md:flex items-center gap-6 text-sm font-medium text-slate-600">
                <a href="#guide" class="hover:text-teal-600 transition">Torolàlana</a>
                <a href="#simulator" class="px-5 py-2 bg-gradient-to-r from-teal-500 to-cyan-600 text-white rounded-full hover:shadow-lg transition">Kajy &amp; Fampitahana</a>
            </div>
        </div>
    </nav>

    <header class="hero-pattern pt-32 pb-24 px-6 shadow-xl rounded-b-[3rem] mb-12">
        <div class="max-w-4xl mx-auto text-center relative z-10 text-white">
            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white/20 backdrop-blur-sm border border-white/30 text-xs font-bold uppercase tracking-wider mb-6">
                Torolàlana 2026
            </div>
            <h1 class="text-5xl md:text-6xl font-bold mb-6 leading-tight">
                
                
            </h1>
            <p class="text-xl text-cyan-50 max-w-2xl mx-auto mb-10 leading-relaxed font-light">
                Torolàlana teknika feno sy fitaovana fikajiana ho an'ny mpandraharaha Malagasy.
            </p>
            
            <div class="flex flex-col sm:flex-row justify-center gap-4">
                <a href="#guide" class="px-8 py-4 bg-white text-teal-700 rounded-full font-bold hover:bg-teal-50 shadow-lg transition transform hover:-translate-y-1">
                    <i class="fas fa-book-open mr-2"></i> Hamaky ny Torolàlana
                </a>
                <a href="#simulator" class="px-8 py-4 bg-teal-800/50 border border-teal-400 text-white rounded-full font-bold hover:bg-teal-800 shadow-lg transition transform hover:-translate-y-1">
                    <i class="fas fa-calculator mr-2"></i> Simulator
                </a>
            </div>
        </div>
    </header>

    <main class="max-w-6xl mx-auto px-4 pb-24 space-y-20 -mt-20 relative z-20">

        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div class="bg-white p-4 rounded-xl shadow-md border-b-2 border-teal-500 flex items-center text-left">
                <div class="w-10 h-10 bg-teal-100 rounded-full flex items-center justify-center mr-3 text-teal-600 shrink-0">
                    <i class="fas fa-check text-lg"></i>
                </div>
                <div>
                    <h4 class="font-bold text-gray-800 text-sm">Niloticus &amp; Mena</h4>
                    <p class="text-xs text-gray-500">Karazana tsara indrindra</p>
                </div>
            </div>
            <div class="bg-white p-4 rounded-xl shadow-md border-b-2 border-cyan-500 flex items-center text-left">
                <div class="w-10 h-10 bg-cyan-100 rounded-full flex items-center justify-center mr-3 text-cyan-600 shrink-0">
                    <i class="fas fa-chart-line text-lg"></i>
                </div>
                <div>
                    <h4 class="font-bold text-gray-800 text-sm">Tsena Mandeha</h4>
                    <p class="text-xs text-gray-500">Tinady avo eto an-toerana</p>
                </div>
            </div>
            <div class="bg-white p-4 rounded-xl shadow-md border-b-2 border-emerald-500 flex items-center text-left">
                <div class="w-10 h-10 bg-emerald-100 rounded-full flex items-center justify-center mr-3 text-emerald-600 shrink-0">
                    <i class="fas fa-clock text-lg"></i>
                </div>
                <div>
                    <h4 class="font-bold text-gray-800 text-sm">6 Volana</h4>
                    <p class="text-xs text-gray-500">Tsingerina famokarana</p>
                </div>
            </div>
        </div>

        <section id="guide" class="pt-10">
            <div class="flex items-center gap-4 mb-8">
                <div class="h-10 w-2 bg-teal-500 rounded-full"></div>
                <h2 class="text-3xl font-bold text-gray-800">Dingana &amp; Teknika</h2>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                
                <div class="feature-card bg-white p-6 rounded-2xl shadow-sm border border-blue-100 transition-all duration-300">
                    <div class="w-14 h-14 bg-blue-50 rounded-2xl flex items-center justify-center mb-4 text-blue-600 shadow-sm">
                        <i class="fas fa-dna text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">1. Fifantenana Karazana</h3>
                    
                    <p class="text-sm text-gray-600 mb-2">Ny <strong>Oreochromis niloticus</strong> (Tilapia du Nil) no tsara indrindra.</p>
                    <ul class="text-sm text-gray-600 space-y-1 mb-4">
                        <li class="flex items-start gap-2"><i class="fas fa-check text-blue-500 mt-1"></i><span><strong>Vantony:</strong> Misafidiana zana-trondro "monosexe mâle" (lahy daholo) mba hisorohana ny fiterahana be loatra anaty dobo.</span></li>
                        <li class="flex items-start gap-2"><i class="fas fa-check text-blue-500 mt-1"></i><span><strong>Fitomboana:</strong> Mahatratra 300g-500g ao anatin'ny 6 volana raha tsara ny sakafo.</span></li>
                    </ul>

                    <div class="pt-3 border-t border-blue-50">
                        <p class="text-sm text-gray-600 mb-2">Safidy faharoa: <strong>Tilapia Mena</strong> (Rouge):</p>
                        <ul class="text-sm text-gray-600 space-y-1">
                            <li class="flex items-start gap-2"><i class="fas fa-star text-amber-500 mt-1"></i><span>Vidiny ambony kokoa eo amin'ny tsena satria manintona ny lokony.</span></li>
                            <li class="flex items-start gap-2"><i class="fas fa-exclamation-circle text-red-500 mt-1"></i><span>Mora hitan'ny vorona (mila fiarovana manokana).</span></li>
                        </ul>
                    </div>
                </div>

                <div class="feature-card bg-white p-6 rounded-2xl shadow-sm border border-green-100 transition-all duration-300">
                    <div class="w-14 h-14 bg-green-50 rounded-2xl flex items-center justify-center mb-4 text-green-600 shadow-sm">
                        <i class="fas fa-layer-group text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">2. Rafitra &amp; Dobo</h3>
                    
                    <div class="space-y-3 text-sm">
                        <details class="group cursor-pointer bg-green-50/50 rounded-lg p-2">
                            <summary class="font-bold flex justify-between items-center text-green-800">
                                Extensif (Dobo tany)
                                <i class="fas fa-chevron-down text-xs text-green-600 group-open:rotate-180 transition"></i>
                            </summary>
                            <div class="pt-2 text-xs text-gray-600 leading-relaxed mt-2 border-t border-green-100">
                                <p class="mb-2 italic">Ity no fomba mahazatra indrindra, mampiasa dobo tany voajanahary.</p>
                                <ul class="space-y-1 list-disc pl-4">
                                    <li><strong>Fotodrafitrasa:</strong> Dobo tany 1m hatramin'ny 1.5m ny halaliny.</li>
                                    <li><strong>Sakafo:</strong> Miantehitra amin'ny plancton (sakafo voajanahary). Ampitomboina amin'ny alalan'ny zezika (compost).</li>
                                    <li><strong>Isan'ny trondro:</strong> 1 hatramin'ny 3 isa isaky ny metatra tora-droa (m²).</li>
                                    <li><strong>Tombony:</strong> Tsy mila fandaniana be amin'ny sakafo sy fitaovana.</li>
                                    <li><strong>Fetran'ny vokatra:</strong> Maharitra ela ny fitomboana (6-10 volana).</li>
                                </ul>
                                <img src="data:image/jpeg;base64,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" class="mt-3 rounded-lg w-full" alt="Systeme">
                            </div>
                        </details>

                        <details class="group cursor-pointer bg-green-50/50 rounded-lg p-2">
                            <summary class="font-bold flex justify-between items-center text-green-800">
                                Semi-Intensif (Cage/Beton)
                                <i class="fas fa-chevron-down text-xs text-green-600 group-open:rotate-180 transition"></i>
                            </summary>
                            <div class="pt-2 text-xs text-gray-600 leading-relaxed mt-2 border-t border-green-100">
                                <p class="mb-2 italic">Ity rafitra ity dia mitaky fifehezana bebe kokoa sy sakafo fanampiny.</p>
                                <ul class="space-y-1 list-disc pl-4">
                                    <li><strong>Fotodrafitrasa:</strong> Dobo beton na cage apetraka amin'ny renirano na farihy.</li>
                                    <li><strong>Sakafo:</strong> Sakafo voajanahary miampy sakafo fanampiny (katsaka, soja, bran).</li>
                                    <li><strong>Isan'ny trondro:</strong> 5 hatramin'ny 15 isa isaky ny m².</li>
                                    <li><strong>Tombony:</strong> Vokatra betsaka kokoa amin'ny velarana kely.</li>
                                    <li><strong>Fitantanana:</strong> Mila ovaina matetika ny rano mba hitazonana ny fahadiovana.</li>
                                </ul>
                                <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAoHBwgHBgoICAgLCgoLDhgQDg0NDh0VFhEYIx8lJCIfIiEmKzcvJik0KSEiMEExNDk7Pj4+JS5ESUM8SDc9Pjv/2wBDAQoLCw4NDhwQEBw7KCIoOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozv/wAARCADaAZADASIAAhEBAxEB/8QAGwAAAgMBAQEAAAAAAAAAAAAAAwQCBQYBBwD/xABFEAACAQMCAwYEBAMFBgYCAwABAgMABBESIQUxQRMiUWFxgQYykaEUscHRI0JSFWJy4fAHFjOCkvEkNENTY8IlczWisv/EABkBAAMBAQEAAAAAAAAAAAAAAAABAgMEBf/EACsRAAICAQQCAgIBBAMBAAAAAAABAhESAyExQRNRBBQiYTIjUqHwcZHB8f/aAAwDAQACEQMRAD8Ap5pWyTA4jk6FSdvI70KKPKh5Ze0Z+93WArjX5AErrESzEHCZB96C95CsixZVJZNl1R4BGenSueOpKinFDXZNJ3VikRRsTqJB96jI7xaUSMMV5u67fSlbe5lj1JcoETWUzGSR5beFGt+KlW7BxG0jZVdS6htzz5U/L2Cih2KJgRLI0ZLclUACiXHE3jhMaroPPIpU8Rtll0SW6xuowHjyMUJ7i0nLyrI2kNgl85Bxsd+mQanJNpyWxV0qiDeTJ1yFmz475piES3JAZ9CeCjc0jaOXSMTMrNyQsNzTov2t0CmPDMdIBGK1eonsuTNL2W9jIkOle+uOQwN6b7SJZNesIx9MkVnzcTTOI4gzY3z0PlRBHdtdLp1F2B0jbGR8w8sVhJJu7NlJ1sizlRe1cxzqmo7DwoXbtEVMsaOdgJBtioRwXeCewJU/zKBv7VLN5EJEkspWjBwpVchhgdKSn1YqlzQZL50c5BUj70e3vzktFK6HmGjODShglAC9nMqsMHA2FJhGjLMisxQHJVdLY8cGrWL4JeS5NLbcc4zFlfxInXoWwSPbnTsfxXeIMy2sTgDBwSu9Yy04lrKySGRN8Fts59abHEO3R2jEcunqV72PHINXnJMmlRrD8c2iACS0k19Qrg18vxvE0vdsWMeRuZBqHjtWLFzE5KzxY222xTMUcbRlot9vHJNbuVLczSbexuE+LLJ01dhPzwQoBx96GPjThpcL2FyN9yVG33rFRO6zK8Uu+flO1OiZ5XIu4EI6EHBqHOv2VRu7fjvDLhNSXSjphlINcn49bRZESPKfH5R9awRf8K4aHVgHdXPP3p0cVAVUZO4R0PKmp090FbbM04+InB71qmPJzR/947cJk28mo8gCCD71lEuopP8AhnPl1oj3nYqAWXcZxq3rTKD4IqSNV/vHZYGY5gTz2G33qI+JbbO9vNjxyKyJvQDgR8uZJqJvsdV36A5qqiK2ai6+JWYabSHR/ek3+1VMt1PO+uSd2bxLcqrhco4/myfAipmQIupo2wOtLyQiGMmOAFtyxJ8zUgcdarhxBs5CKBy3aixcRhY6ObjpyFHmiPxssNbdXbfzNFhu5oHDxzOpHnn7VVPxFgT/AAl26as/aom/dUaVl0onzbeFLywGtORsIPiOLSBcQOG6smMH2NMnj3DxHqV3Y/0hDn9qwicRilmZTOkZVdR18seRpO948tldqiydqpUEkefhUZwfBVSN/wD7yR6sfhJMdO+KMnxBaMQHjljz5ZH2rFHiSqndl1defKojiTHV3mOxIzgbeNGcAqR6HFf2koylxH6E4P3ovaxf+6n/AFCvOBdsFH4hMMRnY/ceVSW9gd2RNOUwW1bc+VQ9SHsrGR6E15bLzuIxj+8Kh/aVkFLfiUwPWvN7njccDrHG6uxfSdLYxt+VBXjrCW3VbhzoGZVTJ3PSjyRCmekNx2xUHvSEj/4zvUE+ILRzhkmT1XP5VhJviB4wwRZmYg47uoZ6dOVJJxriqxnCyO/IO0YUfSmtSLBxZ6hHxeyk+WcA/wB8Ffzqb31qq6nuoVUnGTIAM15U11xq5Kzm6uI8gYCRMMbY5CoJYXk08vbNcsM/zLhTnc4FS9WC7BRl6PU7rillZoXnuVUDoDkn0ApCb4w4LBgG6aRiMhUQk4/0K84NlMxMjWs7EMVGrJzjqBU04ZI5LNBpJ3OsEfrU+aHseEjZz/7QrMFxaWrzqEyrM2nLZ5daXHxy8sTpLbfh2PJ43yQOuMjnis0LKZFxGyRjpggH86gbK5cZVkLA5OZBUeeHspQZqP8AfUJCkUfatoXBkYAs3mTSv++k6lwWuJNTbDUq4HhnFUZtJzzkAPiMH7VLsRnvOV8CqZo866Y/GUdhw547WVJJg5kfvBlOk5B5YFIz8InZgVJiCtrWMh20n/ERWqEEWrW8s5c4zqOrf0pmdYpRqnncMgwNPd28SOtef9mS6N/EmjIxcDv5nlIaBlkG69vuv1H50SH4a4hFJGzi2zHy/iYJ+1amaSE6QksYRRuDGCD71FILYzLKksQY5J7hBJ9c7UvsSoPFEzN58NcRlue0tjGpdu+BLt/r3oEXwxx5JgW0NEBpKMchhW3Z2MJ0Xqxtqzns8/bNDke7lACcWxJjBJiGD96I/JlVbA9GFmVHw1dLMjJGgaM5YHJwOnlyr664LxSYE28UbDBO8unSf5a0pivI1UtxBSB8x3G/iMGmY5ezUs18zDOQdWR70vsSu+Q8UODGWPBuOJ2jS28RfHdftMAE+Y3p+Hhl1CNc9sj3LblhJz9dxWqMryPhJVCkdTXWXCjMwyvpy60n8pvka0YrszCJPEzRw2JZQ2AUYZI8d2+1NCOdIu0NvMkpJCRCEFn99WB71ea0eQI0pYdRrIqDSs2tY2jH9LA/pS86KUEuzHsfiKW5ZLnh1wtuX37Lbu752B328arr9eL3WXk4TdKy4A0AqAo6ee1bwyaYOzkuVduQxp39q+bs9LZdySB3Q+Me4rWPyK3SM5aSfZj+HcK4hZulx/Z900eNeCy8+mc8qekv+PLMJl4eVjUYKBVKnzPp4VdSz2wiVjDKQBg/+IOR6jO9GS5tpVEaWqk55FsEUPXk92gUEtkzOcUn4zJaxrDw8Ase9J2SKD4AUG2h4vGy/iLNgrAhxHJhwMbkZGP9GtfpYlAqKmnJ1EjBrsrEyaWhhMZG+QDjzpL5LSqgekm7swvDrVL2VWguZ1lxiMBSAcDr0+lRm4pxG24gtndWy6sjYnOBnI3B9K9AAtiiMsMWV6acfSuzLZLGxMYjc8j2YIzT+y23aF4FXJkXt+NqZDHbNMjlWDbZ8TjwG+MU29rxUMumBAmMnMYDY8OfOroTRKGY3EQXxEeD60P8TDI4SyurWViNg3jS+zOg8Me2Ua2/FkGtIX3JJXGCN9uu1CvbHicsK3UyMJIHJGNu7nlv1rSGa6jaOKZ7JdZ3Gk8uvvUJ3ktnR5JrJ4jkDu4JxVfZmLxRKX8NfGfU5ECyAFA6b8tzuahcWnE4AZGCMhA0OWVd+u2avmlu0VXhtknXmQjDP33NKHj62wcy2UupCD2Ri7wB/OnH5Go+AejDspoF4hJKgiMY5ZKsC2P86Ye64nCulrpEG65k5MfTNPn4gjunYRWUsYUDvGPFGTi0LPkIEfGxdRv6ZoevO90C049Mqra6vrpliktzlScsoQ58+dAt55Vfsmgld492COoLjx51eT/EFrb7ARseXdK5B+u1Dl4+oHYibh6knI1DfHnjrVLWk+heOK7Kq1PEBJre2nVBjGykj3zXZeH3clsijtmYsxYEgHBPRQTk0+3HLFY957S4mzlQDpA96HL8SzKqO0Vnpc41CYd39aPLqN7KgwhXIvHZTxQlDHdAyba2hXYee+5oU3DGuWDyvLqjGO6m5/xDocVZH4mtJEDR3EEbLswdjj2qI47cOO1guuHHfkW5H3FLy6idhhp+wH9nR4OntmZ00v2gZQ23QAZqcMEcMEayxyXEibBo1dQB0B8BUv8AejiUgCi3sXOTg9shB8xtUpPiPinZ6jwqMu2DrSVMY86TnP8A1oaUOSve9jvruS2i7MSq3KVnYHG+xo34O7klEsjQsCNJ2Okj0x+dPW/G+KCASvYxjunlImB60SL4hmKlpI7LIwQC4x5746UPWl0gxj2xKOzmjbEZhQnkQnL20138NeySaheKy4OwDLU149bPMwh4bkAZLJGcZ8AetSj45E851wdkRycxlVJ96M9TmilGPsjLacQjhPZxrkc3ZywFJiO9lZkEySMpwyofl+lWg+IrBrhIPxELatjlcn1o8V5C8naCSzdFJGMZAHn40vLKPK/wGEXwyk/s7icmFWbSFOSVP65rqcMvo3IkaVsDms2+PTP61eJfwWQwsNqiOM5CqAfWmI74XSBraS3Cs2MwqKH8h/6gWmvZn/wEpIxMy42y8pBH0NDksLiNyDfu7jfSkwJrSOI+0Y3C27K/dOpORrnaQBWjItCqggkqpI9zvSXya7G9NFJbCcEK0sjEc0kmAJ9s0/20pfPZg77jKn704JY7qDEb2pUjG0SnHpQWt43Gl2hkXkAYx71nLWi2NR25OSC1vLXdI0kx/WNz6g0qlgkndWWFW57SrkfSiSxcNi0zFEBG2pVG3rXIVsbyT/w34fUOcqIMnyqvMnwTiuB+4WJ4wquEkJxkY2PnXDw1ZE/iyO7Z5Hn/ANqpnns4nMhSdH08nO3jzGQPenbzixsbGG8lDlJdOjsCGI1cufj49Kw8c1SRvXsNPZuISYMEno68xWTuvia5hmlt7mxwqPpLR94q3TbwrVrfG5swyucgbZwc58MUpcS8Pt7xvxcHZtIe66kP2p2xpHPPrV6UKtSVkyhLoQt7tOJ2jSdlJqxrxHkEnwFfdmttCuLeaUumsjUQwI55+tPlbixVwLWIuFLBAfmHl/rrQLK7lnKn8Oir2faELzHkQd/pVRhz6E4ewN1JHcxLKtsxZNtGvY/Q71Xv/an4iWN7BQiy6UYdUOfOrH+0VZ//ACkDxAahpXOd8d3PXrXJeI3sLfiImd0AyYDCoZuowf1qowx2E4J9lHJxPjVszxx2KyhHwrKp+UeGKY/tLjFxb2z9+FjkEadsg7CtUJZMQzRyDQ8eXidBlifAjw32ockpuh2cdyAw7oU4ZckbHly6b8qf4/2oa0f2UE95xyG9Cw9rpx/Rn/tXO2+JCFc2UQJJ7T+EMjwPOjXEvEBpUmQMpLBXk1AgHB3G+PI5onDp7q4jMpuY40jdiVkkLfrTxUY3SIwd1uDtbfi17xEPc20UMRX50UZzj96Hxa1+JBCj27ayV0lUVdtztj6UzcC3vo4p7W6aBjJhlEndZc42HiDg5HjQ7S/trqwuYpLiSRxnSBlGI5HHnTSrdIfj6sqhafFjTBpbaJi6YOtVA9/OnVsuOT26K1tEJYxhi2AQc5O/pRVeGJRDL+LePJ0ShDrTyyNiNutRs7yCK2Ts4ppJYHLFlHdPTGCdweW9aPdbIPGvZX3ln8UyObcIgVGJUI4XP3pi3tPiVowk7xRocDtGmGcdaYlvbS9txBJZyqXbVhTg+Z+oFNrxYJcCFrIRlhliZFw4PvtvQ26/igWnH2V80PHbOPH9pWxYY2Em2OpPvimLeP4iitcyXVu7Z73e1Y8MH2qN1dzWrq8L25yNu0m7wGMYI68uhqEd+7TPPiOGS4GJcqcHnvt9aKtcIMYJ8sc/tS6dFWR7BHCcyWbV9vXao2xW1jf/APIW8eWDL2UBGSep9aTmmM9tIjmNe6e/HEQWw22T+tIcQn4hKpKhBIylWBQbJnb/AL0R010JpLdl9bcY4QHZmuX1gFmzk7Hw2+1fXd/wyV43kniEeMoJg2oNn5hjpWG/CXIOzI2RvXfw92mAI1bfoa2WhC7TMvI/R6OOLcJSIBL1QowGIlx9Nqhq4fdkiTjIlQ7dm5QjHh0NefObhD/EiBAPgTXPxbZKvGuPWl9WPspaq7R6THY/D8ISRrO1lY4AftCNXpuaKYOCPIso4GjNnZjJyNeapdppJkDAY2J3zUk4gqDuPMgPPGa0WnNcP/AnKD6/yehvwrgJlftPh1Cxy2pZNjS0/D/h8jK/Dq5A3AY5/wA6xP8AaszDT+LcDbCgkYxy3o68dvYhpTiMuOXz55UY6vsV6fo1EvDuApv/AGAqgHGrtWGaCbDgU5//AIMIY8ZTtJA2OWfMelUifEHF9v8Ax0p2zvg1E/EHFu01i7JwORAAH2pOOr7H/T9FpLwThOnVFw92AJ1aZXOPaoWvCeE3MErQR6uz3lXtH2GaDH8VcXi3E6MSd8xDJoo+K74R4khtWyN/4WM1DjrVyP8Ap+giWfBbe57J7GI6d8uz4/P/ACp3sbGKXsxY2qq5KI3MHbIyCduXOquP4n0urf2fb6gxOobZzz6U3H8VxCUzDh6qfDSjKfUEVHjm3vf/AGPKPR17z8PEeytoTjYLGq5O++1NG4mZlRLhAvTSjNpPhsPtU/8AftI9PZcPtlPMjsV/OnE/2lGNMizjXbGOwA38chqtaS9Cy9FJxFbgRK9ve3DXIHyiF8H13pBZfiY2xj7F+zGejA77VsI/9pFoqBpbRC2wPcbJ+9FP+0m0GSttBgcvnz9MfrV4x/1EPJ//AEwwk+IFBLNPq5acN+opae64zgrLB131Rjn9K9Kg+P7K4l0paoe7qJ1kDA9V2oi/HfCpSUks4+eAO1U/mMVdw4/8FUjy2S74j/6kKk/3kU/pRI+M8Rt0CxxhcDAKxrn7V6t/b3w9doO1skY+BRG++ajNe/CE0RV7GLMgxnskB/Oh4foVSPKv7cvyoVrdcaixzDnJ8TmgPxFyCWs4yTnOYSM+u9eptH8FyfNw2RNsakTP/wDk0GXhHwTcFf40kBPJTrUn12oWHVA8u7PMxx24gjCx28K7Y2i/emB8TyGPEtvC45fKy49wa9Bufgz4XmGq34usW42MoO3vQx8HfDghET8dhEnXDqc+1J6cH0LcwbcesXthA/Dl06skDOD965bcbtrWXVbWcaEnmZWGPQVtZvgfggTI47AMnAyAaAP9ncMrk2/FLKZFGTjTn6UsIVVBbK2S9Z+JrcwzGQC30TLINmfxx7/banrvjNszqoRRFBGQiqeunHLpzHKqae0BXIDFg4DMP5l86bisRJbMRGe0j5ddXhnFcWN06PQzrYIOJSJY64YbdZWIbQXwvny2Gd98UlxPjM10tvKoghMLdoFUal1eOfHH6UeHh7yKVNsypIDkP6+dMScFNxadn2YRwcqcZArWOnK7xM5aqrkBPxQ3kCs7vCdRy7oCDnfAxvjakl4jetcAPcGTCafxEKmMgDO2Dz51dvwJ5bNFAXUMZwOo9KhFwOSNzrYrg5HIb4xiqjoz/tJlrR9mavpHAi7K4nVgxB0xLvtjPPn+1N293ePayxtJM6vggyNggYxsR5ir5/h+F5QztjJz83XypgfDsKp3ctuT3gcb+la+DUaMfNFMo7B50tMFSV5Ak9479SOtcuI5ppJscpI1yCSQcdPLqfetPbcJt0jMaw9wbjr+dGXhkac48jocUfVnd2P7EaMXcRTx9n2rCVkJ7zKO6PI0SAyvbuxRgqqWARR3hvWy/s1M/Iu/TwosPDokXSykhhgjSOR9q0+rLtmb+Qr2MeLKWzieONndRgrpT5gQCD965bWl68sgdpWCnuZGM+H0rX8OiV+EWjaSJOxEbbcyhK//AFpyJN8BCDjcnB/WiPxbVthL5FOkYv8As6+lwH/EBVxhFY4/1zqdj8PXFwsiBCr6zqOTjFbmNQuQ0YP94ED8qmVRcEL7hq0XxYEP5EjFSfCdyihIrcZO4dv2py2+FijKWAxsfkzv9a1YYt4kfWpqdx3zmq+tpi+xMzC/CETMGJJbr601F8K2hP8AFVidOPm6+NWHCb2a7s2luCvaLNJHhRgYVsDn5U/2mf5SfOnHS02rSJlqTTqypPwxYCIKUyvhnFfJ8N8PIZkhAyMZLZNW+sgEgD3NRLIcnYnrg1fjj6Jzl7KhfhmxUYWEb88UVfh2yUYFsjDAznHT2q07uAMgDzJruxHMfWnivROTKZvhawdP/Khd84zik5Pgnh7sNQBPm4I+wzWkMSFcZJHgDXRGQAFKr/ygUnGL6HkzGz/ANlk9VY8kIGPYiqub/Z7h2EcgCjlnn9jXoxWQ5zKv0qOmJh/EMbN033pYIebPKJvge9TOmNgF6hsg0jP8LXttlipYHrpzXsfYRsxJKjyDmoyWiP8AOhyeqjOfvS8f7HmeIPwm4V9huBgrgionh19GT/AcMeWDjNe2/goyG0AEHnqjH6mkbn4egnbvKgwMZwMj7Glg/Y80ePItwjbLKWHU70OSe4BJZiPJlr1g/CXDlz/C+U51ZOD9OdJT/CEcgJjUd7kwJx99qnGS6KzR5vHdM0g7UrpA3AGCTXXu330IPXOcVuZvgdtZJMYJ5AKGPvg0lL8DKuWkYIvTIxv70qfodr2ZNLxCoyjZHPAzUhdREkuGAzgA+FXM3wlIgyAwHkwORSknwzfKuSsgUHqAaVodinaxM2dY25atq5LMBlFdMDmep9K6eETg6Q4b2ob8JulYEQq3hg0XH2G4dWTAbJ25nOwrmSTrVQ3hhtqUa0njJ127+1cKtGCMSpnntRsOyxSPIGVHe5jpUWYmXGnCjbaq9ppeQnYbcjXBLKjArLk8+dOh2ixhklU6uu+1HPErxB/5iQHqAxGTVV+LucYBVvGurcyDZowwxuM0sQyHxxW7AL/iJAcDkxzRI+NXbuG7SRQucl+8W/Kq0XOk99SB0UCo/jEdgGQik4J9Bk/Zbrx27EPecq5xgoBj3pmL4huNhPGsoz826tj1FUIuFzhyFxyAHOpi4jZvm/Sl44+h5v2elDh6gnbmf5cb/amILdU7oXSBvux/eutI7DHZn1Y4qBZflKA5/pJP5V2rTjHhHG5yfIVUiLfKrEddGaN3EyCMA88DFKkqigaSM9AuPvUo2GdSxkjyP+dWkS2MCQFsLGSPEiphFByETJ574oIYYyVA9ZMV0Sq+dK+4ooVhgqkaymfDAyKkSwwRjT1HKlFDayTp35cyf1ompsgnU3lqxRQDCyIwK4kB81/yr6MJ8qlhjYAD/KlzJuN2BHmaksudgMe5/aigsYY6Bso9zXyEoMpigGXfp/0muCYE4z+lKgPuGEJDcREY7O7lAyTjBw//ANqJccWtLKVY7m5iiaQZUOwGfekLadk4jexBe66xTLzzyKH8lqh+LO/fWrEEBomByPA/51ldRZrVyRs1ue1TXCyzLjOY2DflXUJTvGGRB1JTAHvmsVwDXHbcRaGRo5RbEroOCDvv67Des3Bf3ct7FPNcyyGN1fLyFuR8/SsHq6i3OiOlB7HromUjqa6GGMggUn2sYdlDaiDvgA11JC8vZtGckZByQK1evDFzW6MfDPLFkOENoS9jyMJfS9T1Cn9asBIp8T7GqLh7BL/iCCQNi9x82M/wx+1WxlPIavv+9LRmpJ17HqxcWhrUp5qT7V3WdJABx6UmJPEAfQVLtNsBh7EH9K3oxGg5I5ipBieTfUilRITtk+tS1tyGo+xpAH1ENkygAdABUw2oZDH60sJZDsB//c13WVGcpnw1H96BjIcHbOTXcKrZ0DPiBS3asCMAY8qlnU3Jf+k0qAMQjEkxKcb6q6HjbYYbyx+4oAU68qN/ECiqXH8p9hQAXAOOmOgrpkTOktn0OKCHcNlomPkFr5n3x2eP8SH96AJuiSDdVI/vYOKh+E3JIjwd877feuM4XcRA+QyB96Gk6iTs3iCk7jTIRSGEuREVV9KOw6g/vSkkRlfYbEdCpFNhcjUJ8A9Nt/3r4yIHADRs3LdB+1ACbcKjlVQYkDAYGoKfpsahJwc6TG0EcjZyraANvZedWGFLY/DAn+oJgex5VIK6nYlD01KT+VKkOygf4eLK4IRiB3ghZWx7EClJPhm209xR2r8m70g9DkkVqpYw7ZlnA8ACRUXtLcR5cq2ORZhn61LhFjUmjJSfCaICXilBIx3SNOfQLSknw4iKcRpJJyAc5H0IFa9IYWPzxyeKEAj86isEZJLxRooOxMjJn6E1Pjj6KzZhn+GVlY6/w6/1ZBGPTnVVxXgvDOGRNNc3ChRsQq7k+A33r1JLW0eXIUvjwkz+YzXmH+0qa1l4qYI4GQWqBVBY/M252z6UvGkNSbMnJxO2STNvZIQORmJb7DambX4lwyxz2Vq0XIjsV/aqNtqjVUhqzdPwe041am54V/BlALGIZ0MB4Z3Bqkbh10v8qNvXPhniUtpxCOMNlGPInbPjXo8nw/DPEJ0h09qA7aUJG/gdQrJqSdIttVZ5k9pcA96I+1QEMmo5hYH35V6S3w5Eke6MTjOQWwPXut+dBXgETkEQxMARjM5Uk+hBp3LtE7F0HVeQH+vauNIp55by0k/nQEM4GTGBnkW/ahs3f/iSZ/u77ewrus5aGBOoONOD4cq52hY5LADwBBP60AlSO623UBcflU1CLusZXzxiiwoLqzy1EebEVNToXdTv4f50vqkA+Zj7mvhgd5savTekFDAuWIwcqPOvu2UPuyHwOnFA1MWDfxduXMComVsnv7jxyaLChvtwCASgz96GLmMsMyBdTlBjqR0quuLqIJJC10sc2Ae6u6+HSq5btrK9Nu1wsjGUN2jHSH1Y5DGQD6Vxa+vOMqidmjowlG5GkEiHLCQgA4ydt67+I8Dr8icVVQ38TxsbhjBpJGmV++OvWpz3IktC1tcqhIykkq5BrbT1Lim+TGenjJpcGYvL2/seOkT3UjukwVAXyGXOQCBtjenOL8bivn/DBIi6MUVlz3fHn6VU8TNzc3am9gi/EA9yYNgFV3K5Bx+u4oMkdo6yPbSrJLJOCshBBAxvlR659q5p7vnY6ILbjctbDi39mGeYxiUPbOujOM8v86ycXFGM4DaQMaSKsrZoMlVeSZxC+DJjQe7nkN99PjS7yXM8Ci34X2JLEF4odRPhgkbUXlaFJ407PRLXjKwQPPcJJFH2Mb62xh+6TgY6nzob/Fcc9hLLHb3EMeNCTN3e+dhjHLfqTWUguvksry6lKNbxuP4e4YA4U+QPPbJG1O8f49cCexS1ULbqgMqLERGWIyuRyODWena/E1nTqZc/iLyK3vza3JnuzLFg6Q3bkowJGOXLI8Mb1a8G4atpbLPLK91LKoPayPnA54APLpWXtbp5bG/kuY2t17SMyLG2jSvfG/1GfGn+Bcf4ctrHa3F1+GljwCk0gyfIE4qtOSjLdEzjlHZmtEuBhVA9CP0FfCTxlVfqf1pMToV1DLKeTCui4zsJGHpt+Vd9pnDVcjuo4zq2/wD1A5+tfayemPMBVpTQT3mA3/mO/wCZoi6Ngojb0jFADavtjtCf+Za4zaTvIfIBqCBtuMeQQCpKAD8kgHk4/KgAvbMhwTt/rxqWrXvq28lX96DqQfyyk+e351EMpJBWcHwwP0pWOhtBE2wd28sVPAC7ZA6bftSfYj+mYZ6HOPvXMdmcZjB/vL+1AFhnAySPIkkCuFt8rIMn/wCQ/vSSl87TDPUKMfoaOrue725dfASD9T+lABwZCMkZAPRv1zXTIQDlJFI6gFvvilgrq+zMR/e0n8wPzpglwuCgYe+PsaQEVeB8EtJnpnb8wKIsoXu9nJ6hMg/QmhrM6ZwwAPQEbexxUhc6c/ws9dowDQAXUs2QVUHyGK7ENDYQEeIDEZ+tBMy3CgFVIHgFJ+xB+1dDEDKZUA/MdWCPTG1Axhxq+b5v7xrgWQEqYtCH+cSbVxGjlBaKZyAdxq1f6+lQdJUJMU2c9FcD7EUAdS3BYkEN5hgf2NClsYmcMFkTScgA4B9iMGuNdTA4lVM+MkBB+qk1OKfUNSIh/wD1T7/Q0xCktqTIZAm3goKEe615j8a2QXj90TIHV8MGL6iDgbHzFetvMXXdcN4SLn715T8e2cttx1nKRoLle0XSxyx6kg8t/ao1P4mml/Ixn4UhQ0jbFsd2lnjaNyDg7kZqyMyKNJ5ihOisBkbVkpG7gq2Hfhbh8l/xiKNTgBhnHrXvEDRmHsVCdmowADlSB615B/s7kji48/8ADDsImZD11Dlj1NeuSRSmMa4CGIBypU/51cWsmmYzTpMRkSzFyymTswemg/Yg0ROHxzRkQssniD/mP1omh1X+MwdR/K4O32r4XQQhYGSID+XtAPoG/etKM7MmHjfAIfHhg5+9SBij/kcD+8+PsMUmGTSW0vpHMqzH642rsc0QOY0zjw+b6DersmhozINwufBdyK+V3PdVTn00/nQPxM5BMa6P8RwT7EmomRju7lm/p3JFFjoa1FSMjU33HtUdTL159Of60FdTDV2T46Fo9I+pqDzGLOZYh75P2osQ1r1d5mx/h/eiNIIMdqQgPy6pAD9Dv9BVLfXMN1bvBJNIdYx3R+hNZX8V+GL2naumiQg+Le56eQrHUc1/E101B/yNlxW2t79CDcaJVxokC7A+B3Gazs8QsDdPeaZmaRYVmePAGwIx4Ec/ME0u3Hrq2UFZW08hoOKqpOIX1wLgSIVS7yxYjAyvh+Vc7hN7yZ0KcFtFGkWxtls5OKcTkkbLaj3NbOCdj5Z351aXBspIFkuriR1VBlHlxj1xtn0NU1jDYX3DzbzXcjO6xFo2mCkYz1x67Ua5tuBZ1GWzedQqmJpAWOBzGDj8qz03HLFl6iljkit4xxKwmlRLSMSBcnCMSu4xvkcxSXB4ppeILojkZA38TQudjtmr6SFmt1VIrWCP+YM43+m/tVOltJYiKROIxaogdOMnHjy6eRrTUcVsmZQu7YovDbywmInR4oA+DKrA6eYGcU/c8Mv7yVU7Z2147kk4GDjkAOfiKel4xBoEbIrSgbuAQp8gvh5VoLG14vLaQ3VoH7J2DSa1AULjZhnnzxn1rOM58tGkoad7MztvZcQCQiKBe2QaEkdtBAzgH2yOlXP9v20fD/w3GrZJnTukGTIk2325/wCs12Xgl9JLBf295GzBsNGxJKMp3OkbkHl6Upe/C13MGvpke1iwGLMvdA885P2qZRjKshqTXAK04nGlhxL8NCzxwwKyR3BL8nXx8Axoo+LbQmCPivCXHZw6ZAQGDjGxAPLyqPB4OGxXcsE91K1vLBItw4i0hAADseu/lRZfiP4btMz2fCTc3AARJJBg4AwMas/lTaWWybBP8d2G4TbW/FGMvDOH3kOeTWVwygeoYYrQW/CuK2gEkvFIDDnDC7hGtf8AmQ4NYXiHx58QzErbtFZxnkkYyR7n9AKrLb4h4xHdfiO2upJCCDqcsDtjlTa1OthXDvc9kDWsFqZobe94hjZxbR6gv3B/OlGlUAdppyQDpKnIyM8s/pWP+EONXyXpN5HcSLp7uubCqfHHKtRHcqQFjlWQ8tPaHH2rXRlK2pOzLVUaWKGldD/w2I8jEB+e9fE5GzPk9Qgx+VIyA6yZUAU9FcE/lXDBpTP4ZGTOMtKV+2a6MjCkWPeAxIJNPkAtfGaJGA7SaPP9UynNIp2COCts6+YnIB++KKt0qt3rqaJf6CS+PfkaLHQ3HIXfMVxcHzWXP5Zoohn3cyT7f/IcfdTSbxdspcgSL4/hmXP/AEmox2nYjWluQDzKTMmfY/vRYUMrKYQcurk9X7NyPpg0VbyXOJVRsjIcJp29xj71X8Qv4OH2JnmgeQDZUbJYt03G1ZoR8S4qNSEQMwzoQEYHPnz8aznPEuEMjbLPt81qSeQZdJP/AEkiurdO7lextDjmyS6c/UfrWKn4LxSCVJe2ZlLfLvvzI1HkB6774p7h/wASrDEkF0WLEgE5Aweox/rnWfmae6NPFFr8Wa/Xdhcrbyf8sqsPvtX3b3eO9FKVPMdkCR9DSEItpiGSQxNz74Cn6ggU1+HuQ+Vjjk22aJ2V/sa3jJNWjBxadM7JcwupWVLY4/rQow/6sVBchNUAU5O2mdkx7HY/WvpuKJZwtJd3ICJ8wuGBx9s/nSMvxH8O5X8RLENWCMK3XkeQ+tVYqb4LIS3WosRJgdVCyEeuDmjxS9pubq3z1DoysPalYZ7WaMS2fFSFPL+IHX03GakJLphrBtLsDrrANNMVDxaZV1RyRsR1RsioSOJRm4tCx/qjIP50i11DFvdxTWT/APu4DJ+dJzfE/DrSTQeJWjnxjmIPuMHFMKLB7qG3YaJJUHXUcY+hqu+IeEW/xHwxoWvogYzrSbrHjnnI5e9LX/xpwq3s2lWT8W/IIu2f+YbfavPOPfFF3xYOmrsoidoo9h7+PvSbRSixC/sbeO8eO2u/xKoT/E0aQ+Oo8qVZGaTQu9FtnItXbYsyYGfU01YqkcpLsHZQMkjG5rCtzdPYvvhXhk8NxDOgYLG+p2V9JH6161wy+S6ASQCRT1POvHbbistrL2tvctG2ea9a13AfjKMnRchRNnZgMB/bofL3HhWetGVqSNNNxrFm5nh7CUqLh1zuvPDCl2h7QEa4ZPJlG9MW9zZ8c4Yk0JWQFdSEnkeWP0pCOWMnR2kikHGhu9+db6U81+zl1IYMwZV2OZJQV/wlvu37V0kcl/EEdACF/alTxIKurRI3gez0j67ZoMnECyZZm8t8Af8ATk1tRnZY6uz7xjijHQzSAmhyXDAFUllJb/2Y8iqn8RNqLJKkYI5lQufdsn7VB55djrWUeLSsdvfb7VSRLkOyyoF0voVs79rLkn/lB/ehiYA6AC3nHvgfnSqKHyTEiDxGT9hgfWpa5n/hB5pANwqFVB9wB+dWtiGFmIbus5UNyYxKMH1bGayl9BObiWUF3Gc6juTWnPaMrCRI41U5BklB39f+9JtZLIxYaZC2/dBwKznHIuEqMv8AiJgRvkjxpgzRSKgnLKR8p1HuenhVvdWkKxNkYHPfAz6Cqe5j0zBgo0kc6wlGjaMrL2x4fZ3Vi6QzkXpjARZSFVgd8gnmfChTcIkURRX9qYnbbMoK4PiDVaeIzxWEcKSd1GyNhkeWfDy5U5ZfE1ykP4d3OjnpPeU+qnasVkuDZuLLaLgV12bpZcQhuNfd/DzKunHl4V3h3AeLRXbK3A5XYDH8Q5h9c7VYfC/GrC14j2uhTHMFAWNMGN8899wD4CrWb41t4buWC4uiuiQrpELE+HPeuecppuKRvBQaTbPrP4PurtNV09vAxAbCKOfhnpVn+M4LweMRTXr3ZA0sokLj6Lt9TQouHW/HbSS7TWpgiZo5SzK4IHkdhWOuJ24hN27wlT2aq2k7EgYJ9+dYxbls2XPGPCNbcfG1skOiztQm+23L2H71n7/4h4te6oXlCpJt2ewH0HP3pRbSI4O4OBgqc0ZIzHvjHqOdaRjBbmTlJiMHay8Ttu1JZSJEc42GpDj74p234RbkBcojsDjUTj7VMEgpoYINWoFVHPlTsEEhkKKASBnBPMVqpO/xIaVbiX9lRgYW2XXjn4e1dTho1EN/EPhpx9h+9PqXjbAUgn6YqU7yBFKdmNtyrc/SrcMnuQpJcEbCxSJtSjs5PM5xVyhlEYDyRlQNo3/hsfQ4qtjlGgGSMEDclwNI++amRC7dxQ6/yiHWR9R+taQiovYmUm+R7IRDptp0Vhlictn31CpC4g0BkYv/AFYJyp9M0lHE8cgZpZUzyVTsfyqdvxFZ9pwysMh4yivkZxnbH1qromg63fNJZ41TO3JDnzNE0yMjHWGXnqZ+0H5mkJHhVyYBETy318vQ5xQp45o0/gZaTGRgrgexxVbiLDMSsrgu23eMIZcH6nNdR115VSwzjTJGAfqx3+lV9nFexBTdvpxuHt1VSwP9QB+9OPcKcpKZMHvBmJIH23pWuxv9CV5Gt/xZI2iAihUlsR6cHzxz9elWsEIiK4kKsBuFVc+2eY5VW28fayzTLMXGwUnJwOu3XfFPpcThQwl5gb6Cw+mMYNcyqWpudDuOnsNjtXJxJJtvkRYz6jnVRxrhcF3D20PaPcKc96HJ9m5+xzVikneyr2GTtsvZsPrmuTBhIcW4ZvEO+n7HB+tdNJo57aZQ8N4lMo/CSIrRrqB1DcnGefrWrtrK2eMGGQqcZAinYYPXbfrSF1w2C6Vc2ywSEbMjFj96+htHhwsodI1A0sp1fkSQayjCUJX0aSnGcd+QvFzxO2sTNHduyLjJkjWdlHhjnmsJeWclxelRBcPcOckSIBI3noUd0etbyzuzACkd/LKHxqScZUH1PL1FEjspYZZGgtIZTMdTq0qkMfXb860cckKM8DzuT4c4o4wlpNGM85UMa/egvwTi0Ay1pKwH80J1D7V6gLiSxx23DrqAHosjOn2NfGezuH1PFpz1Vyc/UbUKNdg9Te6PI5SUbRLrVh/LJkEexoZIG2a9fl4bw+6ABYHoFmjU/n+1Jtw6wspMy8JsZU5ZEKow+xBp4y9h5F6PLld5mEEMbSE8kRSxPsKsbf4C43foJktDAh5tMcY9QMkfSvUrax4bIha1RIGx/wCnpTHuv6ihzi7spNSGXA/mDBW+vI01DuyZat7UeUrwq44TfCyvEUTIpxhgwIPI58N6QRh+NnPRXOB6Vq/iuXt/iZrh2bV+FByygHIGOm1ZKD/i3Lfyls0uy1ukGaRiNt/HNdaeVYBKhIaJgc9Rjr61BTkg9KYtrY3MzQKAS6keu2frVCZuvgj4kRmCnESs5OleQzzA9xn3rb8UiGVnRGkST5saWAb/AAnx8jXgXCL2W2mDxkkoxKjpnGBXt3CL08U4IVJ1FVbSfEqcE/nXPXjnfTNH/UhXaPM9LSZaGS4uCObArEg+oomLjB1CMZ/lDkk+9H7jnvgSY6gZA/5jt9BXf4WdIVRnohLsa7FM48BaGKZ2wiRxkbliupvvRPwqIf4bKZP6xlm+2wojIoOkpGeulgWI9RsBXyMWf5oQB/eLEegGwocxqCFfwEkramDS+oLD88U0lu6jAWOJRzOgE1OS5cgCRxty1y5+wqBaNx3gPIs4X7DelmGBFrW3Rg2l5X/qOQB7ZFBlcRnPas2dioI3+/6UY25x3VUDxc//AFGfvXwESDBeMt4sMY9BQpA4ldPHiNpRahF5a5SPt51V3kL3ES6QuhAW1BdI/wA60Zs0upABE9w/947fQcqWurBXOhho07YTGB+9TOSocYuzLG2yQc898GhmyZttQLeA51ozZonyrqIOAccqagtEULqUKANzXOpq6NsTKQ295Ee4GUHmDTUUPEGbJ7L1cZrRTQISNiR4cyaLHaoV1Kigj+rf7VMpOykkF4VccTSzNtLeg255p8qmhqY1BjQKdzkkE/SvjlGOtDpPXw9q+YhsFsgfnXK4uzZNUEgyTy3pkwlhvufGl4VKA6Cozz1D9K6WByp0nTzGcYraEVREmEyUIwBtsPA0zBJ/NpkSTlkHlSsscAUNARp2yM75o0KNIwjifdT/ACnOfKrWxDHYJo2/8x3jjuaup/auSPBGvMDJ3KbaftQEWcytGoZjn5CAalLcQxo80kqRlMhw2xBHQiqToVWcJXJ0Ngfzd79aknb6ORYKP5AucfSnkWG2mD9vDdxMNQUqRrXxG/LwqunH4Y5t7KQxtlh3th6fSqUicSNxKs4VZbQP07TYkGjRI9uqCOOGRgvfkR8FR4L50WaSzit4SNmmj1NljhG22OarbTilw15KgSVQ3cVwAWx19zsM0J3uPhjo4uqssUjyEH5SxOG98VOSVLgaWijWZRsW1DPuKtZeA293ZRzxXcsUpVS9vc4yp694bc98Ukt80J7KTvGLIU550svbBxIQ67dYyJFhLrusinHhzHKjhjEh0Ta8bnRJpHsSaXV4pDrd3jDnOdeB+VEeFVeNo3V1I7xJ1EVSa6Jo5FeOJSzWrHS2NQKsfXI28Keee3aIgJOrhd8NjOdsb7fpQg1uiqqLozz7UaRnp459POoOoUEmJXDZOQxAXP5Vk21KzZU40Qt71g2hItSEZ/iLuPH0+lHimijZljuCudyAUP22oWwJhnkiG+FUZyR49f0qL8PjQahGsit1ZsH3Fbpt8GDoYN1Ekio8CsG5SB9z6qP0opQ2brcpMGjJwwEjkp59cj1pJ7i4t4kRrdXiGxwdsdM5/OiWUInmVrSBopS38hXT9dqbsFQ0zXMhJFpazLqwGJXDjyyc0TsO2iKXVmsca/8AtNuo9sg+4oV0HgkJZZJDk96NdWPfAP1oSXQeQ9s4hzjvKsiMKMkFDi28kMfacPvTLCDsA5BHtUknMjab5C+R82khvfY0vHOBP/xYmcjaRdu0HnnGTRhemRD20UbqmzCS2YY9xVXRIaO3ilUva3MkyrsUyCR+R+tdW5aL+CHz/cniBHpnmPpSebCQhgPw4PKSJjj6nlTGqIjszcu5HJpMEH7GmArdJbLcap7eSxlPytDINB+oqzWC7ggEkMsV9BjOUyrr9NvtQlklNubfMDIf5NvtzH5UksH4aU4WW3I/ntv1Tkfalug2Mr8by6OLWt0sBiJhxh8EEgny86x9uMWrkn/iSk/Qf51vfjmJ57GzuWuIZ0jdk7RcgjIBGVO4Oxrz2e4/D4URhgMnn41NqzVcB+Qzmrz4TKnj1or6SC+N+oO1ZsXbMcdioz4kmr34WmmXi8RiEQZe93y2MDfofKiT2ZS5TKOAiG8lXokje5BOK9S+B79exFuPljQIDnnsNR/6mP0ryjt+0uZJ9AQSOX0jkMnOK2Pwvxb+z7kJIgZOwJY5xpAJY+5JAqNRXErSdMI7yEnvFiPIEVxVkkBABwOZQAD3NRPZK2EXWR1kfA9gKl2eoa55hpHJMk5/Krtswo6ML3FLykcwCAoPmak0zlR2pyOihwB9qF2zSfw48hRyAAA+1EFuwGp9IPixyfzqRk1Uy79y2j8cBi313NQPYoe7IWPjpFCkk6Ix8yWGT9KlFFK3eCPpHN+S/WjL0FHRKxOys2T/AEc6OiLE38dNOR8igBvfwqALjPZyMfEqP1riMIjqI73iWGaVsewYuD3QpRDzAU5NDkBRSo0gE8sb1FZXbvRlyeWx/wA6gwZjhslselJgBZdAJRRg7ZJ50eGUpEVlIII2GrAFDCd3fOByxvXezLRFI9yfLNSluU2TVR2BcKpUNgNr5+1fCOV1LwoWA+bBxj2rgLALHsuhdI25ClpJ4rdmftWVsYLq2OdDiCaDgASYYDUehNG7EFDpIUY3PhVet0J9QSZX25ggkUxEzc3dW9FAz9KhxLTJuwLMsbZVcaWzg05FAojDmUsx3I60nMMoOy7ufCoPPIjojR5G38pziqinyS2NTCObT3SMc2CnK+opQMih+ycg8idBP5VYi44a8KhOGSRSjlL27Fj6jlXCezuTIwyjeO2aal+hNHbTiq3nBk4ZFPDI0DF9SE6yd85zv1oIMaApNDGW5liNz79aKpjeT/ysSldtfZ5P1qcVxHCAijug5yQN/LehuMd0G8uScNxHdShWMjtpwNP8uPDNXXC7/hMUei4hZjkjvzAjfxGKqpVFxCZ7UsJU3CZ+b2okVrdTay95ZROukMhlVTvuMZ/epf6KRdXvBBDbfiY4n7BAdUUhzhf6hj2296hacJtOIytHaxhQjgHMuAQee+1KXtxxjgdtE07rJA2Fjljl1KvXGeh3o9nrW0ubiK+03xkDiOUDQoAORkdd9/QUsmkOkWE/w+OGz3EmZWhigyqhhqb0ycHxrJXnF4IXKxCZmZgQCFBPhvyFba24u1vbRy3jqyQ41OgO5PljkKzycMXi9hLNwtkeUl3McqjTpzkYIGR4VUVluJ7CH4i5McIle20SZcGPJYeoI9tqbglO2t1lgQ95mTOMjbPKkvh6V1dwwbtFYArIQRz3AqyueHKtzcXDXIhYP2i2rrpYnOdGP3qb3oK2sdmtFNnHPCsbaiBpGRgnwzS0tpcSW3aMkiopxoDnf0wCMYrOcWv7uaVL/iV5NAqPoS0iOylRvgDYdOfWrzg3FpOLRNGjaIhjvuuNhvpyDjp096qUXVsItXQsIY0AZhJHJqOoFdidulCe/s5lMcxlJ/qGx+1XkxtY8tc2/ZvINSIwGXyTg6s45VSTcQgaV4ooUkIB1BUDkH038c0RkEonIYLND2kHE7mJvAbZ98UzMJWkjkhvBcqDodpWAKg9QfEc8HnVZGY5Yu2tp0IY8niBDZ6bf5VaR2vZiOSa0e3LMsZaOQhQTyI1Z22Od6pNdkUEj/FaytxrGnJ1BG5+O3Svo5Je0DzhpEyMSRsWHpgnNR/Gwwu0EEslxGhOMoAM56HPL2oiSQt3YW1a9yk+hCp8jjBrRSVckUHiimeJ1hK3CxnUokbcA+HX61GC7RZ8zKqzHICSKe9494UORewAadBqJwpaUJj0YbH0Ndi4lZM3Z3EDKy8iJcr9qeX7Ciwje1kXYAsThkDZOPfc0rNbizcELrtXx3hnuHzU7iul+GsmuFITKOayNoPsds0zHdxNEV1XNuXPeWUa0PuapNMW4qmhSWtruFZFPyAsGPqCMVx+NzWTk3ASMeE2yH9vaqf4suVtOHN2SRLNkDtYm3UdT/rxrzy4uZZWLNIzMepOTU3XZSjZ6F8T33BeI8CcxXqJc6lIg1ls+OCOmDWCnjjA1MwZulOcJ+HuLcYtvxFt2WjUVHazBC2OeM1V3kM9tcSQzjS6HDDPKk32UltREbNy61f/AAjMsfH7cvjTkhs+GDmsyG8KnHdSwkmNirEFcg74IwftUt2UmkStygfWfkU7Dxq34fKrzIZThJnUyHwjU5P1x9qogRsOQ603DcsGyqhs7aT18qvolOjXCTsdgIGPkKGGkuH0iPWfAchXwQMCT3EB3YmiF4uzEcSkDqT19azsCXaRwroVQH6nO1C0yStshx4gVBhHnvZPtXe0RQFRSg677n2pc8hxwFVzHsmhT443+pqSo0ilmyyjmxJIFBR2klVNeAeed6badtPZxsFUcsHnQ2goEWbGO9oHIE7VEPqJCIB44H51MiVV1Eq+eWrvE0NriRl0ucKP5cYH0o4A7nGWDKMczjFHg7N4HaRmTI/hgfzeJ8qUMgc4K5HXrUljLY0HQByBFK/Qwknh3cHopJrkbYGNQH1396LGSF7z58fEVFgocsCMHqBmi0BFlWLAVWOrqSSD7UCS3V+YX0zimmcaQSSc+YoRYKDpUkmlkFELWzSK5SZQodT3TgE0SaRUctjJJyTy3oiOrLhtj60OZC5CUXYUSju7VlYsp1YzgMBvUGJlcgy9NgTUBbME1dmCPEDOKIYioMoTujm1HABbeB2cKp3IycGmSJItIljZlO+4peyulj7RRkllxy86bXiNpZLNdXiNcouEGg7gnr6AVK/RVezkNm8pDB/m3AFAvF7K2kn0JqQ/KuCx9qflv7OWxgltHUBxs42DAeI8aParDIyyFO1eMCQK0ZwF8TkffNTnTplYbWY/+0J7m4VEQRamwCxOffFXVpHHcPbpckSGFxllj+caskE4/PNS4sq213HepZHsmOU7OPC5H2P+vWrT4JN3xK9dvw9usa7kmMH65rdpY2kZx5psektbW3tne1lhkhPe0XEmACPNjyrKW/FbIXxSW/WG3JyxSEuCeo2/OtnxaPhs8ckPErMW+odx4flffmV/UVlrv4cs449dq/axYAd3wNJ8AOv6ZqIYtUypWnsX3DbqAGbTeLcxaf4TxkkaPAjx/anIeM8M4dbjszFBFKmCQ3eznmQP86qeB/D5tbiDiX4mCFlAZEVgAGwcAg7bj70DjNrDfSRxy3ERaI47gbvZPy5G23+s1Kik+dhuVmjg4RF+Lj4zbQRukDB9Syas+eB4U7Lb2vHOJAyQKRK575jODjzB2O3WqAngtlYram9e2CRkGONuzLknOc9fD/vWeTjtzZcQjj4belbWWTCyFdR0k8t/LnRi29mGSSouvjmews+NmKThgdo01FkOFz6AeFQ4D2PGClsmbZ8sII2/4ekDJwR984+1au7t+H3PF4rmVYJ1a3ETxysVPXlnkPWkYrWW04hG9pw+C7tcEGS2bvw5+brkj7UNpgk0VZ4fYXs7QiURzRt2RV11owG+QM7ZFJr8OWV3O4njPaBWIeGUIy7ZBByc4/ethb2ltqhjSSGaZpNTx9qpA2wdufI5r644dDw+OeCALKVxLBAzEyBRnUM++3rRFtIbpmaVexuUknZfw4TSZY48OuORYci233osl0srJIY1nRGxqLAbY5Y5ZOKHxsxpE960aWy90AI42x4jxNZ6L4i4fHdK0yyKNtbrHz9qEpPhCtLk1MvDbWSz7ZTpVNmiEY7v60i9qFiACGVQdniO/uCaJacTglsGNrKrRsw0upyBjoR06c6GjdrMrd9XwQQhxkenTGavJ8MiuzhvIuH5SeI6ZBjrpPn1zU34dHcxGWykMeBmRGQHnyI8q4k0ySGOSXWCORJ2386ZWaCIS3rxSCGNSSsA7zEdCDsPWqUvYsfRWMv4NNTXY+4z5YwaXk4rOFK2zPGDyU41fUAYFLXnEZb6UySRrDFnCKDkgVFEOA0Y0LyLfzNUZp8GmFFVx1JTas8rmSRiO6vQelVPD+GrNJqvRMsQ6RgBm9Cf2rYlRpxoAOfXNCmt8qDjx2quqE3uX4/seThsEvBrd47eNBHJAzd6JvHnuD4+PrWH+MrZIr5JVIxNGGyc5yNt/pTlrxCXhF32qDMbDEiHk6+Fc+Mhb3dlZ39odUJLKy9Rnl9xVE9mLBC5LVDdj4Cp6STuBtzJruNtqtImzirjkfrRYiAQSoOOnjUBUgcAb06Ea7OwGDpFd1oOZPlUomwNo4znq53NRkjfVns0A/xZrEo4JCcgNnPTnXDDNjIiYDxxUXx1Kn/DUVYau6mSPEZpWM6GMZO4z60WKZABqAYeGkUMvI5/4YOOmkYqYdsbMqn+6KQxgyJnuKI/Ig0JxC5/iMq/4ck1AsyjIJPma4s8nIPp88UWKgotRo1qJmXoTgD718dXmR4F80EqeZZT55osUzxkYxjzApWn0OiSMgbv5x1AxmjLIjIAy46ajUHWOZdSKQ4O/p6VwHI0FPtvSpod2cwVY75/w1x3KjDEjO/jXzkDu6mIHnXTjTjWBjr1piJxuNPeAIH1xQ2KBsLuDvuaG0Y0kM3zcip/SpxRqQsZJIXkyjlRVjsYicID1HXfFduDDFBqdirjo3Wqu9t5dBCksD0HWl7a5vBIQzs8eMGOQkgeh5ihRfYrXRZ3Js4rfS7Fp5QpHZvso8/PlScPDO3BxdAgjkzU6IrX8LHrdS5JOlGDPj+8eVGmCRHECFYzgKp3OPEnlVRpCe4Gxjv+G2b2duYnjL6wTglc88Z9BRRfXGrSbqbL4DlpcrtjGfDlXyRl5FAjbc7k7D1oU8HZSZ7Nhjk2T9aKQWwV7xieNexUEoTqZSN1Pjv/ANqt+DceHB7NJGgZxnLKh2bfb0qpPZSMglEjKv8AMhwR7GmEERBDBZFxjD5Bx7UnVUhpvksbn4kXi6maAYVD3oiN0Pp0/Wk7G7aW8iijuhFJOxCHPM+APQkUNVtbeTtYYTEx2Pe2+vOoT8KHFAJImCuo7uM6djnBxyPnTUY9MWTC8UvpUlSyQvoi7ylufnTfC4r2/mglVF0k6tkzsOeNvKqe7u1hjkFyQ8iHTG573Pnkncj96297c3l7CYeDoRDEgR5AMGQjA2PLHgB4VMkorcuP5FXxmLhwdIpdV0dQcKRjsxgjAbc5HgDiqm2sFtWM0Wl2I/hkoQyDOcjp99seFGmtpkfsn1o+chWcYJ8NqnDNKqkSJIRjBBJH5VUXtRMuSHEwZL0sbhzM6KzqCqkMeY9P3qpu/iG+4eVSGeaF4nzgPpYE/wCVW81gt2RI0adopGjffHQY5j2Jqkd1I7O5gNwnaAf8PcjPImtFFJJ+icm3R6BwliLez4vaywqssYeSLBJK53x4ZO9R4rxAXHFJeILOyamUrEraWGwzkj9KQOmzkVeHs8ccUeIyAToA5A/6618jyuVkYAkvq0HdW25HwrmvJ2a/x2ONL26tlw6ojL2bPpY89/AjlVC/DAwctt3cKMZB/b1q5iVLhwViLMGxpTYg+X2pfjF1bwSpbRBZbmDvSaWAB2GAp5Z55rWJmyvsLFbK5aT+JG24PZPpDeviKvZeKobeBUPa9lnKNgPvzOojf0qhE07HS1jOoO4w+dunSrK0a3kfRM72pYbF8MM/TIqmpdiTQ9A1rPLIIJkmMJKOoBDIfTrXfxYjhe0EsQEhGsGNm1D8x7VSRQ3cXxA9za4PagrIujEbDGNvBtsjzq3tpZWTS8zrIP8A05DjNJquR/8AAhfW0VsqvCYyr7HcllPv0NDVtQwDjI32q6KwzsYLmCWJmO2o6lIPgTVRf2bcOnVNReN9425EjwPgRWbilujRSb2ZJMBjq3K7AkYqLsSpIPPrQ0udyrZ33zUyVzqbkw38KpSBorbyFZAwAxkbZqpS+FpBccPuy34W5XmBvG43Vh7gZ8qvrl1ZCGXDKdjWW4sO8FPPPIVonbM2trEHYn5t286hRMgDc5xTtrYRzwwu5KmRXkbSPlReX1NaN0Styv61PYAV8FGM6R9ak6kEAYA8qNwNIvLB60URxj+fPttQgQNlGT1JqS5OwWufYujpGT4+1fMCNgQD610AA8h6neotgciPXFAEGZkODtREYDdhk0Fg3PIArsbHORU2MZGg77L5DeuFiW3NQMhxkmuCTPgaLCgjMCMAjPkK4DpGp2A9dqj2eRlBuehNfHtY/mH2zSYDEc8YKnAwv9LYJ96JC+ZVM7Mqb5OnX9siq8yAncfQUZJVAweVCYyWRryynHrg0whgZGCgq/TrmknkGrZgPUb18JCN85piJyoVbfUfLlUknRMErkjpmpwtPM5CwNM2k91Acjz28KXNpcM3yFuuBQ16BP2MpelUK4DK38rLqHtUXeOZR/Aw6/0nAx6YoADAgEFfE0ZGTVvlvHelkOj5JGTu7L5YpkTFsZIH+GgzQxmMOhPnQCxQ6c59KG5IEkx7YthXP5ZpiEmWVEyytnd1yft4UhHJv0NHieQSqYmJc7DB0nfbnTUhNIO9hLGWeCWOXO+UO9VrCVHIKnbnRxKUI7MsGGzb9aMZpGVu2YEsuxIz/o09mG6EwXKkbjPQ1Y2NyYuFSpIxTcpnw6ilI7V5VZoSHI5jODTFvcXNtA0ZgKxsRklMgkUPYANt2lpfrc9pGw06gCoIY+PqN/rV9c8bnuJVgSYIB/KrDQOvOqW4BusaUEZY5IXYE+nSoGI6CMMHQgY/z8qUlkOMqVDUly0w2aMOd8sNX3rscN7pOIWwRu0XUe1V5MiHD51edTglaOUSDvae9jOPyouuRVY+wuEUFy8kQAG4yV8Nv1pZ1hkIZxgg5EiqD9cUdbkSH+OpdeRK4Dj36+9LlES6LpMdHPvJ+Yqr22FW+46l5JGwZJUIxglGx/nT63mq1JciTsyNDk7+hHhVfA/D9LB42Vz/ADIB+VDJCMwjl7SM81Axge9RdcMvnksZJRFIl5BI8ZkBIGnOlutIIZlvnmcE90t/4hMqPccxRR2GjQ+tfEg9PTrXDLEilbcMyHbDZzV5E0EWOOFDkTQAn5oJMqD4YP196ilyA/dkViDuWhBP54qVtcxpEVEUZc8mIyRj1oVw4NwXMMQY7ggEfajL0LEPdrAXEkUjYY6jg6cf8prgnuMkEQ3Seg1EfnQpZGaNGKKdsZAr6O5RSqSIxQ9Nj+2Kez5FxwHgBmHZsqxsvJNQO3lX1zbyXELwSfxcEY8VoqywHKhTIo5DV3l9MjP3qEjJpzHNIuOY07/WnQ7KCftbOcwygrjfBHMV38Whwoxuatb20tbtEMrSqwGVY0skMFtOptVXWo+Zhq+lZ+N3sX5FW4qLfte9K7JGBu2gkkeX+dZ7j0kI4oYYFAjhQLqwcsTvk59q0M/FpkBlZVITdsADOPvWPuZ3vJ5LmU5eVizVvGOLM3JyJQR/iZ44QPnYCrpIHv5mhtl3uZRDHgbJCvzH0qs4dGyJPdYJMSaV/wATbCtNwbjUPD72PhUsESKgEQnUbl+urxGTVPdgtkZjiFhLw2/ltZVwUbunHzL0P0qDoDobpgVofirjcNzO9hDbRSdkSrTuuSD1C+FVNjCJWUybRxgvIf7o51ZNDjMN+lTR8DmR4786HJ89cX5q4zRDGdtmHpUTudxUR1rg50WDJuFZeZFQXbcGpyjEdDj5GhsETM2Rnb3FQVzqG2PahP8AOa5H1pXsPsfFwAMMqn2qPalwQDtSee6fWix/JTTYmRkfDY3+tcUk9SalMBnkKilDAmE3zU0GTU46mvI1LQ07CxSNDnQ7KSMHSxG1fGYlcDn49aF/LURzoTYzhfLbkn3oqFc7D60q3zGixc6TYDveER7uxpNwzDAO46U0nLFLvzNVewqPonOjBANNwjX0xt9aRVmLAFiQvIZ5U9b+PWkuRvg+eV9CQucCPOnugYHrQGVzlQrH0qzuwDEpIGdPOkztHkbd41eJGQuhQjvuVIOykU5aXJjyI5cLjdSdjVqsMUnCI3eNGbbvMoJ61SXICuQoA36VMk48MpOw/a25ckxEgnl2hxXdcIfMdudP95i1JJUwTsMnFJMGhqRu1B7Ts18Qo0+XLlUFihjfIcyJ4EYoSkmUAnbFdHKhyBIbma1dFkiHZtyZc5HqKjHF2isGJQjk43pME5O9OnZ0xtkfpVJ2AI21wkmNJYdCNqidSNkqdjvRJnfsz3jsdt6Ex1Sb77daMUFtDSzqD8gkUjk55fSiq4IXZExzCL+dLwgfh325HaujmPWlwPksNduFOpQ22x0YxS0hRxlTjB5EZrmTgetBb/iH0ouwG3ykQYtldu8vL0NLFVYlhqVc/MuMfSu62VF0sRk4ODXbP/iyjpg7Va3VkPZh7de0OI7tGlHyo406j4etTX8Qf4b25zzGP3oFuAZjkD5c/eixswMoBIAAIAPLeoc6ZSRIxIvZ9rLIgZBgEZG5NDm4c+8kbKzKeSsAc05ef8KU9RGMeXKl7g4lbG2R09KNHUt1QpRM38RCSOwyqspdwsgONqyyu67YGK1fEyW4Pc6iTiQc/wDFWTPKuu7MuC7s0WCKDtT3QDdSg+XyiqySRnkMp+djqJ8+dWt+MRX2NsdiPbHKqc/MKUd9y5eiZOt8nJydz4mraNQsFtagjtbtwW8o1P6nf2qqj51d3Sqt1b6VAzBHnA57CnJ0hI//2Q==" class="mt-3 rounded-lg w-full" alt="Systeme">
                            </div>
                        </details>

                        <details class="group cursor-pointer bg-green-50/50 rounded-lg p-2">
                            <summary class="font-bold flex justify-between items-center text-green-800">
                                Intensif (RAS / Tanks / Hors-sol)
                                <i class="fas fa-chevron-down text-xs text-green-600 group-open:rotate-180 transition"></i>
                            </summary>
                            <div class="pt-2 text-xs text-gray-600 leading-relaxed mt-2 border-t border-green-100">
                                <p class="mb-2 italic">Teknika avo lenta mampiasa teknolojia filtration (Recirculating Aquaculture System).</p>
                                <ul class="space-y-1 list-disc pl-4">
                                    <li><strong>Fotodrafitrasa:</strong> Tanky boribory na mahitsizoro miaraka amin'ny paompy sy sivana.</li>
                                    <li><strong>Sakafo:</strong> Sakafo voavoatra manokana (pellets) manankarena proteinina (30%+).</li>
                                    <li><strong>Isan'ny trondro:</strong> 50 hatramin'ny 100+ isa isaky ny metatra toratelo (m³).</li>
                                    <li><strong>Tombony:</strong> Fitomboana haingana dia haingana (4-5 volana) sy vokatra goavana.</li>
                                    <li><strong>Fandaniana:</strong> Mitaky herinaratra sy fitaovana lafo vidy.</li>
                                </ul>
                                <img src="data:image/jpeg;base64,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" class="mt-3 rounded-lg w-full" alt="Systeme">
                            </div>
                        </details>
                    </div>
                </div>

                <div class="feature-card bg-white p-6 rounded-2xl shadow-sm border border-cyan-100 transition-all duration-300">
                    <div class="w-14 h-14 bg-cyan-50 rounded-2xl flex items-center justify-center mb-4 text-cyan-600 shadow-sm">
                        <i class="fas fa-tint text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">3. Fikajiana ny Rano</h3>
                    <p class="text-sm text-gray-600 mb-4 italic">Ny rano no 'rivotra' iainan'ny trondro, ka tsy maintsy madio foana.</p>
                    
                    <div class="grid grid-cols-2 gap-3 mb-4">
                        <div class="p-3 bg-cyan-50 rounded-lg text-center border border-cyan-100">
                            <span class="block text-xl font-bold text-cyan-700">25-30°C</span>
                            <span class="text-[10px] uppercase font-bold text-cyan-500">Hafanana</span>
                        </div>
                        <div class="p-3 bg-cyan-50 rounded-lg text-center border border-cyan-100">
                            <span class="block text-xl font-bold text-cyan-700">6.5-8.5</span>
                            <span class="text-[10px] uppercase font-bold text-cyan-500">pH</span>
                        </div>
                    </div>
                    <ul class="text-xs text-gray-600 space-y-2">
                        <li class="flex items-start gap-2">
                            <i class="fas fa-exclamation-triangle text-amber-500 mt-0.5"></i>
                            <span>Hafanana: Mihena ny fitomboana raha ambanin'ny 20°C.</span>
                        </li>
                        <li class="flex items-start gap-2">
                            <i class="fas fa-wind text-cyan-500 mt-0.5"></i>
                            <span><strong>Oxygène:</strong> Ilaina ny mampikofoka ny rano (aération) indrindra amin'ny rafitra intensif.</span>
                        </li>
                        <li class="flex items-start gap-2">
                            <i class="fas fa-skull-crossbones text-gray-400 mt-0.5"></i>
                            <span><strong>Fahadiovana:</strong> Ny loto avy amin'ny sisa sakafo sy ny diky dia miteraka amoniaka (ammonia) izay mahafaty trondro.</span>
                        </li>
                    </ul>
                </div>

                <div class="feature-card bg-white p-0 rounded-2xl shadow-sm border border-amber-100 transition-all duration-300 md:col-span-2 lg:col-span-2 overflow-hidden">
                    <div class="bg-amber-50 p-4 border-b border-amber-100 flex items-center gap-3">
                        <div class="w-10 h-10 bg-white rounded-lg flex items-center justify-center text-amber-600 shadow-sm">
                            <i class="fas fa-cookie-bite"></i>
                        </div>
                        <h3 class="text-xl font-bold text-gray-800">4. Sakafo sy Famahanana</h3>
                    </div>
                    
                    <div class="p-6">
                        <div class="grid md:grid-cols-3 gap-4 mb-6">
                            <div class="p-4 rounded-xl border border-green-100 bg-green-50/50 flex flex-col h-full hover:bg-green-50 transition">
                                <div class="flex justify-between items-start mb-2">
                                    <h4 class="font-bold text-green-800">Sakafo Natoraly</h4>
                                    <span class="text-[10px] bg-green-200 text-green-800 px-2 py-1 rounded-full font-bold">Maimaim-poana</span>
                                </div>
                                <p class="text-xs text-gray-600 mb-2 flex-grow">Plancton vokarina amin'ny alalan'ny fanamamasahana ny dobo (zezika biby na compost).</p>
                                <div class="mt-auto pt-2 border-t border-green-200/50">
                                    <span class="text-[10px] uppercase font-bold text-green-600">Rafitra Extensif</span>
                                </div>
                            </div>

                            <div class="p-4 rounded-xl border border-orange-100 bg-orange-50/50 flex flex-col h-full hover:bg-orange-50 transition">
                                <div class="flex justify-between items-start mb-2">
                                    <h4 class="font-bold text-orange-800">Sakafo Fanampiny</h4>
                                    <span class="text-[10px] bg-orange-200 text-orange-800 px-2 py-1 rounded-full font-bold">15-25% Prot.</span>
                                </div>
                                <p class="text-xs text-gray-600 mb-2 flex-grow">Fangaro vita an-trano mampiasa vovoka vary, soja, ary katsaka voatoto.</p>
                                <div class="mt-auto pt-2 border-t border-orange-200/50">
                                    <span class="text-[10px] uppercase font-bold text-orange-600">In-2 isan'andro</span>
                                </div>
                            </div>

                            <div class="p-4 rounded-xl border border-yellow-100 bg-yellow-50/50 flex flex-col h-full hover:bg-yellow-50 transition">
                                <div class="flex justify-between items-start mb-2">
                                    <h4 class="font-bold text-yellow-800">Sakafo Pellets</h4>
                                    <span class="text-[10px] bg-yellow-200 text-yellow-800 px-2 py-1 rounded-full font-bold">30-35% Prot.</span>
                                </div>
                                <p class="text-xs text-gray-600 mb-2 flex-grow">Sakafo namboarina tamin'ny milina, miandingana eo ambony rano ka tsy mandoto.</p>
                                <div class="mt-auto pt-2 border-t border-yellow-200/50">
                                    <span class="text-[10px] uppercase font-bold text-yellow-600">Fitomboana haingana</span>
                                </div>
                            </div>
                        </div>

                        <div class="bg-slate-50 rounded-lg p-3 border border-slate-100 flex flex-col md:flex-row gap-4 justify-between items-center text-xs">
                            <div class="flex items-center gap-2">
                                <span class="w-6 h-6 rounded-full bg-amber-400 text-white flex items-center justify-center font-bold">S</span>
                                <div><span class="block font-bold">Zana-trondro (Kely)</span><span class="text-gray-500">40-45% Proteinina</span></div>
                            </div>
                            <div class="hidden md:block w-px h-6 bg-slate-200"></div>
                            <div class="flex items-center gap-2">
                                <span class="w-6 h-6 rounded-full bg-amber-400 text-white flex items-center justify-center font-bold">M</span>
                                <div><span class="block font-bold">Trondro Lehibe</span><span class="text-gray-500">28-32% Proteinina</span></div>
                            </div>
                            <div class="hidden md:block w-px h-6 bg-slate-200"></div>
                            <div class="flex items-center gap-2">
                                <span class="w-6 h-6 rounded-full bg-amber-400 text-white flex items-center justify-center font-bold">L</span>
                                <div><span class="block font-bold">Fatra</span><span class="text-gray-500">3-5% n'ny lanjan'ny trondro isan'andro</span></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="feature-card bg-white p-6 rounded-2xl shadow-sm border border-rose-100 transition-all duration-300">
                    <div class="w-14 h-14 bg-rose-50 rounded-2xl flex items-center justify-center mb-4 text-rose-600 shadow-sm">
                        <i class="fas fa-heartbeat text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-1">5. Fisorohana Aretina</h3>
                    <p class="text-xs text-rose-500 font-bold mb-3">Ny fisorohana no tsara lavitra noho ny fitsaboana amin'ny fiompiana trondro.</p>
                    
                    <div class="bg-rose-50 rounded-lg p-3 mb-3 border border-rose-100">
                        <h4 class="text-xs font-bold text-rose-700 uppercase mb-1">Fambara aretina</h4>
                        <p class="text-xs text-rose-600 leading-relaxed">Trondro tsy mety mihinana, milomano eo ambonin'ny rano mitady rivotra, misy tasy fotsy na fery eo amin'ny hoditra.</p>
                    </div>

                    <h4 class="text-xs font-bold text-gray-700 uppercase mb-2">Fisorohana:</h4>
                    <ul class="text-xs text-gray-600 space-y-2">
                        <li class="flex items-start gap-2"><i class="fas fa-shield-alt text-green-500"></i> <span>Aza mampiditra trondro be loatra (surpopulation).</span></li>
                        <li class="flex items-start gap-2"><i class="fas fa-shield-alt text-green-500"></i> <span>Ovay ny rano raha vao hita fa maloto.</span></li>
                        <li class="flex items-start gap-2"><i class="fas fa-shield-alt text-green-500"></i> <span>Atokàny ny trondro hita fa marary.</span></li>
                        <li class="flex items-start gap-2"><i class="fas fa-shield-alt text-green-500"></i> <span>Tandremo ny sisa sakafo tsy ho lo ao anaty rano.</span></li>
                    </ul>
                </div>

                <div class="feature-card bg-white p-6 rounded-2xl shadow-sm border border-purple-100 transition-all duration-300 lg:col-span-1">
                    <div class="w-14 h-14 bg-purple-50 rounded-2xl flex items-center justify-center mb-4 text-purple-600 shadow-sm">
                        <i class="fas fa-coins text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">6. Toekarena</h3>
                    <p class="text-xs text-gray-500 italic mb-4">Ny fiompiana Tilapia dia orinasa mahazo tombony raha arahina ny teknika.</p>
                    
                    <div class="space-y-4">
                        <div class="bg-purple-50 p-3 rounded-xl border border-purple-100">
                            <h4 class="text-xs font-bold text-purple-800 uppercase mb-1">Fanangonam-bokatra</h4>
                            <p class="text-xs text-gray-600">Ny Tilapia dia azo jonoina rehefa mahatratra <strong>250g hatramin'ny 500g</strong>. Amin'ny rafitra semi-intensif, izany dia eo amin'ny faha-6 volan'ny trondro.</p>
                        </div>
                        
                        <div class="space-y-2 text-xs text-gray-600">
                            <p class="flex items-start gap-2"><i class="fas fa-store text-purple-500 mt-0.5"></i> <span><strong>Tsena:</strong> Manana fangatahana be ny Tilapia eto an-toerana.</span></p>
                            <p class="flex items-start gap-2"><i class="fas fa-money-bill-wave text-purple-500 mt-0.5"></i> <span><strong>Teti-bola (100m²):</strong> Raha mampiasa dobo 100m² ianao, dia afaka mamokatra trondro 150kg hatramin'ny 200kg isaky ny 6 volana.</span></p>
                            <p class="flex items-start gap-2"><i class="fas fa-key text-purple-500 mt-0.5"></i> <span><strong>Tsiambaratelo:</strong> Ny fahadiovan'ny rano sy ny sakafo ara-potoana no antoky ny fahombiazana.</span></p>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section id="simulator" class="pt-16">
            <div class="bg-slate-900 rounded-3xl shadow-2xl overflow-hidden relative border-t-8 border-teal-500">
                <div class="absolute inset-0 opacity-10 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')]"></div>
                
                <div class="relative z-10 p-8 md:p-12 text-center text-white">
                    <span class="inline-block py-1 px-3 rounded-full bg-teal-500/20 text-teal-300 text-xs font-bold mb-4 border border-teal-500/30">Fitaovana Kajy</span>
                    <h2 class="text-3xl md:text-4xl font-bold mb-4">Simulator &amp; Fampitahana</h2>
                    <p class="text-slate-400 mb-10 max-w-2xl mx-auto font-light">
                        Manao kajy ary mampitaha ny tombony sy fandaniana (Gris vs Mena).
                    </p>

                    <form id="tilapiaForm" class="max-w-6xl mx-auto space-y-8 bg-white/5 p-6 md:p-8 rounded-2xl backdrop-blur-sm border border-white/10">
                        
                        <div class="text-left">
                            <label class="block text-sm font-bold text-amber-400 mb-4 uppercase tracking-wider">1. Safidio ny Karazana</label>
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                <label class="cursor-pointer group">
                                    <input type="radio" name="species" value="gris" class="species-radio hidden" checked>
                                    <div class="bg-white text-gray-700 border-2 border-transparent rounded-xl p-4 flex items-center gap-4 hover:bg-gray-50 transition relative">
                                        <div class="w-12 h-12 bg-slate-200 rounded-full flex items-center justify-center text-slate-600"><i class="fas fa-fish text-xl"></i></div>
                                        <div>
                                            <span class="font-bold block">Tilapia du Nil (Gris)</span>
                                            <span class="text-xs text-gray-500">Mahazatra, Matanjaka</span>
                                        </div>
                                        <i class="fas fa-check-circle text-amber-500 absolute top-4 right-4 opacity-0 check-icon transition"></i>
                                    </div>
                                </label>
                                <label class="cursor-pointer group">
                                    <input type="radio" name="species" value="mena" class="species-radio hidden">
                                    <div class="bg-white text-gray-700 border-2 border-transparent rounded-xl p-4 flex items-center gap-4 hover:bg-red-50 transition relative">
                                        <div class="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center text-red-500"><i class="fas fa-fish text-xl"></i></div>
                                        <div>
                                            <span class="font-bold block text-red-900">Tilapia Mena (Rouge)</span>
                                            <span class="text-xs text-gray-500">Vidiny ambony, Marefo kokoa</span>
                                        </div>
                                        <i class="fas fa-check-circle text-amber-500 absolute top-4 right-4 opacity-0 check-icon transition"></i>
                                    </div>
                                </label>
                            </div>
                        </div>

                        <div class="text-left border-t border-white/10 pt-6">
                            <label class="block text-sm font-bold text-teal-400 mb-4 uppercase tracking-wider">2. Safidio ny Rafitra (Max 2)</label>
                            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
                                <label class="cursor-pointer group">
                                    <input type="checkbox" name="system" value="dobo" class="checkbox-card-input hidden" onchange="limitSelection(this)">
                                    <div class="bg-white text-gray-700 border-2 border-transparent rounded-xl p-4 text-center hover:bg-teal-50 transition h-full flex flex-col justify-center relative">
                                        <i class="fas fa-water text-3xl text-teal-500 mb-2"></i>
                                        <span class="font-bold block">Dobo Tany</span>
                                        <span class="text-xs text-gray-500">Extensif</span>
                                    </div>
                                </label>
                                <label class="cursor-pointer group">
                                    <input type="checkbox" name="system" value="cage" class="checkbox-card-input hidden" onchange="limitSelection(this)">
                                    <div class="bg-white text-gray-700 border-2 border-transparent rounded-xl p-4 text-center hover:bg-blue-50 transition h-full flex flex-col justify-center relative">
                                        <i class="fas fa-th-large text-3xl text-blue-500 mb-2"></i>
                                        <span class="font-bold block">Cage</span>
                                        <span class="text-xs text-gray-500">Semi-Intensif</span>
                                    </div>
                                </label>
                                <label class="cursor-pointer group">
                                    <input type="checkbox" name="system" value="beton" class="checkbox-card-input hidden" onchange="limitSelection(this)">
                                    <div class="bg-white text-gray-700 border-2 border-transparent rounded-xl p-4 text-center hover:bg-gray-100 transition h-full flex flex-col justify-center relative">
                                        <i class="fas fa-cube text-3xl text-gray-500 mb-2"></i>
                                        <span class="font-bold block">Beton</span>
                                        <span class="text-xs text-gray-500">Semi-Intensif</span>
                                    </div>
                                </label>
                                <label class="cursor-pointer group">
                                    <input type="checkbox" name="system" value="horssol" class="checkbox-card-input hidden" onchange="limitSelection(this)">
                                    <div class="bg-white text-gray-700 border-2 border-transparent rounded-xl p-4 text-center hover:bg-orange-50 transition h-full flex flex-col justify-center relative">
                                        <i class="fas fa-box-open text-3xl text-orange-500 mb-2"></i>
                                        <span class="font-bold block">Hors-sol</span>
                                        <span class="text-xs text-gray-500">Intensif</span>
                                    </div>
                                </label>
                                <label class="cursor-pointer group">
                                    <input type="checkbox" name="system" value="ras" class="checkbox-card-input hidden" onchange="limitSelection(this)">
                                    <div class="bg-white text-gray-700 border-2 border-transparent rounded-xl p-4 text-center hover:bg-purple-50 transition h-full flex flex-col justify-center relative">
                                        <i class="fas fa-microchip text-3xl text-purple-500 mb-2"></i>
                                        <span class="font-bold block">RAS</span>
                                        <span class="text-xs text-gray-500">Intensif</span>
                                    </div>
                                </label>
                            </div>
                        </div>

                        <div class="text-left border-t border-white/10 pt-6">
                            <label class="block text-sm font-bold text-teal-400 mb-4 uppercase tracking-wider">3. Velarana (m²)</label>
                            <div class="relative">
                                <input type="number" id="surface" placeholder="100" class="w-full bg-slate-800 border border-slate-700 text-white rounded-xl p-4 focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none text-xl font-mono" required min="1">
                                <span class="absolute right-6 top-1/2 transform -translate-y-1/2 text-slate-500 font-bold">m²</span>
                            </div>
                        </div>

                        <button type="button" onclick="generateResponse()" class="w-full bg-gradient-to-r from-teal-500 to-cyan-600 hover:from-teal-600 hover:to-cyan-700 text-white font-bold py-5 rounded-xl text-lg shadow-lg hover:shadow-cyan-500/50 transition transform hover:-translate-y-1 flex items-center justify-center gap-3">
                            <span>Manao Kajy &amp; Mampitaha</span>
                            <i class="fas fa-arrow-right"></i>
                        </button>
                    </form>

                    <div id="resultBox" class="hidden mt-10 max-w-5xl mx-auto bg-white rounded-2xl text-slate-800 p-8 text-left animate-slide-up shadow-2xl border-t-4 border-teal-500">
                    </div>

                </div>
            </div>
        </section>

    </main>

    <footer class="bg-slate-900 text-slate-400 py-12 text-center relative z-10">
        <div class="max-w-4xl mx-auto px-4">
            
            
            
        </div>
    </footer>

    <script>
        const systemsData = {
            dobo: {
                title: "Dobo Tany (Extensif)",
                description: "Mety tsara ho an'ny tantsaha manana tany be fotaka. Miantehitra betsaka amin'ny sakafo natoraly ao an-dobo.",
                densityMin: 1, densityMax: 3, densityText: "1-3 isa / m²",
                productionFactor: 0.350,
                timeFrame: "6-8 volana",
                cost: "Ambany (zezika + kely sakafo)",
                materials: "Angady, tany mety",
                advice: ["Dobo tany: 1m hatramin'ny 1.5m ny halaliny.", "Tombony: Tsy mila fandaniana be amin'ny sakafo sy fitaovana.", "Ny sakafo natoraly (plancton) no tena ianteherana."]
            },
            cage: {
                title: "Cage an-dranomamy (Semi-Intensif)",
                description: "Apetraka amin'ny rano mandeha na farihy. Mila sakafo feno (pellets) satria tsy afaka mihinana ny ao an-drano ny trondro.",
                densityMin: 30, densityMax: 50, densityText: "30-50 isa / m³",
                productionFactor: 0.400,
                timeFrame: "5-6 volana",
                cost: "Antony (harato + sakafo hovidiana)",
                materials: "Harato, kofehy, barika",
                advice: ["Mila rano mikoriana tsara hisorohana ny loto.", "Tandremo ny halatra sy ny harato sao rovitra.", "Tsy maintsy omena sakafo feno (provender) tsy tapaka."]
            },
            beton: {
                title: "Tanky Beton (Semi-Intensif)",
                description: "Tsara ho an'ny tokotany kely. Mila fanoloana rano matetika sy sakafo voalanjalanja.",
                densityMin: 5, densityMax: 15, densityText: "5-15 isa / m²",
                productionFactor: 0.400,
                timeFrame: "6 volana",
                cost: "Antony (Siment + Sakafo)",
                materials: "Biriky, Siment, Fantsona",
                advice: ["Fitantanana: Mila ovaina matetika ny rano mba hitazonana ny fahadiovana.", "Fifehezana: Mora kokoa ny manara-maso ny fahasalaman'ny trondro."]
            },
            horssol: {
                title: "Piscine Hors-sol (Intensif)",
                description: "Dobo vita amin'ny bâche, mora afindrafindra. Mila paompy sy rivotra (aération) ary sakafo avo lenta.",
                densityMin: 30, densityMax: 60, densityText: "30-60 isa / m³",
                productionFactor: 0.420,
                timeFrame: "5-6 volana",
                cost: "Ambony (Herinaratra + Sakafo)",
                materials: "Bâche, Vy, Pompe à air",
                advice: ["Mora apetraka sy afindrafindra.", "Mila 'siphonage' matetika hialana amin'ny loto."]
            },
            ras: {
                title: "Intensif (RAS/Tanks)",
                description: "Teknolojia avo lenta mampiasa filtration. Vokatra ambony indrindra amin'ny toerana kely.",
                densityMin: 50, densityMax: 100, densityText: "50-100+ isa / m³",
                productionFactor: 0.450,
                timeFrame: "4-5 volana",
                cost: "Avo be (Herinaratra + Fitaovana)",
                materials: "Paompy, Sivana (Biofilter), Tanky",
                advice: ["Mila herinaratra 24/24 (mila groupe secours).", "Fitomboana haingana dia haingana sy vokatra goavana."]
            }
        };

        function limitSelection(checkbox) {
            const checkboxes = document.querySelectorAll('input[name="system"]:checked');
            if (checkboxes.length > 2) {
                checkbox.checked = false;
                alert("Azafady, rafitra roa (2) ihany no azo ampitahaina.");
            }
        }

        function calculateData(systemKey, surface, species) {
            const data = JSON.parse(JSON.stringify(systemsData[systemKey]));
            let minFish = Math.round(surface * data.densityMin);
            let maxFish = Math.round(surface * data.densityMax);
            
            if (species === 'mena') {
                data.title += " (Mena)";
                if (systemKey === 'dobo') {
                    data.advice.push("<strong class='text-red-500'>Tandremo:</strong> Asio harato ny dobo fa mora hitan'ny vorona ny Tilapia Mena.");
                }
                data.advice.push("Vidiny ambony kokoa eo amin'ny tsena.");
            }

            const avgFish = (minFish + maxFish) / 2;
            const survivalRate = 0.90; 
            const productionKg = Math.round(avgFish * survivalRate * data.productionFactor);
            
            return { ...data, minFish, maxFish, productionKg };
        }

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

            const speciesTitle = speciesValue === 'mena' ? '<span class="text-red-600">Tilapia Mena</span>' : '<span class="text-slate-600">Tilapia Gris</span>';

            if (results.length === 1) {
                const r = results[0];
                htmlContent = '<div class="flex items-center gap-4 mb-6 pb-6 border-b border-teal-100"><div class="w-12 h-12 rounded-full bg-teal-100 flex items-center justify-center text-teal-600"><i class="fas fa-clipboard-check text-xl"></i></div><div><h3 class="text-2xl font-bold text-gray-900">' + r.title + '</h3><p class="text-sm text-gray-500">Antsipiriany ho an\\'ny ' + speciesTitle + ' amin\\'ny ' + surface + ' m²</p></div></div><div class="grid md:grid-cols-2 gap-6 mb-8"><div class="bg-blue-50 rounded-xl p-5 border border-blue-100 text-center"><span class="text-xs text-blue-500 uppercase font-bold tracking-wider mb-2 block">Isan\\'ny Trondro</span><span class="block text-4xl font-bold text-blue-900">' + r.minFish.toLocaleString() + ' - ' + r.maxFish.toLocaleString() + '</span><span class="text-xs font-semibold text-blue-600 mt-1 block">(' + r.densityText + ')</span></div><div class="bg-green-50 rounded-xl p-5 border border-green-100 text-center"><span class="text-xs text-green-500 uppercase font-bold tracking-wider mb-2 block">Vokatra Tombana</span><span class="block text-4xl font-bold text-green-700">~ ' + r.productionKg.toLocaleString() + ' Kg</span><span class="text-xs font-semibold text-green-600 mt-1 block">Tsingerina: ' + r.timeFrame + '</span></div></div><div class="bg-gray-50 rounded-xl p-6 border border-gray-100 mb-6"><h4 class="font-bold text-gray-800 mb-4 text-sm uppercase flex items-center gap-2"><i class="fas fa-info-circle text-teal-500"></i> Antsipiriany &amp; Torohevitra</h4><div class="space-y-3 text-sm"><p class="text-gray-700 italic bg-white p-3 rounded border border-gray-200">' + r.description + '</p><div class="grid md:grid-cols-2 gap-4 mt-4 mb-4"><div class="bg-white p-3 rounded border border-gray-200"><span class="block text-xs font-bold text-gray-400 uppercase mb-1">Fandaniana</span><span class="font-semibold text-gray-800">' + r.cost + '</span></div><div class="bg-white p-3 rounded border border-gray-200"><span class="block text-xs font-bold text-gray-400 uppercase mb-1">Fitaovana</span><span class="font-semibold text-gray-800">' + r.materials + '</span></div></div><ul class="space-y-2">' + r.advice.map(function(adv) { return '<li class="flex items-start gap-2"><i class="fas fa-check text-green-500 mt-1"></i> <span>' + adv + '</span></li>'; }).join('') + '</ul></div></div>';
            } 
            else if (results.length === 2) {
                const r1 = results[0];
                const r2 = results[1];
                htmlContent = '<div class="flex items-center gap-4 mb-6 pb-6 border-b border-teal-100"><div class="w-12 h-12 rounded-full bg-purple-100 flex items-center justify-center text-purple-600"><i class="fas fa-balance-scale text-xl"></i></div><div><h3 class="text-2xl font-bold text-gray-900">Fampitahana Rafitra</h3><p class="text-sm text-gray-500">Ho an\\'ny ' + speciesTitle + ' amin\\'ny ' + surface + ' m²</p></div></div><div class="grid grid-cols-2 gap-4 md:gap-8"><div class="space-y-4"><div class="p-4 bg-teal-600 text-white rounded-xl text-center shadow-md"><h4 class="font-bold text-lg">' + r1.title + '</h4></div><div class="bg-blue-50 p-4 rounded-xl border border-blue-100 text-center"><span class="text-xs text-blue-500 uppercase font-bold tracking-wider block mb-1">Isan\\'ny Trondro</span><span class="block text-xl md:text-2xl font-bold text-blue-900">' + r1.minFish.toLocaleString() + ' - ' + r1.maxFish.toLocaleString() + '</span><span class="text-xs text-blue-600 block">' + r1.densityText + '</span></div><div class="bg-green-50 p-4 rounded-xl border border-green-100 text-center"><span class="text-xs text-green-500 uppercase font-bold tracking-wider block mb-1">Vokatra (Kg)</span><span class="block text-xl md:text-2xl font-bold text-green-700">~ ' + r1.productionKg.toLocaleString() + '</span><span class="text-xs text-green-600 block">' + r1.timeFrame + '</span></div><div class="bg-white p-3 rounded-xl border border-gray-200 text-xs md:text-sm shadow-sm"><p class="mb-2"><strong class="block text-gray-400 uppercase text-[10px]">Fandaniana:</strong> <span class="text-gray-700">' + r1.cost + '</span></p><p class="mb-2"><strong class="block text-gray-400 uppercase text-[10px]">Fitaovana:</strong> <span class="text-gray-700">' + r1.materials + '</span></p><div class="mt-3 pt-2 border-t border-gray-100">' + r1.advice.map(function(adv) { return '<p class="text-[10px] text-gray-500 mb-1 flex items-start gap-1"><i class="fas fa-caret-right text-teal-500"></i> ' + adv + '</p>'; }).join('') + '</div></div></div><div class="space-y-4"><div class="p-4 bg-cyan-600 text-white rounded-xl text-center shadow-md"><h4 class="font-bold text-lg">' + r2.title + '</h4></div><div class="bg-blue-50 p-4 rounded-xl border border-blue-100 text-center"><span class="text-xs text-blue-500 uppercase font-bold tracking-wider block mb-1">Isan\\'ny Trondro</span><span class="block text-xl md:text-2xl font-bold text-blue-900">' + r2.minFish.toLocaleString() + ' - ' + r2.maxFish.toLocaleString() + '</span><span class="text-xs text-blue-600 block">' + r2.densityText + '</span></div><div class="bg-green-50 p-4 rounded-xl border border-green-100 text-center"><span class="text-xs text-green-500 uppercase font-bold tracking-wider block mb-1">Vokatra (Kg)</span><span class="block text-xl md:text-2xl font-bold text-green-700">~ ' + r2.productionKg.toLocaleString() + '</span><span class="text-xs text-green-600 block">' + r2.timeFrame + '</span></div><div class="bg-white p-3 rounded-xl border border-gray-200 text-xs md:text-sm shadow-sm"><p class="mb-2"><strong class="block text-gray-400 uppercase text-[10px]">Fandaniana:</strong> <span class="text-gray-700">' + r2.cost + '</span></p><p class="mb-2"><strong class="block text-gray-400 uppercase text-[10px]">Fitaovana:</strong> <span class="text-gray-700">' + r2.materials + '</span></p><div class="mt-3 pt-2 border-t border-gray-100">' + r2.advice.map(function(adv) { return '<p class="text-[10px] text-gray-500 mb-1 flex items-start gap-1"><i class="fas fa-caret-right text-cyan-500"></i> ' + adv + '</p>'; }).join('') + '</div></div></div></div>';
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
