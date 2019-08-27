//
//  FGPageView.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/27/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class FGPageView: UIViewController {

    @IBOutlet private weak var headerCollection: UICollectionView!
    @IBOutlet private weak var pageCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension FGPageView: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        /*if scrollView.tag == pageCollection.tag {
            let page = Int(round(scrollView.contentOffset.x/pageCollection.frame.size.width))
            if page != selectedPage {
                var position: UICollectionView.ScrollPosition = .centeredHorizontally
                switch self.delegate?.numberOfSections(in: self) {
                case 1, 2: position = .left
                default: break
                }
                
                selectedPage = page
                headerCollection.selectItem(at: IndexPath(item: page, section: 0), animated: true, scrollPosition: position)
                self.delegate?.pageView(self, didChangePage: page)
            }
        }*/
    }
}
extension FGPageView: UICollectionViewDataSource {

    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        return cell
    }
}
extension FGPageView: UICollectionViewDelegate {

    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .zero
    }
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
