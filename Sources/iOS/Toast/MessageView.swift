//
//  MessageView.swift
//  FantasticDisplay
//
//  Created by khoa on 14/05/2019.
//

import UIKit

public class MessageView: UIView, AnimationAware {
    public let label = UILabel()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    public func configure() {
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .center
        label.numberOfLines = 0

        label.pinEdgesToSuperview(insets: UIEdgeInsets(top: 8, left: 8, bottom: -8, right: -8))
    }
}
