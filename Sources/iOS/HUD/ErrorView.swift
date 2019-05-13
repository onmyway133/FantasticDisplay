//
//  ErrorView.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 10/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public class ErrorView: UIView, AnimationAware {
    public let line1 = CAShapeLayer()
    public let line2 = CAShapeLayer()

    public let animation1 = CASpringAnimation(keyPath: #keyPath(CALayer.transform))
    public let animation2 = CASpringAnimation(keyPath: #keyPath(CALayer.transform))

    public var lineColor: UIColor = UIColor.darkGray
    public var duration: TimeInterval = 0.25

    public override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(line1)
        layer.addSublayer(line2)
        configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        configureSize()
    }

    public func configure() {
        [line1, line2].forEach {
            $0.backgroundColor = lineColor.cgColor
        }

        [animation1, animation2].forEach {
            $0.fromValue = CGFloat.pi/2
            $0.damping = 1
            $0.mass = 1
            $0.initialVelocity = 1
            $0.duration = duration
            $0.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        }

        animation1.toValue = CGFloat.pi / 4
        animation2.toValue = -CGFloat.pi / 4
    }

    private func configureSize() {
        [line1, line2].forEach {
            $0.cornerRadius = 3
            $0.frame.size = CGSize(width: bounds.width*0.6, height: 6)
            $0.position = layer.position
        }
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        line1.transform = CATransform3DIdentity
        line2.transform = CATransform3DIdentity
    }

    public func startAnimation() {
//        line1.transform = CATransform3DMakeRotation(CGFloat.pi/4, 0, 0, 1.0)
//        line2.transform = CATransform3DMakeRotation(-CGFloat.pi/4, 0, 0, 1.0)

//        line1.add(animation1, forKey: "")
//        line2.add(animation2, forKey: "")
    }

    public func stopAnimation() {
        line1.removeAllAnimations()
        line2.removeAllAnimations()
    }
}
