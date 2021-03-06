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
    public var pages: [FGPageEntity] = []
    private var selectedPage: Int = 0

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
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pages.removeAll()
    }
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Random -
    public func present(in view: UIView) {
        headerCollection.reloadData()
        pageCollection.reloadData()
        headerCollection.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        FGLayout.fill(view: self.view, container: view)
    }

    // MARK: - deinit -
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension FGPageView: UIScrollViewDelegate {

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == pageCollection.tag {
            let page = Int(round(scrollView.contentOffset.x/pageCollection.frame.size.width))
            if page != selectedPage {
                var position: UICollectionView.ScrollPosition = .centeredHorizontally
                switch pages.count {
                case 1, 2: position = .left
                default: break
                }

                selectedPage = page
                headerCollection.selectItem(at: IndexPath(item: page, section: 0), animated: true, scrollPosition: position)
            }
        }
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
            cell.display(title: pages[indexPath.row].title)
            return cell
        }

        let item = pages[indexPath.row].controller.viewController
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FGPageCell", for: indexPath) as! FGPageCell
        self.addChild(item)
        cell.contentView.addSubview(item.view)
        item.view.translatesAutoresizingMaskIntoConstraints = false
        FGLayout.fill(view: item.view, container: cell.contentView)
        item.didMove(toParent: self)
        item.view.layoutIfNeeded()
        return cell
    }
}
extension FGPageView: UICollectionViewDelegate {

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == headerCollection.tag {
            pageCollection.selectItem(
                at: indexPath,
                animated: true,
                scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally
            )
        }
    }
}
extension FGPageView: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == headerCollection.tag {
            var divisor: CGFloat = 2.5
            switch pages.count {
            case 1: divisor = 1
            case 2: divisor = 2
            default: break
            }
            return CGSize(width: headerCollection.bounds.width / divisor, height: headerCollection.bounds.height)
        }
        return pageCollection.bounds.size
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
