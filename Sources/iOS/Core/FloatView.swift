//
//  FloatView.swift
//  FantasticDisplay
//
//  Created by khoa on 09/05/2019.
//

import UIKit

public class FloatView: UIView {
    public let contentView: UIView & AnimationAware
    public var animator: () -> UIViewPropertyAnimator = AnimatorFactory.simple
    public var contrain: (UIView, UIView) -> Void = ConstrainFactory.center

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
        contrain(self, parentView)

        let animator = self.animator()
        animator.addAnimations {
            self.layoutIfNeeded()
        }

        animator.addCompletion { _ in
            self.contentView.startAnimation()
        }

        animator.startAnimation()
    }

    public func hide() {
        let animator = self.animator()
        animator.addAnimations {
            self.removeFromSuperview()
        }

        animator.addCompletion { _ in
            self.contentView.stopAnimation()
        }

        animator.startAnimation()
    }
}

