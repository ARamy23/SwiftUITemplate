//
//  SwiftPackage+Default.swift
//  SwiftUITemplate
//
//  Created by Hai Feng Kao on 2022/3/23.
//

import Foundation

public extension Module {
    static var Quick: Module {
        .package(.init(name: "Quick", url: "https://github.com/Quick/Quick", requirement: .branch("main"), unitTestTool: true))
    }

    static var Nimble: Module {
        .package(.init(name: "Nimble", url: "https://github.com/Quick/Nimble", requirement: .branch("main"), unitTestTool: true))
    }
}
