//
//  View.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

class View: CodeView {

    struct Constants {

        static let tabBarIndicatorViewHeight: CGFloat = 7
        static let tabCellIdentifier = "tabCollectionViewCell"
        static let tabContentCellIdentifier = "tabContentCellIdentifier"
    }

    var hierarchyNotReady = true
    var tabsViewModel: TabsViewModel
    var tabsContentViewModel: TabsContentViewModel
    var indicatorLeadingAnchor: NSLayoutConstraint?
    var tabsCollectionViewHeightAnchor: NSLayoutConstraint?
    var indicatorWidth: CGFloat?
    var currentIndexPath = IndexPath(item: 0, section: 0)
    let tabsCollectionViewHeightMultiplier: CGFloat

    lazy var tabsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    lazy var tabIndicatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var tabsContentCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    init(viewModel: ViewModel, tabsViewRelationFactor: CGFloat) {
        self.tabsViewModel = (viewModel as TabsViewModelType).sectionsViewModel
        self.tabsContentViewModel = (viewModel as TabsContentViewModelType).contentViewModel
        self.tabsCollectionViewHeightMultiplier = tabsViewRelationFactor
        super.init(frame: .zero)
        setupCollectionViews()
        setupTabsCollectionViewStyle()
    }

    private func setupCollectionViews() {
        tabsCollectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: Constants.tabCellIdentifier)
        tabsContentCollectionView.register(TabContentColletionViewCell.self, forCellWithReuseIdentifier: Constants.tabContentCellIdentifier)
        tabsCollectionView.delegate = tabsViewModel
        tabsCollectionView.dataSource = tabsViewModel
        tabsContentCollectionView.delegate = tabsContentViewModel
        tabsContentCollectionView.dataSource = tabsContentViewModel
    }

    private func setupTabsCollectionViewStyle() {
        tabsCollectionView.backgroundColor = tabsViewModel.viewColors.sectionsBarBackgroundColor
        tabIndicatorView.backgroundColor = tabsViewModel.viewColors.indicatorColor
    }

    override func didMoveToWindow() {
        guard hierarchyNotReady else {
            return
        }
        constructHierarchy()
        activateTabsCollectionViewConstraints()
        activateTabsContentCollectionViewConstraints()
        bind()
        hierarchyNotReady = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        activateTabIndictatorViewConstraints()
    }

}
