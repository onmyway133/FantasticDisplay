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
        contentView.pinEdgesToSuperview()
        configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func configure() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
}
