//
//  FloatView.swift
//  FantasticDisplay
//
//  Created by khoa on 09/05/2019.
//

import UIKit

public class FloatView: UIView {
    public let contentView: UIView
    public var animator: () -> UIViewPropertyAnimator = AnimatorFactory.simple
    public var contrain: (UIView, UIView) -> Void = ConstrainFactory.center

    public init(contentView: UIView) {
        self.contentView = contentView
        super.init(frame: .zero)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.pinEdgesToSuperview()
    }

    public func show(on parentView: UIView) {
        parentView.addSubview(self)
        contrain(self, parentView)

        let animator = self.animator()
        animator.addAnimations {
            self.layoutIfNeeded()
        }

        animator.startAnimation()
    }

    public func hide() {
        removeFromSuperview()
    }
}

