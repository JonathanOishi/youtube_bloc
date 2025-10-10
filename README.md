# 🎥 FlutterTube - YouTube App com BLoC Pattern

Um aplicativo Flutter moderno que simula a experiência do YouTube, permitindo pesquisar vídeos, visualizá-los e salvar como favoritos. Desenvolvido seguindo o padrão BLoC para gerenciamento de estado.

## 📱 Funcionalidades

- 🔍 **Pesquisa de Vídeos**: Busque vídeos usando a API oficial do YouTube
- ▶️ **Reprodução de Vídeos**: Visualize vídeos diretamente no app usando o YouTube Player
- ❤️ **Favoritos**: Salve seus vídeos preferidos e acesse offline
- 🏗️ **Arquitetura BLoC**: Gerenciamento de estado reativo e organizado
- 📱 **Design Responsivo**: Interface adaptada para diferentes tamanhos de tela

## 🛠️ Tecnologias Utilizadas

- **Flutter** 3.27.0
- **Dart** 3.6.0
- **BLoC Pattern** - Gerenciamento de estado
- **YouTube Data API v3** - Busca de vídeos
- **YouTube Player Flutter** - Reprodução de vídeos
- **Shared Preferences** - Armazenamento local
- **HTTP** - Requisições à API
- **RxDart** - Programação reativa


## 🚀 Como configurar o projeto
### 1. Clone o repositório
```bash
git clone https://github.com/JonathanOishi/youtube_bloc.git
cd youtube_bloc_pattern
```

### 2. Instale as dependências
```bash
flutter pub get
```

### 3. Configure a API Key do YouTube

1. Acesse o [Google Cloud Console](https://console.cloud.google.com/)
2. Crie um novo projeto ou selecione um existente
3. Ative a **YouTube Data API v3**
4. Crie credenciais (API Key)
5. Substitua a API Key no arquivo `lib/api.dart`:

```dart
// Substitua pela sua API Key
const API_KEY = 'SUA_API_KEY_AQUI';
```

### 4. Execute o projeto

#### Para Android:
```bash
flutter run
```

#### Para iOS (apenas no macOS):
```bash
flutter run
```

#### Para Web:
```bash
flutter run -d chrome
```

## 📁 Estrutura do Projeto

```
lib/
├── main.dart              # Ponto de entrada da aplicação
├── api.dart               # Configuração da API do YouTube
├── models/
│   └── video.dart         # Modelo de dados do vídeo
├── screens/
│   └── home.dart          # Tela principal do app
└── delegates/
    └── data_search.dart   # Delegate para busca de dados
```

## 🔧 Configuração para Desenvolvimento

### Android
- **Java Version**: 17 (LTS)
- **Compile SDK**: 35
- **Min SDK**: Configurado via Flutter
- **Target SDK**: Configurado via Flutter

### Dependências Principais
```yaml
dependencies:
  flutter_bloc: ^8.1.3      # Gerenciamento de estado BLoC
  youtube_player_flutter: ^9.0.3  # Player de vídeos do YouTube
  http: ^1.2.2               # Requisições HTTP
  shared_preferences: ^2.3.2 # Armazenamento local
  rxdart: ^0.28.0           # Programação reativa
```

## 🎯 Como usar

1. **Pesquisar Vídeos**: Use a barra de pesquisa na tela inicial
2. **Assistir Vídeos**: Toque em qualquer vídeo para reproduzi-lo
3. **Favoritar**: Use o ícone de coração para salvar vídeos
4. **Visualizar Favoritos**: Acesse a aba de favoritos para ver seus vídeos salvos

## 🤝 Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👤 Autor

**Jonathan Oishi**
- GitHub: [@JonathanOishi](https://github.com/JonathanOishi)

## 🙏 Agradecimentos

- [Flutter Team](https://flutter.dev/) pelo framework incrível
- [BLoC Library](https://bloclibrary.dev/) pelo padrão de arquitetura
- [YouTube Data API](https://developers.google.com/youtube/v3) pelos dados dos vídeos

---

⭐ Se este projeto te ajudou, considere dar uma estrela!
