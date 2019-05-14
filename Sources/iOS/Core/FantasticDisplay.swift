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
    case shape(ShapeType)
}

public enum ShapeType {
    case heart
    case bell
    case custom(String)
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
    case .shape(let shapeType):
        let shapeView = ShapeView()
        shapeView.apply(type: shapeType)
        contentView = shapeView
    }

    showFloat(contentView: HUDContainer(contentView: contentView), on: parentView, delegate: HUDHandler())
}

public func showToast(text: String, on parentView: UIView? = nil) {
    let messageView = MessageView()
    messageView.label.text = text

    showFloat(contentView: ToastContainer(contentView: messageView), on: parentView, delegate: ToastHandler())
}

public func hide() {
    Manager.shared.floatView.hide()
}

private func showFloat(contentView: UIView & AnimationAware, on parentView: UIView? = nil, delegate: FloatViewDelegate) {
    let floatView = FloatView(contentView: contentView)
    floatView.delegate = delegate

    guard let parentView = parentView ?? UIApplication.shared.keyWindow else {
        return
    }

    floatView.show(on: parentView)
    Manager.shared.floatView = floatView
}


