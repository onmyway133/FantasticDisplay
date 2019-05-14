//
//  ShapeView.swift
//  FantasticDisplay
//
//  Created by khoa on 14/05/2019.
//

import UIKit

public class ShapeView: UIView, AnimationAware {
    public let shapeLayer = CAShapeLayer()

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
        shapeLayer.fillColor = lineColor.cgColor
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 2
    }
}

extension ShapeView {
    func apply(type: ShapeType) {
        let path: String
        switch type {
        case .heart:
            path = "M12 21.593c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402m5.726-20.583c-2.203 0-4.446 1.042-5.726 3.238-1.285-2.206-3.522-3.248-5.719-3.248-3.183 0-6.281 2.187-6.281 6.191 0 4.661 5.571 9.429 12 15.809 6.43-6.38 12-11.148 12-15.809 0-4.011-3.095-6.181-6.274-6.181z"
        case .star:
            path = "M15.668 8.626l8.332 1.159-6.065 5.874 1.48 8.341-7.416-3.997-7.416 3.997 1.481-8.341-6.064-5.874 8.331-1.159 3.668-7.626 3.669 7.626zm-6.67.925l-6.818.948 4.963 4.807-1.212 6.825 6.068-3.271 6.069 3.271-1.212-6.826 4.964-4.806-6.819-.948-3.002-6.241-3.001 6.241z"
        case .custom(let string):
            path = string
        }

        let bezierPath = UIBezierPath(svgPath: path)
        let rect = bezierPath.bounds
        let scaleSize = CGSize(width: bezierPath.bounds.width/layerSize.width, height: bezierPath.bounds.height/layerSize.height)
        let scale = min(scaleSize.width, scaleSize.height)

        bezierPath.apply(CGAffineTransform(translationX: -rect.origin.x, y: -rect.origin.y))
        bezierPath.apply(CGAffineTransform(scaleX: 1/scale, y: 1/scale))

        shapeLayer.path = bezierPath.cgPath
    }
}
