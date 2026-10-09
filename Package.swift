// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LivenessFacetecSDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "LivenessFacetecSDK", targets: ["LivenessFacetecSDKWrapper"])
    ],
    dependencies: [
        // Versão travada (exact) — precisa ser EXATAMENTE a mesma que o Identy declarar, senão
        // o SPM do app consumidor falha a resolução. Ver
        // plans-urgent/corrigir-colisoes-sdks-ios-vendor-facetec.md, seção 3.
        .package(url: "https://github.com/getsentry/sentry-cocoa.git", exact: "8.58.4")
    ],
    targets: [
        .target(
            name: "LivenessFacetecSDKWrapper",
            dependencies: [
                .target(name: "LivenessFacetecSDK"),
                .product(name: "Sentry-Dynamic", package: "sentry-cocoa")
            ],
            path: "Sources/LivenessFacetecSDKWrapper"
        ),
        .binaryTarget(name: "LivenessFacetecSDK", url: "__URL__", checksum: "__CHECKSUM__")
    ]
)
