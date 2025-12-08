# News Hub 📰

Um aplicativo Flutter moderno e minimalista para descobrir e consumir as últimas notícias de forma elegante e intuitiva.

## 🎯 Visão Geral

**News Hub** é um aplicativo de leitura de notícias desenvolvido em Flutter com foco em simplicidade, performance e experiência do usuário. O app oferece uma interface limpa e minimalista para que os usuários possam acompanhar as últimas notícias em diferentes categorias.

## ✨ Recursos Principais

- **Autenticação de Usuário**: Tela de login minimalista com validação de email e senha.
- **Home com SliverAppBar**: Interface inicial com app bar expansível que mostra uma saudação personalizada ao usuário.
- **Lista de Notícias**: Visualização minimalista de notícias com cards limpos e divisores.
- **Design Responsivo**: Layout adaptável para diferentes tamanhos de tela.
- **SVG Support**: Suporte a ilustrações vetoriais para uma experiência visual superior.

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework principal para desenvolvimento multiplataforma.
- **Dart**: Linguagem de programação.
- **go_router** (v17.0.0): Roteamento e navegação.
- **flutter_svg** (v2.2.3): Renderização de imagens SVG.
- **http** (v1.6.0): Requisições HTTP para API de notícias.
- **provider** (v6.1.5+1): Gerenciamento de estado.
- **cupertino_icons** (v1.0.8): Ícones estilo iOS.

## 📱 Plataformas Suportadas

- iOS (via Xcode)
- Android (via Gradle)
- Web (configuração disponível)

## 🚀 Como Começar

### Pré-requisitos

- Flutter SDK instalado (versão 3.8.1 ou superior)
- Dart SDK (incluído no Flutter)
- Xcode (para desenvolvimento iOS)
- Android Studio ou Gradle (para desenvolvimento Android)
- Git

### Instalação

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/LuizFelipeOC/flutter-news-hub.git
   cd news_hub
   ```

2. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

3. **Configure os assets** (se necessário):
   Certifique-se de que o arquivo `assets/login_image.svg` existe. Se não, adicione a ilustração de login na pasta `assets/`.

### Execução

**Executar no emulador/dispositivo**:
```bash
flutter run -d <device-id>
```

**Listar dispositivos disponíveis**:
```bash
flutter devices
```

**Build de produção**:
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                          # Ponto de entrada da aplicação
├── app/
│   ├── core/
│   │   ├── constants/                 # Constantes globais
│   │   ├── routes/                    # Configuração de rotas (go_router)
│   │   └── theme/                     # Tema e estilo global
│   └── pages/
│       ├── home/
│       │   └── home_page.dart         # Tela inicial com SliverAppBar
│       ├── login/
│       │   └── login_page.dart        # Tela de autenticação
│       └── onboarding/                # Páginas de onboarding (futuro)
├── assets/
│   └── login_image.svg                # Ilustração da tela de login
└── test/
    └── widget_test.dart               # Testes de widgets
```

## 🎨 Design System

O aplicativo segue um design minimalista com:
- **Paleta de cores**: Cores primárias e neutras do Material Design 3.
- **Tipografia**: Títulos em peso 600 (semibold), corpo em pesos normais.
- **Espaçamento**: Paddings e margins consistentes (8, 12, 16, 20, 24 dp).
- **Componentes**: Cards simples, ListTiles limpos, divisores sutis.

## 📄 Páginas Principais

### 1. LoginPage (`lib/app/pages/login/login_page.dart`)
- Ilustração SVG (`login_image.svg`)
- Campos de email e senha com validação
- Botão "Entrar"
- Ações auxiliares: "Esqueci minha senha" e "Criar conta"

### 2. HomePage (`lib/app/pages/home/home_page.dart`)
- `SliverAppBar` expansível com saudação personalizada
- Avatar do usuário com iniciais
- Lista minimalista de notícias com ícones e divisores
- Suporte a scroll infinito (base para implementação futura)

## 🔐 Autenticação

Atualmente, a tela de login possui validação básica de formulário. A integração com um backend de autenticação (Firebase, API própria, etc.) pode ser implementada conectando o botão "Entrar" a um serviço de autenticação.

## 🌐 API de Notícias

O projeto inclui o pacote `http` para requisições HTTP. Integre com uma API de notícias como:
- **NewsAPI** (https://newsapi.org/)
- **Guardian API**
- **API customizada**

## 📦 Dependências Principais

| Pacote | Versão | Função |
|--------|--------|--------|
| `go_router` | 17.0.0 | Navegação e roteamento |
| `flutter_svg` | 2.2.3 | Renderização de SVG |
| `http` | 1.6.0 | Requisições HTTP |
| `provider` | 6.1.5+1 | Gerenciamento de estado |

## 🎯 Roadmap

- [ ] Integração com API de notícias
- [ ] Autenticação real (Firebase Auth ou API customizada)
- [ ] Tela de onboarding
- [ ] Categorias de notícias
- [ ] Favoritos e leitura posterior
- [ ] Busca de notícias
- [ ] Tema claro/escuro
- [ ] Push notifications
- [ ] Cache offline

## 🤝 Contribuindo

Contribuições são bem-vindas! Por favor:
1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 👨‍💻 Autor

**Luiz Felipe OC**
- GitHub: [@LuizFelipeOC](https://github.com/LuizFelipeOC)
- Email: seu-email@example.com

## 📞 Suporte

Se encontrar problemas ou tiver sugestões, abra uma [issue no GitHub](https://github.com/LuizFelipeOC/flutter-news-hub/issues).

## 🙏 Agradecimentos

- Comunidade Flutter
- Pacotes de terceiros utilizados
- Design inspiration do Material Design 3

---

**Última atualização**: 8 de dezembro de 2025
**Status**: Em desenvolvimento 🚧
