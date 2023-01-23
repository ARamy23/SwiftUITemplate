//
//  PackageDependencyProviding.swift
//  ProjectDescriptionHelpers
//
//  Created by Hai Feng Kao on 2022/1/11.
//

import Foundation

// MARK: - PackageDependencyProviding

protocol PackageDependencyProviding {
    func packageDependencies(types: TargetTypes) -> SwiftPackages
}

// MARK: - MicroFeature + PackageDependencyProviding

extension MicroFeature: PackageDependencyProviding {
    func packageDependencies(types: TargetTypes) -> SwiftPackages {
        requiredTargetTypes.packageDependencies(types: types)
    }
}

// MARK: - Module + PackageDependencyProviding

extension Module: PackageDependencyProviding {
    func packageDependencies(types: TargetTypes) -> SwiftPackages {
        switch self {
        case .uFeature(let microFeature):
            return microFeature.packageDependencies(types: types)
        case .package(let swiftPackage):
            return [swiftPackage]
        }
    }
}

import ProjectDescription
extension PackageDependencyProviding {
    func packages(types: TargetTypes) -> [Package] {
        packageDependencies(types: types).map(\.package)
    }
}
