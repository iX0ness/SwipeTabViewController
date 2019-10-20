//
//  TabContentCollectionViewCell.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

class TabContentColletionViewCell: UICollectionViewCell {

    var hostedView: UIView? {
        didSet {
            guard let hostedView = hostedView else {
                return
            }

            hostedView.frame = contentView.bounds
            contentView.addSubview(hostedView)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        if hostedView?.superview == contentView {
            hostedView?.removeFromSuperview()
        } else {
            print("hostedView is no longer attached to this cell")
        }
        hostedView = nil
    }
}

