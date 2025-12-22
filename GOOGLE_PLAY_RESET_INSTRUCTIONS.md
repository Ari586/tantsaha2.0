# Instructions pour réinitialiser la clé d'upload sur Google Play Console

## Situation
- **Keystore original perdu** : upload-keystore.jks avec SHA1 `9E:BE:AA:CA:B0:1E:9F:2A:91:3A:70:69:26:4D:3A:7A:7A:C0:BD:1D`
- **Nouveau keystore créé** : `android/app/upload-keystore-new.jks` avec SHA1 `72:3F:B6:6C:C4:C6:78:4B:50:5D:B6:7A:70:1D:46:7A:47:5C:BF:04`
- **AAB prêt** : `build/app/outputs/bundle/release/app-release.aab` (47 MB)

## Étapes pour Google Play Console

### 1. Accéder à la configuration App Integrity
1. Ouvrez [Google Play Console](https://play.google.com/console)
2. Sélectionnez l'application **Tantsaha**
3. Menu de gauche → **Configuration** → **Intégrité de l'application**

### 2. Demander la réinitialisation de la clé d'upload
1. Dans la section **"App signing"**
2. Trouvez **"Upload key certificate"**
3. Cliquez sur **"Request upload key reset"** ou **"Manage upload certificates"**

### 3. Remplir le formulaire de demande
- **Raison** : "Lost original upload keystore file"
- **Preuve d'identité** : Joindre le PEM original si demandé : `android/upload_certificate_original.pem`
- **Nouveau certificat** : Télécharger `android/new-upload-certificate.pem`

### 4. Attendre l'approbation
- Google Play examine généralement sous 24-48h
- Vous recevrez un email de confirmation

### 5. Une fois approuvé
1. Téléchargez l'AAB : `build/app/outputs/bundle/release/app-release.aab`
2. L'application sera mise à jour avec succès

## Alternative si le reset est refusé

### Contacter le support Google Play
1. Menu principal → **Aide et commentaires** → **Contacter l'équipe d'assistance**
2. Expliquez la situation :
   ```
   Subject: Lost upload keystore for app Tantsaha (com.arihavana.tantsaha)
   
   Hello,
   
   I have lost the original upload keystore for my app Tantsaha.
   - App ID: com.arihavana.tantsaha
   - Original upload key SHA1: 9E:BE:AA:CA:B0:1E:9F:2A:91:3A:70:69:26:4D:3A:7A:7A:C0:BD:1D
   - I have the original PEM certificate attached
   - I have created a new upload keystore and can provide the new certificate
   
   Could you please help me reset the upload key so I can continue updating my app?
   
   Thank you.
   ```
3. Joindre : `android/upload_certificate_original.pem` et `android/new-upload-certificate.pem`

## Fichiers importants

- **Nouveau keystore** : `android/app/upload-keystore-new.jks`
- **Nouveau certificat PEM** : `android/new-upload-certificate.pem`
- **Original PEM (preuve)** : `android/upload_certificate_original.pem`
- **AAB signé** : `build/app/outputs/bundle/release/app-release.aab`
- **Credentials** :
  - Password: `0TsmTiTaeN1999!?`
  - Alias: `upload-key-alias`

## Important
⚠️ **NE PAS SUPPRIMER** le nouveau keystore `android/app/upload-keystore-new.jks` - c'est votre nouvelle clé après approbation de Google.

## Pourquoi le keystore original est perdu ?
Recherche exhaustive effectuée :
- ✅ Tout l'ordinateur scanné
- ✅ Tous les projets Tantsaha vérifiés
- ✅ Historique Git analysé
- ✅ Backups et corbeille vérifiés
- ✅ Fichiers binaires analysés par signature

**Conclusion** : Le keystore a été supprimé ou créé sur un autre ordinateur.
