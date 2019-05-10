//
//  HUDContainer.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 09/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public class HUDContainer: UIVisualEffectView {
    public struct Options {
        public var contentView: UIView = UIView()

        public init() {}
    }

    public let options: Options

    public init(options: Options) {
        self.options = options
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
        view.alpha = 0.8
        view.backgroundColor = .yellow
        contentView.addSubview(view)
        view.pinEdges(view: contentView)
    }
}

public class ProgressView: UIView {
    public struct Options {
        public var lineCount: Int = 10
        public var wholeDuration: TimeInterval = 1.0

        public init() {}
    }

    public let options: Options

    public init(options: Options) {
        self.options = options
        super.init(frame: .zero)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    var replicatorLayer: CAReplicatorLayer?

    public override func layoutSubviews() {
        super.layoutSubviews()

        guard replicatorLayer == nil else {
            return
        }

        setup()
    }

    func setup() {
        let replicatorLayer = CAReplicatorLayer()

        let line = CALayer()
        line.backgroundColor = UIColor.red.cgColor

        let angle = CGFloat.pi * 2 / CGFloat(options.lineCount)
        let rotation = CATransform3DMakeRotation(angle, 0, 0, 1.0)
        replicatorLayer.instanceCount = options.lineCount
        replicatorLayer.instanceTransform = rotation
        
        replicatorLayer.addSublayer(line)

        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 1.0
        fade.toValue = 0.0
        fade.repeatCount = Float.greatestFiniteMagnitude
        fade.duration = 0.5

        replicatorLayer.instanceDelay = options.wholeDuration / TimeInterval(options.lineCount)
        replicatorLayer.add(fade, forKey: "ProgressView")

        self.replicatorLayer = replicatorLayer
    }
}

public class SuccessView: UIView {

}
