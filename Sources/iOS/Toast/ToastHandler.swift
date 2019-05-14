//
//  ToastHandler.swift
//  FantasticDisplay
//
//  Created by khoa on 14/05/2019.
//

import Foundation

public class ToastHandler: FloatViewDelegate {
    public func constrain(floatView: FloatView, parentView: UIView) {
        NSLayoutConstraint.activate([
            floatView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            floatView.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 50),
            floatView.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -50),
            floatView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    public func animateShow(floatView: FloatView) {
        let animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn)
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
        let animator = UIViewPropertyAnimator(duration: 0.24, curve: .easeIn)

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
