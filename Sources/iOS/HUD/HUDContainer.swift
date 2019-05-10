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
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func setup() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
}

public class ProgressView: UIView {
    public var lineCount: Int = 10
    public var duration: TimeInterval = 1.0
    public var lineSize: CGSize = CGSize(width: 6, height: 20)
    public var lineColor: UIColor = UIColor.white
    private var replicatorLayer: CAReplicatorLayer?

    public override func layoutSubviews() {
        super.layoutSubviews()

        guard replicatorLayer == nil else {
            return
        }

        setup()
    }

    func setup() {
        let rect = CGRect(x: 0, y: 0, width: 150, height: 150)

        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.position = CGPoint(x: rect.width/2, y: rect.height / 2)
        replicatorLayer.frame.size = rect.size
        replicatorLayer.instanceCount = lineCount

        let angle = CGFloat.pi * 2 / CGFloat(lineCount)
        let rotation = CATransform3DMakeRotation(angle, 0, 0, 1.0)
        replicatorLayer.instanceTransform = rotation

        let line = CALayer()
        line.backgroundColor = lineColor.cgColor
        line.frame.size = lineSize
        line.opacity = 0.0
        line.cornerRadius = lineSize.width / 2
        line.position = CGPoint(x: rect.width/2, y: rect.height/2)

        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 1.0
        fade.toValue = 0.0
        fade.repeatCount = Float.greatestFiniteMagnitude
        fade.timingFunction = CAMediaTimingFunction(name: .linear)
        fade.duration = duration
        line.add(fade, forKey: "ProgressView")

        replicatorLayer.addSublayer(line)
        replicatorLayer.instanceDelay = duration / TimeInterval(lineCount)

        layer.addSublayer(replicatorLayer)
        self.replicatorLayer = replicatorLayer
    }
}

public class SuccessView: UIView {

}
