//
//  UIViewController+Extension.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

extension UIViewController {

    func addChild(vc: UIViewController, inContainer container: UIView) {
        container.addSubview(vc.view)

        vc.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: container.topAnchor),
            vc.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            vc.view.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            vc.view.trailingAnchor.constraint(equalTo: container.trailingAnchor)
            ])

        self.addChild(vc)
        vc.didMove(toParent: self)
    }
}
