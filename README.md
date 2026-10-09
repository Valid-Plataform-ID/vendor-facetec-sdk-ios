# LivenessFacetecSDK (manifesto SPM)

Manifesto Swift Package Manager para o `LivenessFacetecSDK` — SDK de verificação de vivacidade
(liveness) biométrica para iOS via FaceTec, publicado e mantido pela VCC. Este repositório **não
contém código-fonte do SDK** — só o `Package.swift` (gerado automaticamente a cada release) que
aponta para o binário (`.xcframework.zip`) publicado em um bucket privado, servido por um gateway
autenticado.

> **⚠️ Status: scaffold preparado, build do SDK ainda não migrado.** Este manifesto segue o mesmo
> padrão wrapper já em produção no projeto-irmão (`Valid-Plataform-ID/vendor-identy-sdk-ios`), mas
> `vendor-facetec-mobile/ios/build-xcframework.sh` **ainda embute o Sentry estaticamente** dentro
> do próprio binário do SDK (não via `Sentry-Dynamic`). Publicar uma release real deste manifesto
> antes dessa migração resulta num app consumidor com **duas cópias de Sentry** (a estática, já
> embutida no `.xcframework`, mais a que este wrapper traz transitivamente) — não resolve a colisão
> de classes documentada em
> `vendor-facetec-mobile/plans-urgent/corrigir-colisoes-sdks-ios-vendor-facetec.md`, só prepara o
> manifesto para quando o build for corrigido. Ver esse documento para o diff exato necessário em
> `build-xcframework.sh` antes da primeira release real.

## Instalação

No Xcode: **File → Add Package Dependencies…** e informe a URL deste repositório. Selecione a
regra de versão **Up to Next Major Version**, a partir da versão desejada.

Ou, no seu próprio `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Valid-Plataform-ID/vendor-facetec-sdk-ios.git", from: "1.0.0")
]
```

E declare o produto `LivenessFacetecSDK` como dependência do seu target.

## Pré-requisito: credenciais do gateway

O binário resolvido por este manifesto está atrás de um gateway autenticado — configure a
credencial do seu cliente no `~/.netrc` da máquina/runner que resolve o pacote:

```
machine <domínio-do-gateway>
login <seu-usuário>
password <seu-token>
```

Sem isso, a resolução do `binaryTarget` falha com `401 Unauthorized`.

## O que este pacote traz

- `LivenessFacetecSDK` — o SDK compilado (binaryTarget remoto).
- Uma dependência real em `sentry-cocoa` (produto `Sentry-Dynamic`), versão travada (`exact`) —
  **precisa ser exatamente a mesma versão declarada pelo manifesto do Identy**
  (`vendor-identy-sdk-ios`), para que um app que combine os dois SDKs resolva o grafo de
  dependências SPM sem conflito.

Este pacote **não** declara uma dependência em `ShieldPtr` — essa é uma dependência opcional,
weak-linked, do próprio SDK compilado (depois da migração documentada em
`plans-urgent/corrigir-colisoes-sdks-ios-vendor-facetec.md`). Se o seu app precisar da coleta de
assinatura de dispositivo via Shield, adicione `shield-ptr-spm` (mesma versão pinada documentada no
changelog da release) ao seu próprio projeto.

## Assinatura (Run Script Phase)

O `.xcframework` é distribuído com assinatura ad-hoc. Seu projeto precisa re-assinar os
frameworks embutidos durante o build — ver a documentação de integração completa do SDK (fora
deste manifesto).

## Observações

- Esta distribuição remota cobre **apenas a variante Release** do SDK.
- A quais clientes esta distribuição está disponível é controlado pelo gateway — fora do escopo
  deste manifesto.
- Troubleshooting de resolução SPM (401/404/checksum mismatch): ver a documentação de integração
  completa do SDK.

## Changelog

Ver [CHANGELOG.md](./CHANGELOG.md).
