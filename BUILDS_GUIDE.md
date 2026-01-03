# 📦 Guide des Builds Tantsaha - Google Play

## ✅ Tous les Formats Générés (3 janvier 2026)

### 🎯 Pour Google Play Console (OBLIGATOIRE)

**Fichier unique à uploader :**
```
build/app/outputs/bundle/release/app-release.aab (116 MB)
```

✅ **C'est le SEUL fichier requis par Google Play**  
✅ Google génère automatiquement les APKs optimisés pour chaque appareil  
✅ Supporte toutes les architectures (ARM, ARM64, x86, x86_64)

---

## 📱 APKs Supplémentaires (Pour Tests Locaux)

### 1. APK Universel (Installation directe)
```
build/app/outputs/flutter-apk/app-release.apk (131 MB)
```
- Fonctionne sur TOUS les appareils Android
- Utile pour tester sur votre appareil avant publication
- Installation : `adb install app-release.apk`

### 2. APKs Par Architecture (Optimisés)
```
build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk (90 MB)  # 32-bit ARM
build/app/outputs/flutter-apk/app-arm64-v8a-release.apk   (92 MB)  # 64-bit ARM (la plupart des téléphones modernes)
build/app/outputs/flutter-apk/app-x86_64-release.apk      (94 MB)  # Émulateurs
```

---

## 🎯 Quelle Piste Utiliser sur Google Play ?

Google Play offre 4 pistes de publication. Vous utilisez **le même AAB** pour toutes :

### 1️⃣ **Internal Testing** (Tests Internes)
- Pour votre équipe (max 100 testeurs)
- Révision Google : ~30 min
- Idéal pour tester avant la vraie publication

### 2️⃣ **Closed Testing** (Alpha/Beta Fermé)
- Pour un groupe spécifique de testeurs
- Révision Google : 1-2 jours
- Via lien d'invitation ou liste d'emails

### 3️⃣ **Open Testing** (Beta Ouverte)
- Tout le monde peut s'inscrire
- Révision Google : 1-3 jours
- Visible sur le Store avec mention "Early Access"

### 4️⃣ **Production** (Sortie Publique)
- Publication officielle pour tous
- Révision Google : 1-3 jours
- Visible pour tous les utilisateurs

---

## 📋 Workflow Recommandé

### Étape 1 : Internal Testing
```bash
# Uploadez l'AAB en Internal Testing
# Testez pendant 1-2 jours
```

### Étape 2 : Closed/Open Testing (Optionnel)
```bash
# Même AAB, promouvoir vers Beta
# Collecter les feedbacks
```

### Étape 3 : Production
```bash
# Promouvoir l'AAB testé vers Production
# Pas besoin de re-uploader !
```

---

## 🔑 Important : Google Play N'a Besoin QUE de l'AAB

**Mythe** : "Je dois uploader 3 APKs différents"  
**Réalité** : Un seul AAB suffit ! Google fait le reste.

### Avantages de l'AAB :
- ✅ 1 seul fichier à gérer
- ✅ Google génère des APKs optimisés par appareil
- ✅ Les utilisateurs téléchargent seulement ce dont ils ont besoin
- ✅ Économise la bande passante (50-80% de réduction)

---

## 📤 Comment Uploader sur Google Play

### Via Google Play Console (Web)
1. Allez sur [play.google.com/console](https://play.google.com/console)
2. Sélectionnez **Tantsaha**
3. Menu gauche : **Testing** > **Internal testing** (ou Production)
4. Créer une nouvelle version
5. Uploadez **app-release.aab**
6. Remplissez les notes de version
7. **Examiner la version** > **Déployer**

### Via Ligne de Commande (Optionnel)
```bash
# Si vous utilisez fastlane (avancé)
fastlane supply --aab build/app/outputs/bundle/release/app-release.aab
```

---

## 🧪 Tester Localement Avant Publication

### Test 1 : APK Universel
```bash
# Sur votre téléphone Android
adb install build/app/outputs/flutter-apk/app-release.apk
```

### Test 2 : Via Internal Testing
1. Uploadez l'AAB sur Internal Testing
2. Ajoutez votre email comme testeur
3. Téléchargez depuis le Play Store

---

## ⚠️ Checklist Avant Publication

- [ ] Version code augmentée dans `pubspec.yaml`
- [ ] AAB testé localement (APK universel)
- [ ] Images optimisées (✅ Fait - 116 MB)
- [ ] Supabase configuré et fonctionnel
- [ ] Code admin testé : `ARIELHAVANA2024`
- [ ] Politique de confidentialité URL ajoutée
- [ ] Captures d'écran mises à jour
- [ ] Description de l'app rédigée

---

## 📊 Comparaison des Tailles

| Type | Taille | Utilisation |
|------|--------|-------------|
| **AAB** (Google Play) | 116 MB | Production ✅ |
| APK Universel | 131 MB | Tests locaux |
| APK ARM64 | 92 MB | Tests ciblés |
| APK ARM32 | 90 MB | Anciens appareils |
| APK x86_64 | 94 MB | Émulateurs |

---

## 🎉 Résumé Final

Pour publier sur Google Play, vous n'avez besoin QUE de :

```
✅ build/app/outputs/bundle/release/app-release.aab (116 MB)
```

**C'est tout !** Les autres fichiers (APKs) sont uniquement pour vos tests locaux.

---

## 🆘 En Cas de Problème

### "Google demande plusieurs APKs"
→ Non, depuis 2021, Google préfère l'AAB. Les APKs multiples sont obsolètes.

### "Mon AAB est rejeté"
→ Vérifiez :
1. Signature correcte (keystore)
2. Version code > version précédente
3. Politique de confidentialité

### "Je veux tester avant la prod"
→ Utilisez **Internal Testing** avec le même AAB

Bonne publication ! 🚀
