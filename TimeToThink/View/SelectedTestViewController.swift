//
//  SelectedTestViewController.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/5/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class SelectedTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension SelectedTestViewController {
    @IBAction func backToMainScreen() {
        dismiss(animated: true, completion: nil)
    }
}
