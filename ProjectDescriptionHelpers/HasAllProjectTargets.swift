//
//  MicroFeature+ProjectGeneration.swift
//  ProjectDescriptionHelpers
//
//  Created by Hai Feng Kao on 2022/1/7.
//

import ProjectDescription

// MARK: - HasAllProjectTargets

protocol HasAllProjectTargets {
    var allProjectTargets: [Target] { get }
}

// MARK: - Module + HasAllProjectTargets

extension Module: HasAllProjectTargets {
    public var allProjectTargets: [Target] {
        switch self {
        case .uFeature(let microFeature):
            return microFeature.allProjectTargets
        case .package:
            return [] // swift package doesn't have targets
        }
    }
}

// MARK: - MicroFeature + HasAllProjectTargets

extension MicroFeature: HasAllProjectTargets {
    var allProjectTargets: [Target] {
        targets
            +
            allMicroFeatureDependencies.map(\.allProjectTargets).joined()
    }
}

private extension MicroFeature {
    var allMicroFeatureDependencies: [MicroFeature] {
        moduleDependencies(types: .all).compactMap(\.uFeature)
    }
}
