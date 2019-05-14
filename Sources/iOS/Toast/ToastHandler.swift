//
//  ToastHandler.swift
//  FantasticDisplay
//
//  Created by khoa on 14/05/2019.
//

import UIKit

public class ToastHandler: FloatViewDelegate {
    public func constrain(floatView: FloatView, parentView: UIView) {
        NSLayoutConstraint.activate([
            floatView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -30),
            floatView.leftAnchor.constraint(greaterThanOrEqualTo: parentView.leftAnchor, constant: 30),
            floatView.rightAnchor.constraint(lessThanOrEqualTo: parentView.rightAnchor, constant: -30),
            floatView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        ])
    }

    public func animateShow(floatView: FloatView) {
        let animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut)
        floatView.transform = CGAffineTransform(translationX: 0, y: 200)

        animator.addAnimations {
            floatView.transform = CGAffineTransform.identity
        }

        animator.addCompletion { _ in
            floatView.contentView.startAnimation()
        }

        animator.startAnimation()
    }

    public func animateHide(floatView: FloatView) {
        let animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut)

        animator.addAnimations {
            floatView.transform = CGAffineTransform(translationX: 0, y: 200)
        }

        animator.addCompletion { _ in
            floatView.contentView.stopAnimation()
            floatView.transform = CGAffineTransform.identity
            floatView.removeFromSuperview()
        }

        animator.startAnimation()
    }
}
