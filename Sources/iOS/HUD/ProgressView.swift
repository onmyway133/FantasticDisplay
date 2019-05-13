//
//  ProgressView.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 10/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public class ProgressView: UIView, AnimationAware {
    public let replicatorLayer = CAReplicatorLayer()
    public let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
    public let line = CALayer()

    public var lineCount: Int = 12
    public var duration: TimeInterval = 1.0
    public var lineSize: CGSize = CGSize(width: 20, height: 6)
    public var lineColor: UIColor = UIColor.darkGray

    public override init(frame: CGRect) {
        super.init(frame: .zero)

        configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func configure() {
        let angle = CGFloat.pi * 2 / CGFloat(lineCount)
        let rotation = CATransform3DMakeRotation(angle, 0, 0, 1.0)

        replicatorLayer.instanceTransform = rotation
        replicatorLayer.instanceCount = lineCount
        replicatorLayer.instanceDelay = duration / TimeInterval(lineCount)

        line.backgroundColor = lineColor.cgColor
        line.frame.size = lineSize
        line.cornerRadius = lineSize.height / 2

        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.repeatCount = Float.greatestFiniteMagnitude
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = duration

        replicatorLayer.addSublayer(line)
        layer.addSublayer(replicatorLayer)

        // x: the larger, the closer to center
        // y: half the height, changing affects rotation of lines
        line.position = CGPoint(x: 48, y: 75)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        replicatorLayer.frame = bounds
    }

    public func startAnimation() {
        line.add(animation, forKey: nil)
    }

    public func stopAnimation() {
        line.removeAllAnimations()
    }
}
