//  IconCollectionViewController.swift
//  CollectionViewDemo
//
//  Created by rlogical-dev-21 on 08/02/21.
//

import UIKit

enum Section {
    case all
}

private let reuseIdentifier = "Cell"

class IconCollectionViewController: UICollectionViewController {
    
    
    @IBOutlet var collectionView_View: UICollectionView!
    
    lazy var dataSource = configureDataSource()
    
    
    private var iconSet: [Icon] = [ Icon(name: "candle", price: 3.99, isFeatured: false),
                                    Icon(name: "cat", price: 2.99, isFeatured: true),
                                    Icon(name: "dribbble", price: 1.99, isFeatured: false),
                                    Icon(name: "ghost", price: 4.99, isFeatured: false),
                                    Icon(name: "hat", price: 2.99, isFeatured: false),
                                    Icon(name: "owl", price: 5.99, isFeatured: true),
                                    Icon(name: "pot", price: 1.99, isFeatured: false),
                                    Icon(name: "pumkin", price: 0.99, isFeatured: false),
                                    Icon(name: "rip", price: 7.99, isFeatured: false),
                                    Icon(name: "skull", price: 8.99, isFeatured: false),
                                    Icon(name: "sky", price: 0.99, isFeatured: false),
                                    Icon(name: "toxic", price: 2.99, isFeatured: false),
                                    Icon(name: "ic_book", price: 2.99, isFeatured: false),
                                    Icon(name: "ic_backpack", price: 3.99, isFeatured: false),
                                    Icon(name: "ic_camera", price: 4.99, isFeatured: false),
                                    Icon(name: "ic_coffee", price: 3.99, isFeatured: true),
                                    Icon(name: "ic_glasses", price: 3.99, isFeatured: false),
                                    Icon(name: "ic_ice_cream", price: 4.99, isFeatured: false),
                                    Icon(name: "ic_smoking_pipe", price: 6.99, isFeatured: false),
                                    Icon(name: "ic_vespa", price: 9.99, isFeatured: false)]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the layout and item size
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 100, height: 150)
            layout.estimatedItemSize = .zero
            layout.minimumInteritemSpacing = 10
        }
        collectionView_View.dataSource = dataSource
     }
    
    
    func configureDataSource() -> UICollectionViewDiffableDataSource<Section, Icon> {
        
        let dataSource = UICollectionViewDiffableDataSource<Section, Icon>(collectionView: collectionView_View) { (collectionView, indexPath, icon) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IconCollectionViewCell
            cell.iconImageView.image = UIImage(named: icon.name)
            cell.iconPriceLabel.text = "$\(icon.price)"
            
            return cell
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Icon>()
        snapshot.appendSections([.all])
        snapshot.appendItems(iconSet, toSection: .all)
     
        dataSource.apply(snapshot, animatingDifferences: false)

        
        return dataSource
    }
    
}
