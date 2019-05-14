//
//  FloatView.swift
//  FantasticDisplay
//
//  Created by khoa on 09/05/2019.
//

import UIKit

public protocol FloatViewDelegate {
    func constrain(floatView: FloatView, parentView: UIView)
    func animateShow(floatView: FloatView)
    func animateHide(floatView: FloatView)
}

public class FloatView: UIView {
    public let contentView: UIView & AnimationAware
    public var delegate: FloatViewDelegate = HUDHandler()

    public init(contentView: UIView & AnimationAware) {
        self.contentView = contentView
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.pinEdgesToSuperview()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func show(on parentView: UIView) {
        parentView.addSubview(self)
        delegate.constrain(floatView: self, parentView: parentView)
        delegate.animateShow(floatView: self)
    }

    public func hide() {
        delegate.animateHide(floatView: self)
    }
}
