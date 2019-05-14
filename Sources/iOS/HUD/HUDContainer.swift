//
//  HUDContainer.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 09/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public class HUDContainer: UIVisualEffectView, AnimationAware {
    private let innerContentView: UIView & AnimationAware
    public let label = UILabel()
    public var text: String? {
        didSet {
            label.text = text
            label.sizeToFit()
            label.isHidden = text == nil
        }
    }

    public init(contentView: UIView & AnimationAware) {
        self.innerContentView = contentView
        super.init(effect: UIBlurEffect(style: .light))
        self.contentView.addSubview(innerContentView)
        self.contentView.addSubview(label)

        innerContentView.pinEdgesToSuperview()
        configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func configure() {
        layer.cornerRadius = 8
        layer.masksToBounds = true

        label.isHidden = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    public func startAnimation() {
        innerContentView.startAnimation()
    }

    public func endAnimation() {
        innerContentView.stopAnimation()
    }
}
