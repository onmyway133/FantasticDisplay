//
//  Options.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 09/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public struct Options {
    public var contentView: UIView = UIView()
    public var animator: () -> UIViewPropertyAnimator = AnimatorFactory.simple
    public var contrain: (UIView, UIView) -> Void = ConstrainFactory.center

    public init() {}
}
