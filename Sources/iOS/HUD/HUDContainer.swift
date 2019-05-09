//
//  HUDContainer.swift
//  FantasticDisplay-iOS
//
//  Created by khoa on 09/05/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import UIKit

public class HUDContainer: UIVisualEffectView {
    public init() {
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

}

public class SuccessView: UIView {

}
