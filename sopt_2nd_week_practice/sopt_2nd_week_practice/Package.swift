//
//  Package.swift
//  sopt_2nd_week_practice
//
//  Created by 신지원 on 2023/04/20.
//

let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/apple/swift-pretendard", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "YourTargetName",
            dependencies: [
                .product(name: "Pretendard", package: "swift-pretendard") // Add as a dependency
            ]
        )
    ]
)
