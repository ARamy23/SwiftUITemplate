//
//  Framework.swift
//  ProjectDescriptionHelpers
//
//  Created by Hai Feng Kao on 2022/1/2.
//

import Foundation
import ProjectDescription

public typealias Modules = Set<Module>

extension Modules {
    static func + (_ lhs: Self, _ rhs: Self) -> Self {
        lhs.union(rhs)
    }
}

// MARK: - Module

/// Enum that defines the possible types of Frameworks
/// https://betterprogramming.pub/customize-your-xcodeproject-with-tuist-6fc41fb59262
public enum Module: Hashable {
    /// micro feature, the module with example project, and unit test
    case uFeature(MicroFeature)
    case package(SwiftPackage)

    public var package: SwiftPackage? {
        if case .package(let info) = self {
            return info
        }
        return nil
    }

    public var uFeature: MicroFeature? {
        if case .uFeature(let info) = self {
            return info
        }
        return nil
    }

    public var project: Project {
        fatalError("\(self) project not implemented")
    }

    public var projectPath: Path {
        if let code = uFeature {
            return .init(code.projectPath)
        }

        fatalError("\(self) project not implemented")
    }
}

public extension Module {
    static func uFeature(name: String, group: MicroFeatureGroup = nil, targets: [RequiredTargetType: TargetConfig]) -> Self {
        .uFeature(.init(name: name, group: group, requiredTargetTypes: .init(configs: targets)))
    }

    static func package(name: String, url: String, requirement: Package.Requirement) -> Self {
        .package(.init(name: name, url: url, requirement: requirement))
    }
}
