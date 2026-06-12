# Sniffer App — Design System

> Documento de referência do sistema de design visual. Atualizado em: 2026-05-22.

---

## Filosofia Visual

| Plataforma | Abordagem |
|---|---|
| **iOS** | Liquid Glass — superfícies semi-transparentes com blur (`rgba(255,255,255,0.72)`) |
| **Android** | Material You — tonal surfaces com elevação colorida (`#F6F4FC`, `#EEEAF7`) |

A mesma API de componentes é usada em ambas as plataformas; a diferença visual é aplicada via `Platform.OS` dentro dos tokens e componentes.

---

## Tokens de Design

Arquivo principal: `src/theme/index.ts`
Estilos glass: `src/theme/glassStyles.ts`

---

## Cores

### Brand

| Token | Hex | Uso |
|---|---|---|
| `green` | `#50F296` | CTA principal, destaques, glow |
| `greenDark` | `#3DE085` | Gradiente do botão primary |
| `greenGlow` | `rgba(80,242,150,0.4)` | Efeito glow |
| `purple` | `#332D59` | Botão secondary, ícones ativos, nav |
| `purpleLight` | `#4A4280` | Gradiente, variações |
| `purpleDark` | `#1A1636` | Fundos profundos |

### Texto

| Token | Hex | Uso |
|---|---|---|
| `text` | `#1A1A2E` | Texto principal |
| `textSecondary` | `#6B7280` | Texto secundário |
| `textMuted` | `#9CA3AF` | Placeholders, labels inativas |
| `textLight` | `#B0B0C0` | Texto em fundo escuro |

### Superfícies

| Token | iOS | Android | Uso |
|---|---|---|---|
| `surfaceGlass` | `rgba(255,255,255,0.72)` | `#F6F4FC` | Cards padrão |
| `surfaceGlassLight` | `rgba(255,255,255,0.5)` | `#FAF8FF` | Inputs, superfícies leves |
| `surfaceGlassDark` | `rgba(30,25,60,0.6)` | `rgba(30,25,60,0.88)` | Overlays escuros |
| `background` | `#F8F9FF` | `#FAF8FF` | Fundo de tela |
| `surface` | `#FFFFFF` | `#FFFFFF` | Superfície pura |

### Tonal (Android — Material You)

| Token | Hex | Uso |
|---|---|---|
| `tonalSurface` | `#F6F4FC` | Base |
| `tonalSurfaceHigh` | `#EEEAF7` | Elevação +1 |
| `tonalSurfaceHighest` | `#E6E1F2` | Elevação +2 |
| `tonalContainer` | `#E8E3F4` | Pills, badges, foco de input |
| `tonalContainerLow` | `#F2EFF9` | Containers sutis |
| `tonalOutline` | `#CBC4DC` | Bordas |

### Bordas Glass

| Token | iOS | Android |
|---|---|---|
| `glassBorder` | `rgba(255,255,255,0.3)` | `#E8E4F0` |
| `glassBorderLight` | `rgba(255,255,255,0.15)` | `#F0ECF5` |
| `glassBorderStrong` | `rgba(255,255,255,0.5)` | `#DDD8E8` |

### Semânticas

| Token | Hex |
|---|---|
| `success` | `#34D399` |
| `error` | `#F87171` |
| `warning` | `#FBBF24` |

---

## Tipografia

Fonte: sistema nativo (sem custom font). Tokens em `TYPOGRAPHY` no `src/theme/index.ts`.

| Token | Tamanho | Peso | Line Height | Letter Spacing |
|---|---|---|---|---|
| `hero` | 32px | 900 | 38px | -1 |
| `h1` | 28px | 800 | 34px | -0.8 |
| `h2` | 22px | 800 | 28px | -0.5 |
| `h3` | 18px | 700 | — | -0.3 |
| `sectionTitle` | 20px | 800 | — | -0.4 |
| `body` | 15px | 400 | 22px | — |
| `bodyBold` | 15px | 600 | 22px | — |
| `button` | 16px | 700 | — | 0.5 |
| `caption` | 12px | 600 | — | — |
| `label` | 13px | 700 | — | 0.3 |

---

## Espaçamento

Escala de 4pt. Tokens em `SPACING`.

| Token | Valor | Uso típico |
|---|---|---|
| `xs` | 4px | Espaçamentos mínimos |
| `sm` | 8px | Gaps internos |
| `md` | 12px | Padding compacto |
| `lg` | 16px | Padding lateral padrão de tela |
| `xl` | 20px | Seções |
| `xxl` | 24px | Blocos maiores |
| `xxxl` | 32px | Separação entre seções |

---

## Border Radius

Tokens em `RADIUS`.

| Token | iOS | Android | Uso |
|---|---|---|---|
| `sm` | 8px | 8px | Elementos pequenos |
| `md` | 14px | 16px | Botões, inputs |
| `lg` | 16px | 18px | Cards |
| `pill` | 999px | 999px | Badges, tabs, pills |

---

## Sombras

6 presets em `SHADOWS`:

| Nome | Uso |
|---|---|
| `soft` | Superfícies leves, ghost buttons |
| `card` | Cards padrão |
| `deep` | Cards fortes, modais |
| `glow` | Botão primary (verde) |
| `glowPurple` | Botão secondary (roxo) |
| `shadowPurple` | `rgba(51,45,89,0.15)` |

---

## Botões

Arquivo: `src/components/button.tsx`

### Variantes

| Variante | Background | Texto | Sombra |
|---|---|---|---|
| `primary` | Gradiente `#50F296 → #3DE085` | Dark | `glow` (verde) |
| `secondary` | `#332D59` (purple) | Branco | `glowPurple` |
| `ghost` | `surfaceGlass` | Dark | `soft` |
| `success` | `#34D399` | Branco | `soft` |
| `danger` | `#F87171` | Branco | `soft` |

### Tamanhos

| Size | Altura | Padding H | Font |
|---|---|---|---|
| `sm` | 40px | 18px | 14px |
| `md` (padrão) | 48px | 22px | 16px |
| `lg` | 54px | 24px | 16px |

**Interações:**
- Press: scale `0.96` com spring (`damping: 15, stiffness: 300`)
- Disabled: `opacity: 0.4`
- Loading: `ActivityIndicator` inline
- Border-radius: `RADIUS.md` ou `pill` (999px)

---

## Inputs

### FormField — `src/components/FormField.tsx`

Row estilo iOS Settings com label + campo.

- Sem borda visível (flat design)
- Foco: muda background para `tonalContainer` (Android) ou `#EAEAF2` (iOS)
- Erro: background `rgba(239,68,68,0.05)` + texto de erro abaixo
- Padding: `18px` H, `15px` V
- Font: 15px, weight 600

### GlassInput — `src/components/GlassInput.tsx`

Input com estética glass, suporta label, ícone e helper text.

- Background: `tonalContainerLow` (Android) / `surfaceGlassLight` (iOS)
- Borda: `1px glassBorder`
- Border-radius: `RADIUS.md`
- Altura padrão: `50px` | multiline: `120px`
- Placeholder: `rgba(60,60,67,0.3)`
- Erro: borda vira `#F87171`

---

## Cards

Presets em `GLASS` (`src/theme/glassStyles.ts`):

| Variante | Background | Borda | Shadow | Uso |
|---|---|---|---|---|
| `card` | `surfaceGlass` (iOS) / `tonalSurface` (Android) | `1px glassBorder` (iOS) | `card` | Container padrão |
| `cardStrong` | `surfaceGlass` / `tonalSurfaceHigh` | `1.5px glassBorderStrong` (iOS) | `deep` | Destaque/hierarquia alta |
| `surface` | `rgba(255,255,255,0.85)` / `tonalContainerLow` | `0.5px glassBorderLight` (iOS) | none | Superfície discreta |
| `pill` / `badge` | `rgba(255,255,255,0.6)` / `tonalContainer` | `1px glassBorder` | none | Tags, chips de status |
| `darkOverlay` | `surfaceGlassDark` | `1px rgba(255,255,255,0.1)` (iOS) | none | Overlay sobre conteúdo |

---

## Bottom Tab Navigation

Arquivo: `src/app/(protected)/(tabs)/_layout.tsx`

### Abas

| # | Nome | Label | Ícone (Android) | Ícone (iOS) | Rota |
|---|---|---|---|---|---|
| 1 | home | Home | `pets` (MaterialIcons) | `pawprint` / `pawprint.fill` (SF Symbol) | `/home` |
| 2 | community | Comunidade | `favorite` (MaterialIcons) | SF Symbol equivalente | `/community` |
| 3 | explore | Explore | `search` (MaterialIcons) | SF Symbol equivalente | `/explore` |
| 4 | chat | Mensagens | `chat` (MaterialIcons) | SF Symbol equivalente | `/chat` |
| 5 | profile | Perfil | `person` (MaterialIcons) | SF Symbol equivalente | `/profile` |

### Estilo Visual

**Android (expo-router Tabs padrão):**
- Background: `#F6F4FC` (`tonalSurface`)
- Altura: `68dp`
- Padding: `10dp` bottom, `8dp` top
- Borda top: nenhuma (`borderTopWidth: 0`)
- Elevação: `4dp`
- Ícone ativo: cor `#332D59` (purple)
- Ícone inativo: cor `#9CA3AF` (textMuted)
- Label: 12px, weight 600, letter-spacing 0.3
- Indicador: mudança de cor (sem pill/underline)

**iOS (expo-router/unstable-native-tabs):**
- Aparência nativa
- Cor ativa (dark mode): `#50F296` (green)
- Cor ativa (light mode): `#332D59` (purple)
- Ícone ativo: SF Symbol variante `filled`
- Comportamento: `minimizeBehavior="onScrollDown"` — esconde ao rolar para baixo
- Indicador: morfismo do ícone (default ↔ filled, nativo iOS)

### Bibliotecas de Ícones

- **Android:** `MaterialIcons` (`@expo/vector-icons`)
- **iOS:** SF Symbols (nativo)
- **Suplementar (app):** `lucide-react-native`

---

## Componentes Reutilizáveis

### UI Base

| Componente | Arquivo | Descrição |
|---|---|---|
| Button | `src/components/button.tsx` | 5 variantes, 3 tamanhos, press animation |
| Badge | `src/components/badge.tsx` | Toggle pill ativo/inativo |
| Checkbox | `src/components/checkbox.tsx` | Checkbox com check verde |
| ProgressBar | `src/components/ProgressBar.tsx` | Barra animada com segmentos |
| StepIndicator | `src/components/StepIndicator.tsx` | Contador de passos com pills |
| OTP | `src/components/otp.tsx` | Input de código OTP |
| Dots | `src/components/dots.tsx` | Paginação com pontos |

### Formulários

| Componente | Arquivo | Descrição |
|---|---|---|
| FormField | `src/components/FormField.tsx` | Row estilo iOS Settings |
| GlassInput | `src/components/GlassInput.tsx` | Input glass com label e helper |
| FormCard | `src/components/FormCard.tsx` | Container de formulário com divisores |

### Cards

| Componente | Arquivo | Descrição |
|---|---|---|
| MeetupCard | `src/components/meetupCard.tsx` | Avatar 69×69 + conteúdo |
| LinearCard | `src/components/linearCard.tsx` | Horizontal, 72px height, imagem + ação |
| SimpleEventCard | `src/components/simpleEventCard.tsx` | Compacto, 150px width |
| PlaceCard | `src/components/placeCard.tsx` | Modal slide-up para detalhes de lugar |
| ExperienceCard | `src/components/experienceCard.tsx` | Card de experiência |
| CategoryCard | `src/components/categoryCard.tsx` | Seleção de categoria |
| ReviewCard | `src/components/ReviewCard.tsx` | Card de avaliação/rating |

### Navegação / Layout

| Componente | Arquivo | Descrição |
|---|---|---|
| Header | `src/components/header.tsx` | Mascote + saudação + botão notificação |
| ScreenTitle | `src/components/ScreenTitle.tsx` | Wrapper de título de tela |
| BackButton | `src/components/backButton.tsx` | Botão de voltar |
| PillTab | `src/components/pillTab.tsx` | Tab switcher com pill animado deslizante |
| LineButton | `src/components/lineButton.tsx` | Toggle pill com spring animation |
| Loader | `src/components/loader.tsx` | Indicador de carregamento |

### Animações / Especiais

| Componente | Arquivo | Descrição |
|---|---|---|
| FlingStack | `src/components/FlingStack/index.tsx` | Stack de cards estilo Tinder |
| PhotoStack | `src/components/PhotoStack.tsx` | Fotos empilhadas |
| PulseMascot | `src/components/PulseMascot.tsx` | Mascote animado com pulse |
| SkiaRipple | `src/components/SkiaRipple.tsx` | Efeito ripple via Skia |
| ScaleCarousel | `src/components/ScaleCarousel.tsx` | Carrossel com animação de escala |
| DiscoverCarousel | `src/components/DiscoverCarousel.tsx` | Carrossel horizontal de descoberta |
| OnboardingSlide | `src/components/OnboardingSlide.tsx` | Slide de onboarding |
| AnimatedMaskedText | `src/components/AnimatedMaskedText.tsx` | Texto com animação de máscara |
| CarouselItem | `src/components/CarouselItem.tsx` | Wrapper de item de carrossel |

---

## Animações

| Padrão | Valores |
|---|---|
| Spring padrão | `damping: 15, stiffness: 300` |
| Press scale | `0.96–0.97` |
| Transição de estado | `220–300ms` |
| Tab scroll (iOS) | `minimizeBehavior="onScrollDown"` |

---

## Estrutura de Pastas

```
src/
  app/                     # Expo Router (rotas de tela)
    (protected)/
      (tabs)/              # Bottom tabs (home, community, explore, chat, profile)
  components/
    ui/                    # Componentes genéricos reutilizáveis
    templates/             # Layouts e wrappers de tela
  hooks/                   # Hooks customizados compartilhados
  services/                # Chamadas de API e integrações
  utils/                   # Funções puras utilitárias
  types/                   # Tipos e interfaces globais
  constants/               # Valores fixos e enums
  theme/
    index.ts               # COLORS, TYPOGRAPHY, SPACING, RADIUS, SHADOWS
    glassStyles.ts         # GLASS presets, BLUR_INTENSITY
```

---

## Acessibilidade

- Touch targets mínimos: **44–48px**
- Contraste: texto escuro em fundo claro, branco em fundo escuro
- Disabled state: `opacity: 0.4`
- Erro: cor `#F87171` + texto descritivo
