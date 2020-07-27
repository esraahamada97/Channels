//
//  FontViewController.swift
//  Channels
//
//  Created by Esraa Abuseada on 7/27/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class FontViewController: UIViewController {
    @IBOutlet weak private var firstLabel: UILabel!
    
    @IBOutlet weak private var secoundLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(firstLabel.font ?? UIFont())
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
           }
