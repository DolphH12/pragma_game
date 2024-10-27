'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "be19065e60f5ae5a26c4926443673ec0",
"version.json": "3c7bdd501944f56c7d735e0f634b6498",
"index.html": "9684084ad0ad8c5a41aabd053cb3c0c5",
"/": "9684084ad0ad8c5a41aabd053cb3c0c5",
"main.dart.js": "439811522333fbcae3a4efddbe8624d0",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "763e9994e3927742963c90e585266757",
"assets/AssetManifest.json": "7773e90da8af96e1a71fa1ad37c12e92",
"assets/NOTICES": "9e4b42c822865eb5829ff98aeb05e19c",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "7e54efb5f7efbb7e0ec03dbb59eb6bfe",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "aabd44d95484086ac57801b1cc741ef1",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/elementos/Ready-to-move_Carro-2.png": "304e9e313cbabef797332befd613a5d1",
"assets/assets/images/elementos/Ready-to-move_Carro-3.png": "f252f165cafc6e048b3e5165c199fa68",
"assets/assets/images/elementos/Ready-to-move_Carro-1.png": "292bc3ee0f315a93c29b79847949e609",
"assets/assets/images/elementos/Ready-to-move_Temporizador.png": "c3b4eabfc44aff97706f77e61d592d97",
"assets/assets/images/elementos/Ready-to-move_Senal-3.png": "12e83bf9f6ce4ab442612db3e17c5aa0",
"assets/assets/images/elementos/Ready-to-move-nombre.png": "9ac387d3c836f6c693a42da3694e79df",
"assets/assets/images/elementos/Ready-to-move_Autobus.png": "95afb530ac9b386cb77c58ae0eb83680",
"assets/assets/images/elementos/Ready-to-move_Senal-2.png": "5e0dd4d942aa969c41261f4b5bcd209d",
"assets/assets/images/elementos/escenario.png": "5c6df4fc3da3fa5d598f0a33dd490884",
"assets/assets/images/elementos/Ready-to-move_Senal-1.png": "e172295eb6c331aba70da6c1f7e23a80",
"assets/assets/images/elementos/Ready-to-move_Tractor-2.png": "274ab363f65f8a777dddac8a2660f6c5",
"assets/assets/images/elementos/Ready-to-move_Tractor.png": "a76c79c019d93ca81660bf71421692be",
"assets/assets/images/elementos/Ready-to-move_Senal-4.png": "178dc277c9fe0e1edb0ce702017486ed",
"assets/assets/images/elementos/Ready-to-move_Vida.png": "ac00022e0469c6119c56f27c210b44f3",
"assets/assets/images/menu/Ready-to-move_Nombre.png": "a2f267228dec106b8e493b8ba1c4cb2b",
"assets/assets/images/menu/Ready-to-move_intentar.png": "a2c2a50be9e94a5bb14f27697368a050",
"assets/assets/images/menu/Ready-to-move_Ganador.png": "0efc592c9cceef6a49e24380117ad463",
"assets/assets/images/personaje/Personaje-F8.png": "9905605c4a0e04c9d82b9cd7fba14ef4",
"assets/assets/images/personaje/Personaje-F9.png": "64324ccf95fdb89d0c004b4b787bddd0",
"assets/assets/images/personaje/Personaje-F7.png": "9836574e3d62cfd12bfbd40af3be09ef",
"assets/assets/images/personaje/Personaje-F6.png": "efd89184d9a51a46a636c01ba7234966",
"assets/assets/images/personaje/Personaje-F4.png": "245fb5a28472cffcedd61a5410618081",
"assets/assets/images/personaje/Personaje-F5.png": "4c57e7213b233c9f092f8e162d89f0ff",
"assets/assets/images/personaje/Personaje-F1.png": "e43ac4107599aaa3ca721ff9d6bc7a48",
"assets/assets/images/personaje/Personaje-F0.png": "8b827d17a1f2215f27e3151958997a21",
"assets/assets/images/personaje/Personaje-F2.png": "4d86e74ad11fcda4d2b12363b9d80c83",
"assets/assets/images/personaje/Personaje-F3.png": "9e147badea5bc78712c1340225675770",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
