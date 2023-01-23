//
//  GenerationConfig.swift
//  ProjectDescriptionHelpers
//
//  Created by Hai Feng Kao on 2022/1/7.
//

import ProjectDescription

// MARK: - GenerationMode

public enum GenerationMode {
    case workspace /// make each uFeature as a project, and whole app as single workspace, TODO: broken
    case singleProject /// make each uFeature as a target, and whole app as single project
}

// MARK: - LinkType

public enum LinkType {
    case staticLink
    case dynamicLink
}

// MARK: - GenerationConfig

/// Config settings for project generation
public struct GenerationConfig {
    public var mode: GenerationMode = .singleProject
    public var linkType: LinkType = .staticLink

    public var platform: Platform = .iOS
    public var deploymentTarget: DeploymentTarget = .iOS(targetVersion: "16.0", devices: [.ipad, .iphone])
    public var featuresRootPath = "Features/"
    public static var `default`: Self = .init()
}
