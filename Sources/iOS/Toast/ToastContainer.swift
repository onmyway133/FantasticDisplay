//
//  ToastContainer.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 09/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public class ToastContainer: UIVisualEffectView, AnimationAware {
    private let innerContentView: UIView & AnimationAware

    public init(contentView: UIView & AnimationAware) {
        self.innerContentView = contentView
        super.init(effect: UIBlurEffect(style: .dark))
        self.contentView.addSubview(innerContentView)
        innerContentView.pinEdgesToSuperview()
        configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func configure() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }

    public func startAnimation() {
        innerContentView.startAnimation()
    }

    public func endAnimation() {
        innerContentView.stopAnimation()
    }
}

