//
//  SuccessView.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 10/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public class SuccessView: UIView {
    public let shapeLayer = CAShapeLayer()
    public let animation = CABasicAnimation(keyPath: "strokeEnd")

    public var lineColor: UIColor = UIColor.darkGray

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

        shapeLayer.position = CGPoint(x: bounds.width/2, y: bounds.height/2)
    }

    public func configure() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 20))
        path.addLine(to: CGPoint(x: 30, y: 70))
        path.addLine(to: CGPoint(x: 100, y: 0))

        shapeLayer.path = path.cgPath
        shapeLayer.fillMode = .forwards
        shapeLayer.lineCap = .round
        shapeLayer.lineJoin = .round
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 6

        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        let key = "SuccessView"
        if window != nil {
            shapeLayer.add(animation, forKey: key)
        } else {
            shapeLayer.removeAnimation(forKey: key)
        }
    }
}
