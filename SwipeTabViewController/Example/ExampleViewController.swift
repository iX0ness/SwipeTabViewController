//
//  ExampleViewController.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    let vc1 = Test1ViewController()
    let vc2 = Test2ViewController()
    let vc3 = Test3ViewController()
    let vc4 = Test4ViewController()
    let vc5 = Test5ViewController()
    let vc6 = Test6ViewController()
    var array: [ViewControllerPresentable]!

    var swipeTabViewController: SwipeTabViewController!

    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        array = [vc1, vc2, vc3, vc4, vc5, vc6]
        swipeTabViewController = SwipeTabViewController.Builder(viewControllers: array).build()
        activateConstraints()
        addChild(vc: swipeTabViewController, inContainer: container)

    }

    func activateConstraints() {
        view.addSubview(container)
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            ])
    }

}
