//
//  AnimationAware.swift
//  FantasticDisplay
//
//  Created by khoa on 10/05/2019.
//

import Foundation

public protocol AnimationAware {
    func startAnimation()
    func stopAnimation()
}

public extension AnimationAware {
    func startAnimation() {}
    func stopAnimation() {}
}
