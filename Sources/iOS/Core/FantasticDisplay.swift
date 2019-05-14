//
//  FantasticDisplay.swift
//  FantasticDisplay
//
//  Created by khoa on 14/05/2019.
//

import UIKit

public enum HUDType {
    case progress
    case success
    case error
}

public func showHUD(type: HUDType, on parentView: UIView? = nil) {
    let contentView: UIView & AnimationAware
    switch type {
    case .progress:
        contentView = ProgressView()
    case .success:
        contentView = SuccessView()
    case .error:
        contentView = ErrorView()
    }

    let floatView = FloatView(contentView: HUDContainer(contentView: contentView))
    floatView.show(on: parentView!)
    Manager.shared.floatView = floatView
}

public func hideHUD() {
    Manager.shared.floatView.hide()
}

class DummyContentView: UIView, AnimationAware {
    func startAnimation() {}

    func stopAnimation() {}
}

class Manager {
    var floatView: FloatView = FloatView(contentView: DummyContentView()) {
        didSet {
            oldValue.removeFromSuperview()
        }
    }

    static var shared = Manager()
}
