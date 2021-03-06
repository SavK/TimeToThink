//
//  MainViewController.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/5/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return Menu.loadData().count
    }
    
    /// Customizing cell (add round coreners, shadow), load data in cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                         for: indexPath) as? CollectionViewCell {
            
            let menu = Menu.loadData()[indexPath.row]
            CellManager.configure(cell, with: menu)
            
            cell.layer.cornerRadius = 20
            cell.backgroundColor = .white
            
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width:2.0,height: 2.0)
            cell.layer.shadowRadius = 10.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds,
                                                 cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    /// Send index of selected cell to DetailTestViewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCellIndex = indexPath.row
        self.performSegue(withIdentifier: "detailTestViewController", sender: selectedCellIndex)
    }
}

// MARK: - Customizing of cell sizes (relative to screen size)
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sideOfSquare = (collectionView.bounds.width - (3 * 20))/2
        let cellSize = CGSize(width: sideOfSquare, height: sideOfSquare)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return sectionInset
    }
}

// MARK: - Navigation
extension MainViewController {
    
    /// Prepare for send data of selected cell to DetailTestViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detailTestViewController" else { return }
        guard let destinationNC = segue.destination as? UINavigationController
            else { return }
        
        guard let detailTestVC = destinationNC.topViewController as? DetailTestViewController
            else { return }
        
        let selectedCellIndex = sender as! Int
        ///load data of selected test
        detailTestVC.menu = Menu.loadData()[selectedCellIndex]
        detailTestVC.detailTest = DetailTest.loadData()[selectedCellIndex]
        /// index of selected test
        detailTestVC.currentTestIndex = selectedCellIndex
    }
    
    /// Unwind from FinishTestViewController
    @IBAction func unwindToMain(unwindSegue: UIStoryboardSegue){}
}

