//
//  CodeViewController.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

class CodeViewController: UIViewController {

    // MARK: - Me@objc @objc @objc thods
    public init() {
        super.init(nibName: nil, bundle: nil)
        //        customizeNavigationBar()
    }

    @available(*, unavailable, message: "No XIB")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable, message: "No XIB")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("You can't load this ViewController from Xib. iOS Academy wants DI")
    }
}
