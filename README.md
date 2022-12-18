# kros6

[![emojicom](https://img.shields.io/badge/emojicom-%F0%9F%90%9B%20%F0%9F%86%95%20%F0%9F%92%AF%20%F0%9F%91%AE%20%F0%9F%86%98%20%F0%9F%92%A4-%23fff)](http://neni.dev/emojicom)

Aplicativo para criar times aleatórios de [Krosmaster](http://www.krosmaster.com/)

## Utilização

1. Clone o projeto
2. Gere o build com ``flutter run --release``. Siga as instruções de [debug via usb](#usbdebug) para instruções adicionais.

![screenshot](/assets/demo.png)

<!-- 1. Baixe o app pela [Play Store]() ou pela [release]()-->

## Desenvolvimento

### Ambiente

```sh
flutter pub get
```

### Execução

```sh
flutter run
```
> Use <kbd>r</kbd> ou <kbd>R</kbd> para recarregar o app

#### <a name="usbdebug"></a> USB debug

- Caso ``flutter devices`` e ``adb devices`` aponte que o celular não possui autorização tente os comandos abaixo, desabilite o debug no celular e habilite novamente

```sh
adb kill-server
adb start-server
```

### Testes

> Gere os mocks com ``flutter pub run build_runner build``

- CI
```sh
flutter test
```

- Testes específicos

```sh
flutter test test/backend/create_random_valid_team_test.dart
```

> Dica: utilize [gon](https://github.com/nenitf/gon) e teste com ``gon -c flutter test``

### Organização/dependência de arquivos

- `lib/backend`: lógica que foge da responsabilidade da camada de apresentação, cujo poderia estar em uma api
- `lib/api`: cliente do "backend", desconhecendo qualquer regra de negócio

## Links interessantes

- [Regras](https://www.fgbradleys.com/rules/rules3/KrosmasterArenaRules.pdf) Krosmaster 1.0
- [Regras](https://cmon-files.s3.amazonaws.com/pdf/assets_item/resource/45/Rulebook_Krosmaster_Arena.pdf) Krosmaster 2.0
- [Wiki](https://krosarchive.es/PT/seasons) de miniaturas
