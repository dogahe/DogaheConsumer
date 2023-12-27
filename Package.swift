// swift-tools-version: 5.5
/*
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import PackageDescription

let package = Package(
  name: "GoogleRidesharingConsumer", platforms: [.iOS(.v14)],
  products: [
    .library(name: "GoogleRidesharingConsumer", targets: ["GoogleRidesharingConsumerTarget"])
  ], dependencies: [
    .package(url: "https://github.com/googlestaging/ios-maps-sdk", .exact("8.3.1")),
  ],
  targets: [
    .binaryTarget(
      name: "GoogleRidesharingConsumer",
      url: "https://github.com/dogahe/DogaheConsumer/releases/download/1.0.13/GoogleRidesharingConsumer_3p.xcframework.zip",
      checksum: "1682383a98b7801f5c4021cacce4afc2937d32aa08888ab2b5e5222eb2e1bb27"
    ),
    .target(
      name: "GoogleRidesharingConsumerTarget",
      dependencies: ["GoogleRidesharingConsumer",
                     .product(name: "GoogleMaps", package: "ios-maps-sdk"),
                     .product(name: "GoogleMapsCore", package: "ios-maps-sdk"),
                     .product(name: "GoogleMapsBase", package: "ios-maps-sdk"),
                    ],
      path: "Consumer",
      sources: ["dummy.m"],
      resources: [
        .copy("Resources/GoogleRidesharingConsumer/GoogleRidesharingConsumer.bundle"),
        //.copy("Resources/GoogleRidesharingConsumer/GoogleRidesharingConsumer.bundle/gRPCCertificates.bundle"),
        //.copy("gRPCCertificates.bundle"),
      ],
      publicHeadersPath: "Sources"
    ),
  ]
)
