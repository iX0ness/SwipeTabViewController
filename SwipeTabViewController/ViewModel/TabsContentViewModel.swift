//
//  TabsViewModel.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

final class TabsContentViewModel: NSObject {

    let viewControllers: [UIViewController]
    private let cellIdentifier = "tabContentCellIdentifier"
    var scrollCompletion: ((_ indexPath: IndexPath) -> Void)?
    var count: Int {
        return viewControllers.count
    }

    init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        super.init()
    }

    private func getItem(at indexPath: IndexPath) -> UIViewController {
        return viewControllers[indexPath.item]
    }
}

extension TabsContentViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / UIScreen.main.bounds.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        scrollCompletion?(indexPath)
    }
}

extension TabsContentViewModel: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TabContentColletionViewCell
        let viewController = getItem(at: indexPath)
        cell.hostedView = viewController.view
        return cell
    }
}

