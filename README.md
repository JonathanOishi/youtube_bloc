# 🎥 YouTube BLoC Pattern

Um aplicativo Flutter que replica a experiência do YouTube com busca, reprodução de vídeos e sistema de favoritos. Desenvolvido com arquitetura BLoC para gerenciamento de estado reativo.

**Plataformas suportadas:** 📱 Android | 🍎 iOS | 🌐 Web

## 📱 O que é o App

Este é um **clone do YouTube** que permite:
- Buscar vídeos reais da plataforma YouTube
- Assistir vídeos com player integrado
- Salvar vídeos favoritos localmente
- Navegar por conteúdo aleatório

O app conecta-se à **YouTube Data API v3** para buscar vídeos reais e usa o **YouTube Player** para reprodução nativa.


## 🛠️ Tecnologias Utilizadas

- **Flutter 3.27.0** - Framework multiplataforma
- **flutter_bloc ^8.1.6** - Gerenciamento de estado BLoC/Cubit
- **youtube_player_flutter ^9.1.3** - Reprodução de vídeos
- **YouTube Data API v3** - Busca e dados dos vídeos
- **shared_preferences ^2.3.2** - Persistência local
- **http ^1.2.2** - Requisições para API

## 🚀 Como Configurar

1. **Clone o repositório:**
```bash
git clone https://github.com/JonathanOishi/youtube_bloc.git
cd youtube_bloc_pattern
```

2. **Instale dependências:**
```bash
flutter pub get
```

3. **Configure YouTube API:**
   - Acesse [Google Cloud Console](https://console.cloud.google.com/)
   - Ative a YouTube Data API v3
   - Gere uma API Key
   - Substitua em `lib/api.dart`:
   ```dart
   const API_KEY = 'SUA_API_KEY_AQUI';
   ```

4. **Execute o app:**
```bash
# Mobile (Android/iOS)
flutter run

# Web
flutter run -d chrome
# ou
flutter run -d web-server
```

## 🌐 Executar na Web

O aplicativo agora suporta a plataforma web! Para compilar e executar como website:

```bash
# Build para produção
flutter build web

# Os arquivos compilados estarão em build/web/
# Deploy em qualquer servidor web ou serviço de hospedagem
```

O app está configurado como PWA (Progressive Web App) e pode ser instalado no navegador.

## 📸 Preview

<div align="center">
  <a href="https://freeimage.host/">
    <img src="https://iili.io/K4XUILJ.png" alt="K4XUILJ.png" border="0" width="300" />
  </a>
   <a href="https://freeimage.host/i/K4XUzXa">
    <img src="https://iili.io/K4XUzXa.md.png" alt="K4XUzXa.md.png" border="0" width="300">
  </a>
</div>

---
⭐ **Gostou do projeto? Deixe uma estrela no GitHub!**
