//
//  Factory.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 09/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public struct ConstrainFactory {
    public static let center = { (view: UIView, parentView: UIView) -> Void in
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: parentView.centerYAnchor),
            view.widthAnchor.constraint(equalToConstant: 150),
            view.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

public struct AnimatorFactory {
    public static let simple = { () -> UIViewPropertyAnimator in
        return UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut)
    }
}
