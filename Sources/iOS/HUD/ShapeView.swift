//
//  ShapeView.swift
//  FantasticDisplay
//
//  Created by khoa on 14/05/2019.
//

import UIKit

public class ShapeView: UIView, AnimationAware {
    public let shapeLayer = CAShapeLayer()
    public let animation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))


    public var layerSize = CGSize(width: 80, height: 60)
    public var lineColor: UIColor = UIColor.darkGray
    public var duration: TimeInterval = 0.25

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

        shapeLayer.frame = CGRect(origin: .zero, size: layerSize)
        shapeLayer.position = layer.position
    }

    public func configure() {
        shapeLayer.lineCap = .round
        shapeLayer.lineJoin = .round
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 6

        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = duration
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()

        shapeLayer.strokeEnd = 0.0
    }

    public func startAnimation() {
        shapeLayer.strokeEnd = 1.0
        shapeLayer.add(animation, forKey: nil)
    }

    public func stopAnimation() {
        shapeLayer.removeAllAnimations()
    }
}

extension ShapeView {
    func apply(type: ShapeType) {
        let path: String
        switch type {
        case .heart:
            path = "M53.4,14.1c10.9-10.2,28.1-9.6,38.3,1.4c9.7,10.4,9.7,26.5,0,36.9L53.2,91c-1.8,1.8-4.6,1.8-6.4,0c0,0,0,0,0,0L8.3,52.4  C-1.9,41.5-1.3,24.4,9.6,14.1c10.4-9.7,26.5-9.7,36.9,0l3.4,3.4C50,17.5,53.4,14.1,53.4,14.1z M85.4,46.1c7.1-7.1,7.1-18.5,0-25.6  c-7.1-7.1-18.5-7.1-25.6,0l-6.6,6.6c-1.8,1.8-4.6,1.8-6.4,0c0,0,0,0,0,0l-6.6-6.6c-7.1-7.1-18.5-7.1-25.6,0s-7.1,18.5,0,25.6  L50,81.4L85.4,46.1z"
        case .bell:
            path = "M83.62549,73.65332a51.85449,51.85449,0,0,1-10.07276-30.5957V40.55273A23.59544,23.59544,0,0,0,57,18.062V12a7,7,0,0,0-14,0v6.062A23.59544,23.59544,0,0,0,26.44727,40.55273v2.50489A51.85742,51.85742,0,0,1,16.37451,73.6543,6.49033,6.49033,0,0,0,21.5957,84h16.455a11.99031,11.99031,0,0,0,23.89868,0h16.455a6.49086,6.49086,0,0,0,5.22119-10.34668ZM47,12a3,3,0,0,1,6,0v5.19769a22.86176,22.86176,0,0,0-6,0Zm3,79a8.007,8.007,0,0,1-7.93054-7H57.93054A8.007,8.007,0,0,1,50,91ZM80.62744,78.63184A2.44642,2.44642,0,0,1,78.4043,80H21.5957a2.49045,2.49045,0,0,1-2.00341-3.96973,55.88367,55.88367,0,0,0,10.855-32.97265V40.55273a19.55273,19.55273,0,0,1,39.10546,0v2.50489a55.8808,55.8808,0,0,0,10.855,32.97168A2.4478,2.4478,0,0,1,80.62744,78.63184Z"
        case .custom(let string):
            path = string
        }

        let bezierPath = UIBezierPath(svgPath: path)
        let rect = bezierPath.bounds
        let scale = CGPoint(x: bezierPath.bounds.width/layerSize.width, y: bezierPath.bounds.height/layerSize.height)

        bezierPath.apply(CGAffineTransform(translationX: -rect.origin.x, y: -rect.origin.y))
        bezierPath.apply(CGAffineTransform(scaleX: 1/scale.x, y: 1/scale.y))

        shapeLayer.path = bezierPath.cgPath
    }
}
