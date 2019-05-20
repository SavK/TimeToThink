//
//  DetailTestViewController.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/5/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class DetailTestViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var previewTextLabel: UILabel!
    @IBOutlet weak var emojiNC: UIButton!
    
    // MARK: - Model declaration
    var detailTest: DetailTest?
    var menu: Menu?
    
    
    // MARK: - Stored Properties
    var currentTestIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        //  customize navigation controller (change color and remove border)
        self.navigationController?.navigationBar.backgroundColor = self.view.backgroundColor
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // load & customize data
        loadDataIntoScreen()
        changeFontSize(width: view.bounds.width)
    }
}

// MARK: - load image, preview text, title & emoji of selected cell
extension DetailTestViewController {
    func loadDataIntoScreen() {
        guard let imageName = detailTest?.imageName else { return }
        previewImage.image = UIImage(named: imageName)
        previewTextLabel.text = detailTest?.previewText
        self.title = menu?.nameOfTest
        emojiNC.setTitle(menu?.emoji, for: .normal)
    }
}

// MARK: - change font size
extension DetailTestViewController {
    func changeFontSize(width: CGFloat) {
        if width > 320 {
            previewTextLabel.font = UIFont(name: previewTextLabel.font.fontName,
                                           size: 18)
            let font = UIFont(name: "Apple SD Gothic Neo", size: 20)!
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font]
            emojiNC.titleLabel?.font = font
        }
        else {
            previewTextLabel.font = UIFont(name: previewTextLabel.font.fontName,
                                           size: 15)
            let font = UIFont(name: "Apple SD Gothic Neo", size: 15)!
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font]
            emojiNC.titleLabel?.font = font
        }
    }
}

// MARK: - Navigation
extension DetailTestViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "runTestSegue" {
            guard let testVC = segue.destination as? TestViewController
                else { return }
            testVC.currentTestIndex = currentTestIndex
            testVC.menu = menu
        }
    }
    @IBAction func startButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "runTestSegue", sender: nil)
    }
    
    // MARK: - unwind from TestViewController
    @IBAction func unwindToDetailTestVC(segue: UIStoryboardSegue){ }
    
    // MARK: - back to MainViewController
    @IBAction func backToMainScreen() {
        dismiss(animated: true, completion: nil)
    }
}
