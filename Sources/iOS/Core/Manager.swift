//
//  Manager.swift
//  FantasticDisplay
//
//  Created by khoa on 14/05/2019.
//

import UIKit

class DummyContentView: UIView, AnimationAware {
    func startAnimation() {}

    func stopAnimation() {}
}

public class Manager {
    public var floatView: FloatView = FloatView(contentView: DummyContentView()) {
        didSet {
            oldValue.removeFromSuperview()
        }
    }

    public static var shared = Manager()
}
