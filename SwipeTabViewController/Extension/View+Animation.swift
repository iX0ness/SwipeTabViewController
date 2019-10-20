//
//  View+Extension.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

extension View {

    func bind() {
        selectSection()
        scrollSectionContent()

    }

    private func selectSection() {
        tabsViewModel.selectionCompletion = {[weak self] indexPath in
            self?.animateIndicator(to: indexPath)
            self?.scrollTabsCollectionViewToItem(at: indexPath)
            self?.scrollTabsContentCollectionView(to: indexPath)
            self?.currentIndexPath = indexPath
        }
    }

    private func scrollSectionContent() {
        tabsContentViewModel.scrollCompletion = {[weak self] indexPath in

            self?.tabsCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
            self?.scrollTabsCollectionViewToItem(at: indexPath)
            self?.animateIndicator(to: indexPath)
            self?.currentIndexPath = indexPath
        }
    }

    private func animateIndicator(to indexPath: IndexPath) {
        let value = CGFloat(indexPath.item) * tabsCollectionView.contentSize.width / CGFloat(tabsViewModel.count)
        indicatorLeadingAnchor?.constant = value + indicatorWidth!
        UIView.animate(withDuration: 0.75,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.layoutIfNeeded()
        },
                       completion: nil)

    }

    private func scrollTabsCollectionViewToItem(at indexPath: IndexPath) {
        guard indexPath.item < tabsViewModel.titles.count - 1, indexPath.item > 0 else {return}

        if indexPath.item > currentIndexPath.item {
            let indexPathToScroll = IndexPath(item: indexPath.item + 1, section: 0)
            tabsCollectionView.scrollToItem(at: indexPathToScroll, at: [], animated: true)
        } else {
            let indexPathToScroll = IndexPath(item: indexPath.item - 1, section: 0)
            tabsCollectionView.scrollToItem(at: indexPathToScroll, at: [], animated: true)
        }
    }

    private func scrollTabsContentCollectionView(to indexPath: IndexPath) {
        tabsContentCollectionView.scrollToItem(at: indexPath, at: [], animated: true)
    }

}
