//
//  DetailTestViewController.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/5/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class DetailTestViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var previewTextLabel: UILabel!
    @IBOutlet weak var emojiNC: UIButton!
    
    var detailTest: DetailTest?
    var menu: Menu?
    
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
        self.title = menu?.nameOfQuestion
        emojiNC.setTitle(menu?.emoji, for: .normal)
    }
}

// MARK: - back to MainViewController
extension DetailTestViewController {
    @IBAction func backToMainScreen() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - unwind from TestViewController
extension DetailTestViewController {
    @IBAction func unwindToDetailTestVC(segue: UIStoryboardSegue){ }
}

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
