//
//  HasReference.swift
//  ProjectDescriptionHelpers
//
//  Created by Hai Feng Kao on 2022/1/15.
//

import ProjectDescription

// MARK: - HasReference

protocol HasReference {
    var reference: TargetDependency { get }
}

// MARK: - Module + HasReference

extension Module: HasReference {
    var reference: TargetDependency {
        switch self {
        case .uFeature(let microFeature):
            return microFeature.reference
        case .package(let swiftPackage):
            return swiftPackage.reference
        }
    }
}
