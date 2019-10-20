//
//  TabsViewModel.swift
//  SwipeTabViewController
//
//  Created by Levchuk Misha on 20/10/2019.
//  Copyright © 2019 Levchuk Misha. All rights reserved.
//

import UIKit

final class TabsViewModel: NSObject {

    let titles: [String]
    private let cellIdentifier = "tabCollectionViewCell"

    var selectionCompletion: ((_ indexPath: IndexPath) -> Void)?
    let viewColors: TabsViewColors
    private let textColors: TabsTextColors

    var count: Int {
        return titles.count
    }

    init(titles: [String], viewColors: TabsViewColors, viewTextColors: TabsTextColors) {
        self.titles = titles
        self.viewColors = viewColors
        self.textColors = viewTextColors
        super.init()

    }

    private func getItem(at indexPath: IndexPath) -> String {
        return titles[indexPath.item]
    }
}

extension TabsViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionCompletion?(indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
    }
}

extension TabsViewModel: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TabCollectionViewCell
        cell.titleLabel.text = getItem(at: indexPath)
        cell.textColor = textColors.textColor
        cell.highlightedTextColor = textColors.highlightedTextColor
        return cell
    }

}
