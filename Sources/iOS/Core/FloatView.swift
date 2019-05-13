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
    public var delegate: FloatViewDelegate = DefaultFloatViewDelegate()

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

public class DefaultFloatViewDelegate: FloatViewDelegate {
    public func constrain(floatView: FloatView, parentView: UIView) {
        NSLayoutConstraint.activate([
            floatView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            floatView.centerYAnchor.constraint(equalTo: parentView.centerYAnchor),
            floatView.widthAnchor.constraint(equalToConstant: 150),
            floatView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    public func animateShow(floatView: FloatView) {
        let animator = UIViewPropertyAnimator(duration: 0.35, curve: .easeIn)
        floatView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)

        animator.addAnimations {
            floatView.transform = CGAffineTransform.identity
        }

        animator.addCompletion { _ in
            floatView.contentView.startAnimation()
        }

        animator.startAnimation()
    }

    public func animateHide(floatView: FloatView) {
        let animator = UIViewPropertyAnimator(duration: 0.35, curve: .easeIn)

        animator.addAnimations {
            floatView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }

        animator.addCompletion { _ in
            floatView.contentView.stopAnimation()
            floatView.transform = CGAffineTransform.identity
            floatView.removeFromSuperview()
        }

        animator.startAnimation()
    }
}
