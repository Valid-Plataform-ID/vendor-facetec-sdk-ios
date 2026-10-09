# Changelog

Todas as mudanças notáveis deste manifesto SPM são documentadas aqui. O formato segue
[Keep a Changelog](https://keepachangelog.com/en/1.0.0/); o versionamento segue
[SemVer](https://semver.org/).

Cada entrada corresponde a uma release do `LivenessFacetecSDK` em si (código-fonte no repositório
principal `vendor-facetec-mobile`), não a uma mudança neste repositório de manifesto — o
`Package.swift` é inteiramente gerado a cada release, nunca editado à mão.

## [Unreleased]

- Preparação deste manifesto (scaffold: `Package.swift` wrapper, README, LICENSE) — **nenhuma
  release publicada ainda**. Bloqueado até `vendor-facetec-mobile/ios/build-xcframework.sh` migrar
  de Sentry estático para `Sentry-Dynamic` (ver
  `vendor-facetec-mobile/plans-urgent/corrigir-colisoes-sdks-ios-vendor-facetec.md`) — publicar uma
  release antes disso resultaria em duas cópias de Sentry no app consumidor.

<!--
Modelo de entrada por release:

## [1.0.0] - AAAA-MM-DD

- `sentry-cocoa` pinado em `exact: "8.58.4"` (precisa bater com o manifesto do Identy).
- `shield-ptr-spm` compatível (opcional, weak-linked): `1.5.61` — adicione ao seu próprio app se
  precisar de coleta de device signature via Shield.
- Checksum do `.xcframework.zip`: `<checksum>`.
-->
