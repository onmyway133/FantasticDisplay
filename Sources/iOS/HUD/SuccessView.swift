//
//  SuccessView.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 10/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public class SuccessView: UIView, AnimationAware {
    public let shapeLayer = CAShapeLayer()
    public let animation = CABasicAnimation(keyPath: "strokeEnd")

    public var lineColor: UIColor = UIColor.darkGray
    public var duration: TimeInterval = 0.5

    public override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(shapeLayer)
        configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        configurePath()
    }

    public func configure() {
        shapeLayer.fillMode = .forwards
        shapeLayer.lineCap = .round
        shapeLayer.lineJoin = .round
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 6

        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = duration
        animation.isRemovedOnCompletion = false
    }

    private func configurePath() {
        let size = CGSize(width: 80, height: 60)
        shapeLayer.frame = CGRect(origin: .zero, size: size)
        shapeLayer.position = layer.position

        let path = UIBezierPath()
        path.move(to: CGPoint(x: size.width * 0, y: size.height * 0.48))
        path.addLine(to: CGPoint(x: size.width * 0.38, y: size.height))
        path.addLine(to: CGPoint(x: size.width, y: size.height * 0.01))

        shapeLayer.path = path.cgPath
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        shapeLayer.strokeEnd = 0.0
    }

    public func startAnimation() {
        shapeLayer.add(animation, forKey: "")
    }

    public func stopAnimation() {
        shapeLayer.removeAllAnimations()
    }
}
