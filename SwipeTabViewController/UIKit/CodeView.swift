//
//  CodeView.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

class CodeView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable, message: "No Xib")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("You can't load this view from Xib")
    }
}
