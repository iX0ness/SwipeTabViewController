//
//  TabCollectionViewCell.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

class TabCollectionViewCell: UICollectionViewCell {
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? highlightedTextColor : textColor
        }
    }

    var textColor: UIColor! {
        didSet {
            titleLabel.textColor = textColor
        }
    }

    var highlightedTextColor: UIColor!

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToWindow() {
        activateTitleLabelConstraints()
    }

    func activateTitleLabelConstraints() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}
