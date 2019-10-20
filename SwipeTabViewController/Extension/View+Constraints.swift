//
//  View+Constraints.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

extension View {
    func constructHierarchy() {
        addSubview(tabsContentCollectionView)
        addSubview(tabsCollectionView)
        tabsCollectionView.addSubview(tabIndicatorView)
    }

    func activateTabsContentCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            tabsContentCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tabsContentCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tabsContentCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tabsContentCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1 - tabsCollectionViewHeightMultiplier)
            ])
    }

    func activateTabsCollectionViewConstraints() {
        tabsCollectionViewHeightAnchor = tabsCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: tabsCollectionViewHeightMultiplier)
        tabsCollectionViewHeightAnchor?.isActive = true

        NSLayoutConstraint.activate([
            tabsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tabsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tabsCollectionView.bottomAnchor.constraint(equalTo: tabsContentCollectionView.topAnchor),
            ])
    }

    func activateTabIndictatorViewConstraints() {
        indicatorWidth = self.frame.width / 9
        indicatorLeadingAnchor = tabIndicatorView.leadingAnchor.constraint(equalTo: tabsCollectionView.leadingAnchor, constant: indicatorWidth!)
        indicatorLeadingAnchor?.isActive = true

        NSLayoutConstraint.activate([
            tabIndicatorView.widthAnchor.constraint(equalToConstant: self.frame.width / 9),
            tabIndicatorView.topAnchor.constraint(equalTo: tabsCollectionView.centerYAnchor, constant: 15),
            tabIndicatorView.heightAnchor.constraint(equalToConstant: Constants.tabBarIndicatorViewHeight)
            ])
    }
}
