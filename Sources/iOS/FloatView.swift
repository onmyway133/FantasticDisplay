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
        options.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            options.contentView.leftAnchor.constraint(equalTo: leftAnchor),
            options.contentView.rightAnchor.constraint(equalTo: rightAnchor),
            options.contentView.topAnchor.constraint(equalTo: topAnchor),
            options.contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func show(on parentView: UIView) {
        parentView.addSubview(self)
        options.contrain(self, parentView)
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
            view.widthAnchor.constraint(equalToConstant: 100),
            view.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

public struct AnimatorFactory {
    public static let simple = { () -> UIViewPropertyAnimator in
        return UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut)
    }
}
