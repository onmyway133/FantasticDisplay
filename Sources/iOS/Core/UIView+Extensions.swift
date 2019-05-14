//
//  UIView+Extensions.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 09/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

extension UIView {
    func pinEdgesToSuperview(insets: UIEdgeInsets = .zero) {
        guard let superview = self.superview else {
            return
        }

        pinEdges(view: superview, insets: insets)
    }

    func pinCenterToSuperview() {
        guard let superview = self.superview else {
            return
        }

        pinCenter(view: superview)
    }

    func pinEdges(view: UIView, insets: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: insets.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom)
        ])
    }

    func pinCenter(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

extension UIView {
    func withoutImplicitAnimation(_ closure: () -> Void) {
        CATransaction.begin()
        CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
        closure()
        CATransaction.commit()
    }
}
