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
    .package(url: "https://github.com/dogahe/DogaheMaps", "1.0.13"..."1.0.13"),
  ],
  targets: [
    .binaryTarget(
      name: "GoogleRidesharingConsumer",
      url: "https://github.com/dogahe/DogaheConsumer/releases/download/1.0.0/GoogleRidesharingConsumer_3p.xcframework.zip",
      checksum: "b5a39c093b5d27e23235dd7097acec6e5d026b47b485630e99a850f114184c32"
    ),
    .target(
      name: "GoogleRidesharingConsumerTarget",
      dependencies: ["GoogleRidesharingConsumer",
                     .product(name: "GoogleMaps", package: "DogaheMaps"),
                     .product(name: "GoogleMapsCore", package: "DogaheMaps"),
                     .product(name: "GoogleMapsBase", package: "DogaheMaps"),
                    ],
      path: "Consumer",
      sources: ["dummy.m"],
      resources: [
        .copy("Resources/GoogleRidesharingConsumer/GoogleRidesharingConsumer.bundle"),
        .copy("Resources/gRPCCertificates/gRPCCertificates.bundle")
      ],
      publicHeadersPath: "Sources"
    ),
  ]
)
