# 🔐 SECURITY.md - Configuração de Segurança

## ⚠️ IMPORTANTE - API Keys

Este projeto usa a **YouTube Data API v3** que requer uma API Key. **NUNCA** commite API Keys no código!

### 🛡️ Configuração Segura

1. **Crie um arquivo `.env`** (já está no .gitignore):
```bash
API_KEY=SUA_YOUTUBE_API_KEY_AQUI
```

2. **Configure a API Key** em `lib/api.dart`:
```dart
// Substitua 'SUBSTITUA_PELA_SUA_API_KEY' pela sua API Key real
const API_KEY = 'SUA_API_KEY_AQUI';
```

3. **Ou use variáveis de ambiente**:
```bash
flutter run --dart-define=YOUTUBE_API_KEY=SUA_API_KEY
```

### 🚨 Arquivos que NÃO devem ir para o Git

- ✅ `.env` (já protegido)
- ✅ `*.key`, `*.pem`, `*.p12`
- ✅ `*.keystore`, `key.properties`
- ✅ `GoogleService-Info.plist`
- ✅ `google-services.json`

### 🔄 Se você já commitou a API Key

1. **Revogue a API Key** no Google Cloud Console
2. **Gere uma nova API Key**
3. **Configure usando os métodos seguros acima**

### 📞 Obtendo uma API Key

1. Acesse [Google Cloud Console](https://console.cloud.google.com/)
2. Crie/selecione um projeto
3. Ative a YouTube Data API v3
4. Vá em "Credenciais" → "Criar credenciais" → "Chave de API"
5. Configure restrições (recomendado)

---
🛡️ **Segurança é prioridade! Nunca exponha credenciais.**