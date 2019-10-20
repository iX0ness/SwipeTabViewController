//
//  SwipeTabViewController.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

typealias ViewControllerPresentable = UIViewController & Presentable
typealias TabsViewColors = (sectionsBarBackgroundColor: UIColor, indicatorColor: UIColor)
typealias TabsTextColors = (textColor: UIColor, highlightedTextColor: UIColor)


protocol Presentable {
    var presentableTitle: String {get}
}

class SwipeTabViewController: CodeViewController {

    private var viewModel: ViewModel
    private var tabView: View

    private init(array: [ViewControllerPresentable],
                 tabsViewRelationFactor: CGFloat,
                 tabsViewColors: TabsViewColors,
                 tabsTextColors: TabsTextColors) {

        viewModel = ViewModel(viewControllers: array, tabsViewColors: tabsViewColors, tabsTextColors: tabsTextColors)
        tabView  = View(viewModel: viewModel, tabsViewRelationFactor: tabsViewRelationFactor)
        tabView.translatesAutoresizingMaskIntoConstraints = false
        super.init()
    }

    override func loadView() {
        view = tabView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.contentViewModel.viewControllers.forEach { viewController in
            addChild(viewController)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        tabView.preSelectCell()
    }

    private func addChildContentViewController(_ childViewController: UIViewController) {
        addChild(childViewController)
        childViewController.didMove(toParent: self)
    }

}

extension SwipeTabViewController {

    class Builder {
        private var viewControllers: [ViewControllerPresentable]
        private var tabsViewRelationFactor: CGFloat
        private var sectionsBarBackgroundColor: UIColor = .white
        private var textColor: UIColor                  = .black
        private var highlightedTextColor: UIColor       = .black
        private var indicatorColor: UIColor             = .black

        init(viewControllers: [ViewControllerPresentable], tabsViewRelationFactor: CGFloat = 0.1) {
            self.viewControllers                        = viewControllers
            self.tabsViewRelationFactor = tabsViewRelationFactor
        }


        @discardableResult
        func set(sectionsBarBackgroundColor: UIColor) -> Builder {
            self.sectionsBarBackgroundColor = sectionsBarBackgroundColor
            return self
        }

        @discardableResult
        func set(textColor: UIColor) -> Builder {
            self.textColor = textColor
            return self
        }

        @discardableResult
        func set(highlightedTextColor: UIColor) -> Builder {
            self.highlightedTextColor = highlightedTextColor
            return self
        }

        @discardableResult
        func set(indicatorColor: UIColor) -> Builder {
            self.indicatorColor = indicatorColor
            return self
        }

        func build() -> SwipeTabViewController {
            return SwipeTabViewController(array: viewControllers,
                                          tabsViewRelationFactor: tabsViewRelationFactor,
                                          tabsViewColors: (sectionsBarBackgroundColor: sectionsBarBackgroundColor, indicatorColor: indicatorColor),
                                          tabsTextColors: (textColor: textColor, highlightedTextColor: highlightedTextColor))
        }
    }
}
