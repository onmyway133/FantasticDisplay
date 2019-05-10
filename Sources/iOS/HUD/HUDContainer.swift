//
//  HUDContainer.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 09/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public class HUDContainer: UIVisualEffectView {
    public init(contentView: UIView) {
        super.init(effect: UIBlurEffect(style: .light))
        self.contentView.addSubview(contentView)
        contentView.pinEdgesToSuperview()
        configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func configure() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
}

public class ProgressView: UIView {
    public var lineCount: Int = 10
    public var duration: TimeInterval = 1.0
    public var lineSize: CGSize = CGSize(width: 6, height: 25)
    public var lineColor: UIColor = UIColor.white

    public let replicatorLayer = CAReplicatorLayer()
    public let animation = CABasicAnimation(keyPath: "opacity")
    public let line = CALayer()

    public override init(frame: CGRect) {
        super.init(frame: .zero)

        replicatorLayer.addSublayer(line)
        layer.addSublayer(replicatorLayer)
        configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func configure() {
        replicatorLayer.instanceCount = lineCount

        let angle = CGFloat.pi * 2 / CGFloat(lineCount)
        let rotation = CATransform3DMakeRotation(angle, 0, 0, 1.0)
        replicatorLayer.instanceTransform = rotation

        line.backgroundColor = lineColor.cgColor
        line.frame.size = lineSize
        line.opacity = 0.0
        line.cornerRadius = lineSize.width / 2

        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.repeatCount = Float.greatestFiniteMagnitude
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = duration

        replicatorLayer.instanceDelay = duration / TimeInterval(lineCount)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        let rect = self.bounds

        replicatorLayer.frame = bounds
        line.position = CGPoint(x: rect.width/2, y: rect.height/2 * 30)
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        let key = "ProgressView"
        if window != nil {
            replicatorLayer.add(animation, forKey: key)
        } else {
            replicatorLayer.removeAnimation(forKey: key)
        }
    }
}

public class SuccessView: UIView {

}
