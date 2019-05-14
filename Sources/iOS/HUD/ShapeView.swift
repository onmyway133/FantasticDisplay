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
        shapeLayer.strokeColor = nil
        shapeLayer.backgroundColor = nil
        shapeLayer.lineWidth = 0
    }
}

extension ShapeView {
    func apply(type: ShapeType) {
        let path: String
        switch type {
        case .heart:
            path = """
            M492.719,166.008c0-73.486-59.573-133.056-133.059-133.056c-47.985,0-89.891,25.484-113.302,63.569
            c-23.408-38.085-65.332-63.569-113.316-63.569C59.556,32.952,0,92.522,0,166.008c0,40.009,17.729,75.803,45.671,100.178
            l188.545,188.553c3.22,3.22,7.587,5.029,12.142,5.029c4.555,0,8.922-1.809,12.142-5.029l188.545-188.553
            C474.988,241.811,492.719,206.017,492.719,166.008z
            """
        case .star:
            path = "M8 .2l4.9 15.2L0 6h16L3.1 15.4z"
        case .custom(let string):
            path = string
        }

        let bezierPath = UIBezierPath(svgPath: path)
        let rect = CGRect(origin: .zero, size: layerSize)
        _ = bezierPath.fit(into: rect).moveCenter(to: rect.center)
        shapeLayer.path = bezierPath.cgPath
    }
}

// https://github.com/onmyway133/blog/issues/232

extension CGRect {
    var center: CGPoint {
        return CGPoint( x: self.size.width/2.0,y: self.size.height/2.0)
    }
}

extension CGPoint {
    func vector(to p1:CGPoint) -> CGVector {
        return CGVector(dx: p1.x - x, dy: p1.y - y)
    }
}

extension UIBezierPath {
    func moveCenter(to:CGPoint) -> Self {
        let bounds = self.cgPath.boundingBox
        let center = bounds.center

        let zeroedTo = CGPoint(x: to.x - bounds.origin.x, y: to.y - bounds.origin.y)
        let vector = center.vector(to: zeroedTo)

        _ = offset(to: CGSize(width: vector.dx, height: vector.dy))
        return self
    }

    func offset(to offset:CGSize) -> Self {
        let t = CGAffineTransform(translationX: offset.width, y: offset.height)
        _ = applyCentered(transform: t)
        return self
    }

    func fit(into:CGRect) -> Self {
        let bounds = self.cgPath.boundingBox

        let sw     = into.size.width/bounds.width
        let sh     = into.size.height/bounds.height
        let factor = min(sw, max(sh, 0.0))

        return scale(x: factor, y: factor)
    }

    func scale(x:CGFloat, y:CGFloat) -> Self{
        let scale = CGAffineTransform(scaleX: x, y: y)
        _ = applyCentered(transform: scale)
        return self
    }

    func applyCentered(transform: @autoclosure () -> CGAffineTransform ) -> Self{
        let bound  = self.cgPath.boundingBox
        let center = CGPoint(x: bound.midX, y: bound.midY)
        var xform  = CGAffineTransform.identity

        xform = xform.concatenating(CGAffineTransform(translationX: -center.x, y: -center.y))
        xform = xform.concatenating(transform())
        xform = xform.concatenating(CGAffineTransform(translationX: center.x, y: center.y))
        apply(xform)

        return self
    }
}
