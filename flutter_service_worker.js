'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "a8623d5b44d7db7d93fa513e7a4d2a83",
"icons/Icon-192.png": "5cd5490273f74890c8771c44c4094a9c",
"manifest.json": "92865f7ccd0459352ef22c5b28ac4600",
"index.html": "99961c1c6ba6f81aa569f20441a563d8",
"/": "99961c1c6ba6f81aa569f20441a563d8",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "78c4dd5ca583f69511522775569369f3",
"assets/assets/voly/navet.jpg": "f8a71ec55b66c0088781416e3d06abc3",
"assets/assets/voly/consoude.jpg": "89b6acc141b378b468f29d4b881e9c7f",
"assets/assets/voly/poivron_doux.jpg": "fa2288dec100fcd1596739c1965b3414",
"assets/assets/voly/petsay.jpg": "bb5b2e45a0137299659f0e4fc0682074",
"assets/assets/voly/papaye.jpg": "16aea3dd57d9a96a78dcad311310139e",
"assets/assets/voly/petit_pois.jpg": "1ea66f5da0bf5ea478bf511bcc1e240d",
"assets/assets/voly/chou_chinois.jpg": "9c8f8f5c65907fc788874220bedd6708",
"assets/assets/voly/salady.jpg": "0e2100c9825fe06893c071301fcb9f74",
"assets/assets/voly/oviala.jpg": "fbbc626db915599404b2c55190ab84ed",
"assets/assets/voly/brocoli.jpg": "70f3fb75ac6d066a299a1b7b214d416a",
"assets/assets/voly/betterave_rouge.jpg": "4541e7a64e196d10b38a2ec596395c8c",
"assets/assets/voly/avoine.jpg": "540d9f94751077ee6175b7bf704b82f4",
"assets/assets/voly/pois_chiche.jpg": "414aed2ba0c507687515d0ebc648ea11",
"assets/assets/voly/concombre.jpg": "af04e8dad05bf3c80ac01e99601000e9",
"assets/assets/voly/katsaka.jpg": "f2f3de1c8e5f26643cea049d2a14d686",
"assets/assets/voly/epinard.jpg": "8be2033304fe69f98333cab81f6f27b3",
"assets/assets/voly/luzerne.jpg": "482971112dc28c86f42905010db6c565",
"assets/assets/voly/INSTALLATION_COMPLETE.md": "d94f8259cc7015fc97b3f3bf4ad71dec",
"assets/assets/voly/haricots.jpg": "bdc5f07c2b436f47e8fed4df73b1b035",
"assets/assets/voly/sakamalao.jpg": "b8b82ee5e31789a2239af1a31944848a",
"assets/assets/voly/README_IMAGES.md": "a3f45ae3dd4219eb61bbe446110e93cb",
"assets/assets/voly/haricots_grains.jpg": "2673288f3f4279085a668427c0018a5b",
"assets/assets/voly/vary_fohy.jpg": "255e2ffd130b3ec72a0a5e7852dd9604",
"assets/assets/voly/sakay.jpg": "3c73c947b14cd6b80b033599fce7d3c7",
"assets/assets/voly/bredes_mafana.jpg": "103f5f1939aa0d0ef2a2137890675770",
"assets/assets/voly/vomanga.jpg": "4be208c2e579660d97c95d9eccab8abf",
"assets/assets/voly/ovy.jpg": "b4b01ec3be2e2eb16e71f889c36ca1b1",
"assets/assets/voly/amarante_queue_de_renard.jpg": "aaa6a2d765319019363040d989eae8f8",
"assets/assets/voly/melon.jpg": "adc88d718bc7501026b08893748702ea",
"assets/assets/voly/angivy.jpg": "a0818946a10d18b3d2ecca3a03aa4afa",
"assets/assets/voly/ray_grass.jpg": "05e05110b845e085c30ce9ac255fb80a",
"assets/assets/voly/voatabia_boribory.jpg": "d4f219062e97b9e38f3f528faed3dccf",
"assets/assets/voly/sakay_pilokely.jpg": "6a81713b6465bc7ef84b3892147cff44",
"assets/assets/voly/pasteque.jpg": "13ee33e9434cb0d9afc96db41d65fc68",
"assets/assets/voly/kabaro.jpg": "94cccef4128d437750781fc4e8d5cacc",
"assets/assets/voly/anana.jpg": "aa78715c3602e214c7f9c0ac477df0cf",
"assets/assets/voly/voatabia_lava.jpg": "3b1288cf69b6b7856259005a902a5aa4",
"assets/assets/voly/lentille.jpg": "0cffd2172e9d0b6fa80ead608f924c9c",
"assets/assets/voly/voanjobory.jpg": "f9d0e190bee8ed98cf9ff01bfd153dd5",
"assets/assets/voly/orge.jpg": "afb8b26772fd454a391ad831c60c6230",
"assets/assets/voly/betterave.jpg": "4541e7a64e196d10b38a2ec596395c8c",
"assets/assets/voly/anamamy.jpg": "4d07a3c1130bbcefe9c94a9ca196f00a",
"assets/assets/voly/celeri.jpg": "4c7b422be51a1fcb73adcdf6e352861c",
"assets/assets/voly/anamalaho.jpg": "103f5f1939aa0d0ef2a2137890675770",
"assets/assets/voly/anatsonga.jpg": "a37b2f35b8e59bb23e3ecbd3b28c5f6b",
"assets/assets/voly/baranjely.jpg": "460dea473235a81d2dd3d02d87bcdece",
"assets/assets/voly/VERIFICATION_IMAGES.md": "ba3dca4e9a4f9dd3d1eee998fbe68a37",
"assets/assets/voly/chou_fleur.jpg": "8a75930cbad7bc17d6d21bc8be1a1afe",
"assets/assets/voly/menthe.jpg": "7c4addd43fe1f201ca8790bb678b0887",
"assets/assets/voly/vary_anaty_rano.jpg": "0e3bad892b8eb1b3aaa33390da75e348",
"assets/assets/voly/choux_fleur.jpg": "8a75930cbad7bc17d6d21bc8be1a1afe",
"assets/assets/voly/persil.jpg": "44ec7b0de72bbd70c16d32d046c86258",
"assets/assets/voly/bl%25C3%25A9.jpg": "800e474b848a713b5020ea24f8a0a2cb",
"assets/assets/voly/karoty.jpg": "aef8ca514b5fcdfc3a10b02c8bf361ef",
"assets/assets/voly/radis.jpg": "eabbe3eb1d879ab73fffcdeb7c3eaf46",
"assets/assets/voly/saonjo.jpg": "77d687cd39283a89a90c5c632ee86f0a",
"assets/assets/voly/karaoty.jpg": "aef8ca514b5fcdfc3a10b02c8bf361ef",
"assets/assets/voly/anambongo.jpg": "e818eb04e9006e3ed64a1ca013e40cf8",
"assets/assets/voly/courgette.jpg": "45b84e2ae67c94ae751510b82a330440",
"assets/assets/voly/mangahazo.jpg": "1a25cf7c1c4002cb99228771243713ae",
"assets/assets/icon.png": "9013ee7054f40611cc19ba8254519da4",
"assets/assets/images/developer.txt": "5820c1829a4e1db7e43e62a1b3343ea5",
"assets/assets/images/arie.JPG": "bce0abe956e81f8aa0e1cc2d6ece2df3",
"assets/fonts/MaterialIcons-Regular.otf": "1f8bdb33ece3909a8ab1b56769d720b1",
"assets/NOTICES": "1ee22032aa7b2ef307e171ca35a13cdb",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin": "dcde06e5368355e2d28e93d1533fbe91",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "fcb33570005720feab19cf5adcdd1295",
"flutter_bootstrap.js": "0e8f4526f16bff203f03275e0544fd4f",
"version.json": "cd0a8d9f4b650c6f875ae8b880f99934",
"main.dart.js": "012a418280595d31b177db8f13b0cb74"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
