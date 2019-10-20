//
//  ViewModel.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

protocol TabsViewModelType {
    var sectionsViewModel: TabsViewModel {get}
}

protocol TabsContentViewModelType {
    var contentViewModel: TabsContentViewModel {get}
}

final class ViewModel: NSObject {
    struct Constants {
        static let sectionCellIdentifier = "sectionCollectionViewCell"
        static let contentCellIdentifier = "contentCellIdentifier"
    }


    private let viewControllers: [ViewControllerPresentable]
    private let tabsViewColors: TabsViewColors
    private let tabsTextColors: TabsTextColors




    init(viewControllers: [ViewControllerPresentable], tabsViewColors: TabsViewColors, tabsTextColors: TabsTextColors) {
        self.viewControllers = viewControllers
        self.tabsViewColors = tabsViewColors
        self.tabsTextColors = tabsTextColors
    }
}

extension ViewModel: TabsViewModelType {
    var sectionsViewModel: TabsViewModel {
        return TabsViewModel(titles: viewControllers.map{$0.presentableTitle}, viewColors: tabsViewColors, viewTextColors: tabsTextColors)
    }
}

extension ViewModel: TabsContentViewModelType {
    var contentViewModel: TabsContentViewModel {
        return TabsContentViewModel(viewControllers: viewControllers)
    }
}
