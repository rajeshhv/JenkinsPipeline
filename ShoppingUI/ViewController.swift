//
//  ViewController.swift
//  ShoppingUI
//
//  Created by Indium Software on 17/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var wishlistBtn: UIButton!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var names = ["FURNITURE", "CAKE", "CAR", "BUS", "Jenny", "Lina"]
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var sortBtn: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.registerNib()
    }
    

    func registerNib() {
        let nib = UINib(nibName: CollectionViewCell.nibName, bundle: nil)
        categoryCollectionView?.register(nib, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)

        if let flowLayout = self.categoryCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
}



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier,for: indexPath) as? CollectionViewCell {
                    let name = names[indexPath.row]
                    cell.configureCell(name: name)
                    return cell
                }
                return UICollectionViewCell()
            }
    }

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell: CollectionViewCell = Bundle.main.loadNibNamed(CollectionViewCell.nibName,owner: self, options: nil)?.first as? CollectionViewCell else {
            return CGSize.zero
        }
        cell.configureCell(name: names[indexPath.row])
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: size.width, height: 30)
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
    return cell
}
    
}

