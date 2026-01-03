# 🚀 Google Play Release - Checklist de Publication

## ✅ Build AAB Complété

**Fichier créé** : `build/app/outputs/bundle/release/app-release.aab`  
**Taille** : 206 MB  
**Date** : 3 janvier 2026  
**Version** : Vérifiez dans `pubspec.yaml`

---

## 📋 Étapes pour Publier sur Google Play Console

### 1. Accéder à Google Play Console
- Allez sur [Google Play Console](https://play.google.com/console/)
- Sélectionnez votre application **Tantsaha** (ou créez-la si première publication)

### 2. Créer une Nouvelle Version
1. Dans le menu de gauche : **Production** > **Créer une nouvelle version**
2. Si c'est la première fois : Suivez l'assistant de configuration

### 3. Télécharger l'AAB
1. Cliquez sur **Télécharger** ou glissez-déposez le fichier :
   ```
   build/app/outputs/bundle/release/app-release.aab
   ```
2. Google Play va analyser le fichier (cela prend quelques minutes)

### 4. Remplir les Informations de Version
- **Nom de la version** : Décrivez les nouveautés (ex: "Ajout de sécurité Supabase")
- **Notes de version** : 
  ```
  - Système de codes d'activation sécurisé
  - Intégration Supabase pour gestion cloud
  - Améliorations de performance
  - Corrections de bugs
  ```

### 5. Vérifications Importantes

#### A. Certificat de Signature
Votre keystore est configuré :
- **Fichier** : `android/app/upload-keystore.jks`
- **Alias** : `upload`
- **SHA-1 attendu** : `9E:BE:AA:CA:B0:1E:9F:2A:91:3A:70:69:26:4D:3A:7A:7A:C0:BD:1D`

Si Google demande le certificat PEM :
- Fichier : `android/new-upload-certificate.pem`

#### B. Permissions Vérifiées
L'application demande :
- ✅ Internet (pour Supabase)
- ✅ Stockage local (SharedPreferences)

#### C. Version Code/Name
Assurez-vous que les numéros de version dans `pubspec.yaml` sont **supérieurs** à la version précédente sur le Store.

---

## ⚠️ Points de Vigilance

### Clés Sensibles dans le Code
Avant de publier, vérifiez que vous n'avez **PAS** mis :
- ❌ La clé `service_role` de Supabase (elle doit rester secrète)
- ✅ Seulement la clé `anon` publique (c'est OK, elle est protégée par RLS)

### Taille de l'Application
- **AAB actuel** : 206 MB (assez gros, mais acceptable)
- Google Play va créer des APKs optimisés par appareil (plus petits)

### Politique de Confidentialité
Si vous n'avez pas encore de politique de confidentialité :
1. Google Play va vous demander une URL
2. Créez une page simple expliquant :
   - Quelles données vous collectez (codes d'activation, données locales)
   - Comment elles sont utilisées
   - Que vous utilisez Supabase pour le stockage

---

## 🎯 Test Final Avant Publication

Avant de soumettre, testez l'AAB localement :

```bash
# Installer l'AAB sur un appareil de test
bundletool build-apks --bundle=build/app/outputs/bundle/release/app-release.aab --output=/tmp/app.apks --mode=universal

# Décompresser et installer
unzip /tmp/app.apks -d /tmp/apks
adb install /tmp/apks/universal.apk
```

Ou utilisez la **"Piste interne"** de Google Play pour tester avant la production.

---

## 📱 Après la Soumission

1. **Révision Google** : Prend généralement 1-3 jours
2. **Notifications** : Vous recevrez un email quand :
   - La révision est terminée
   - L'app est publiée
   - Il y a des problèmes à corriger

3. **Mise à Jour** : Si vous devez republier :
   ```bash
   # Augmentez la version dans pubspec.yaml (ex: 1.0.0+1 → 1.0.1+2)
   flutter build appbundle --release
   ```

---

## 🔐 Sécurité Supabase Activée

✅ Votre application utilise maintenant :
- Codes d'activation uniques mondialement
- Vérification en ligne via Supabase
- Un code = Un appareil (impossible de réutiliser)
- Code admin personnel : `ARIELHAVANA2024`

---

## 📞 Support

Si Google rejette l'application, les raisons courantes sont :
1. **Politique de confidentialité manquante** → Ajoutez une URL
2. **Permissions non justifiées** → Toutes nos permissions sont légitimes
3. **Contenu interdit** → Application agricole, pas de problème
4. **Taille excessive** → 206 MB peut être optimisé si nécessaire

Bonne publication ! 🚀
