//
//  FloatView.swift
//  FantasticDisplay
//
//  Created by khoa on 09/05/2019.
//

import UIKit



public class FloatView: UIView {
    public let options: Options

    public init(options: Options) {
        self.options = options
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        addSubview(options.contentView)
        options.contentView.pinEdges(view: self)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func show(on parentView: UIView) {
        parentView.addSubview(self)
        options.contrain(self, parentView)

        let animator = options.animator()
        animator.addAnimations {
            self.layoutIfNeeded()
        }

        animator.startAnimation()
    }

    public func hide() {
        removeFromSuperview()
    }
}

public class ToastContainer: UIView {

}


