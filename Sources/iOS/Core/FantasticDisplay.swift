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

    showFloat(contentView: HUDContainer(contentView: contentView), on: parentView)
}

public func showToast(text: String, on parentView: UIView? = nil) {
    showFloat(contentView: ToastContainer(), on: parentView)
}

public func hide() {
    Manager.shared.floatView.hide()
}

private func showFloat(contentView: UIView & AnimationAware, on parentView: UIView? = nil) {
    let floatView = FloatView(contentView: contentView)
    floatView.show(on: parentView!)
    Manager.shared.floatView = floatView
}


