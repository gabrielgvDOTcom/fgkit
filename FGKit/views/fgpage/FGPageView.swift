//
//  FGPageView.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/27/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

open class FGPageView: UIViewController {

    // MARK: - VARs -
    private var pages: [FGPageEntity] = []

    // MARK: - IBOutlet -
    @IBOutlet private weak var headerCollection: UICollectionView!
    @IBOutlet private weak var pageCollection: UICollectionView!

    // MARK: - Init -
    public init() {
        super.init(nibName: "FGPage", bundle: Bundle(for: type(of: self)))
        loadViewIfNeeded()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle -
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        headerCollection.register(
            UINib(nibName: "FGPageHeader", bundle: Bundle(for: type(of: self))),
            forCellWithReuseIdentifier: "FGPageHeader"
        )
        pageCollection.register(
            UINib(nibName: "FGPageCell", bundle: Bundle(for: type(of: self))),
            forCellWithReuseIdentifier: "FGPageCell"
        )
    }
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Random -
    public func addPages(pages: [FGPageEntity]) -> UIView {
        self.pages = pages
        headerCollection.reloadData()
        pageCollection.reloadData()
        return self.view
    }

    // MARK: - deinit -
    deinit {
        debugPrint(String(describing: self), "deinit")
        view = nil
        pages.removeAll()
    }
}
extension FGPageView: UIScrollViewDelegate {

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
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

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == headerCollection.tag {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FGPageHeader", for: indexPath) as! FGPageHeader
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FGPageCell", for: indexPath) as! FGPageCell
        cell.addView(view: pages[indexPath.row].view)
        return cell
    }
}
extension FGPageView: UICollectionViewDelegate {

    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == headerCollection.tag {
            var divisor: CGFloat = 2.5
            switch pages.count {
            case 1: divisor = 1
            case 2: divisor = 2
            default: break
            }
            return CGSize(width: collectionView.bounds.width / divisor, height: headerCollection.frame.size.height)
        }
        return pageCollection.frame.size
    }
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == headerCollection.tag {
            var space: CGFloat = UIScreen.main.bounds.width / 4.0
            switch pages.count {
            case 1, 2: space = 0
            default: break
            }
            return UIEdgeInsets(top: 0, left: space, bottom: space, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
