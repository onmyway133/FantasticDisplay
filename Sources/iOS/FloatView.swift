//
//  FloatView.swift
//  FantasticDisplay
//
//  Created by khoa on 09/05/2019.
//

import UIKit

public struct Options {
    public var contentView: UIView = UIView()
    public var animator: () -> UIViewPropertyAnimator = AnimatorFactory.simple
    public var contrain: (UIView, UIView) -> Void = ConstrainFactory.center

    public init() {}
}

public class FloatView: UIView {
    public let options: Options

    public init(options: Options) {
        self.options = options
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        addSubview(options.contentView)
        options.contentView.pinEdges(view: self)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func show(on parentView: UIView) {
        parentView.addSubview(self)
        options.contrain(self, parentView)

        let animator = options.animator()
        animator.addAnimations {
            self.layoutIfNeeded()
        }

        animator.startAnimation()
    }

    public func hide() {
        removeFromSuperview()
    }
}

public struct ConstrainFactory {
    public static let center = { (view: UIView, parentView: UIView) -> Void in
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: parentView.centerYAnchor),
            view.widthAnchor.constraint(equalToConstant: 150),
            view.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

public struct AnimatorFactory {
    public static let simple = { () -> UIViewPropertyAnimator in
        return UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut)
    }
}

public class HUDContainer: UIVisualEffectView {
    public init() {
        super.init(effect: UIBlurEffect(style: .light))
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func setup() {
        layer.cornerRadius = 8
        layer.masksToBounds = true

        let view = UIView()
        view.backgroundColor = .yellow
        contentView.addSubview(view)
        view.pinEdges(view: contentView)
    }
}

public class ProgressView: UIView {

}

public class SuccessView: UIView {

}

public class ToastContainer: UIView {

}

extension UIView {
    func pinEdges(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
