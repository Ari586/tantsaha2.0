# 🔐 INFORMATIONS CRITIQUES KEYSTORE TANTSAHA
**Date de récupération:** 23 décembre 2025  
**Date de création originale:** 20 décembre 2025, 15h12

---

## ⚠️ IMPORTANT - À SAUVEGARDER IMMÉDIATEMENT

### Emplacement du Keystore
```
/Users/arielhavana/akoho_tech/android/app/upload-keystore.jks
```

### Informations d'authentification
- **Alias:** `upload`
- **Mot de passe du keystore:** `0TsmTiTaeN1999!?`
- **Mot de passe de la clé:** `0TsmTiTaeN1999!?`

### Distinguished Name (DN)
```
CN=Andriampihavanana, OU=Org, O=Org, L=Hamburg, ST=Hamburg, C=DE
```

### Empreintes cryptographiques
**SHA1:**
```
9E:BE:AA:CA:B0:1E:9F:2A:91:3A:70:69:26:4D:3A:7A:7A:C0:BD:1D
```

**SHA256:**
```
25:41:30:21:B2:27:38:43:6E:AA:74:0C:82:3D:56:BB:0E:28:50:35:9B:B7:9E:A8:6A:AB:98:BA:DB:7A:6D:79
```

---

## 📋 Informations de récupération

### Récupéré depuis Git
- **Commit:** `d3785bb1f6df0a2d97195b87503ad77a597ac325`
- **Branche:** gh-pages
- **Date du commit:** 21 décembre 2025, 17h39

### Commande de récupération
```bash
git show d3785bb1f6df0a2d97195b87503ad77a597ac325:android/upload-keystore.jks > upload-keystore.jks
```

---

## 🔒 Actions de sécurité URGENTES

### 1. Sauvegarder le fichier keystore (MAINTENANT)
```bash
# Copier vers iCloud Drive
cp /Users/arielhavana/akoho_tech/android/app/upload-keystore.jks ~/Library/Mobile\ Documents/com~apple~CloudDocs/BACKUP_TANTSAHA/

# Ou vers un dossier Google Drive
cp /Users/arielhavana/akoho_tech/android/app/upload-keystore.jks ~/Google\ Drive/BACKUP_TANTSAHA/

# Ou vers un disque externe
cp /Users/arielhavana/akoho_tech/android/app/upload-keystore.jks /Volumes/YOUR_EXTERNAL_DRIVE/BACKUP_TANTSAHA/
```

### 2. Sauvegarder le certificat PEM
```bash
cp /Users/arielhavana/akoho_tech/android/upload_certificate.pem ~/Library/Mobile\ Documents/com~apple~CloudDocs/BACKUP_TANTSAHA/
```

### 3. Sauvegarder ce fichier d'information
```bash
cp /Users/arielhavana/akoho_tech/KEYSTORE_BACKUP_INFO.md ~/Library/Mobile\ Documents/com~apple~CloudDocs/BACKUP_TANTSAHA/
```

---

## ✅ Vérification du keystore

### Vérifier l'empreinte SHA1
```bash
keytool -list -v -keystore android/app/upload-keystore.jks -storepass '0TsmTiTaeN1999!?' | grep SHA1
```

**Résultat attendu:**
```
SHA1: 9E:BE:AA:CA:B0:1E:9F:2A:91:3A:70:69:26:4D:3A:7A:7A:C0:BD:1D
```

### Vérifier le certificat dans l'AAB
```bash
unzip -p build/app/outputs/bundle/release/app-release.aab META-INF/UPLOAD.RSA | keytool -printcert | grep SHA1
```

---

## 📦 Build Android

### Construire l'AAB pour Google Play
```bash
flutter build appbundle --release
```

**Fichier généré:**
```
build/app/outputs/bundle/release/app-release.aab
```

### Configuration dans key.properties
```
storePassword=0TsmTiTaeN1999!?
keyPassword=0TsmTiTaeN1999!?
keyAlias=upload
storeFile=/Users/arielhavana/akoho_tech/android/app/upload-keystore.jks
```

---

## 🚨 RÈGLES DE SÉCURITÉ

1. ❌ **NE JAMAIS** commiter le fichier `.jks` dans Git
2. ✅ **TOUJOURS** sauvegarder le keystore dans 3 endroits minimum:
   - Cloud (iCloud/Google Drive/Dropbox)
   - Disque externe
   - Gestionnaire de mots de passe (1Password/Bitwarden)
3. ✅ **TOUJOURS** sauvegarder le certificat PEM
4. ✅ **TOUJOURS** noter les mots de passe dans un gestionnaire sécurisé
5. ⚠️ Si le keystore est perdu, il faut demander une réinitialisation à Google Play (délai 24-48h)

---

## 📞 Contacts Google Play

**En cas de perte du keystore:**
1. Google Play Console → App → Configuration → Intégrité de l'application
2. "Demander la réinitialisation de la clé d'upload"
3. Fournir le certificat PEM original comme preuve

---

## 🗓️ Historique

- **20 déc 2025, 15h12** - Création du keystore avec GPT 5.1 Codex
- **21 déc 2025, 13h41** - Ajout dans Git puis suppression
- **21 déc 2025, 17h39** - Keystore présent dans commit `d3785bb1`
- **23 déc 2025** - Récupération réussie depuis l'historique Git

---

**⚠️ CE FICHIER CONTIENT DES INFORMATIONS SENSIBLES**  
**À CONSERVER EN LIEU SÛR - NE PAS PARTAGER PUBLIQUEMENT**
