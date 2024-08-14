//
//  ViewController.swift
//  TimeCapsule
//
//  Created by Andrew Johnson on 3/20/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var halfDayButton: UIButton!
    @IBOutlet weak var DayButton: UIButton!
    @IBOutlet weak var weekButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        halfDayButton.titleLabel?.shadowColor = .darkText
        halfDayButton.titleLabel?.shadowOffset = CGSize(width: 2.0, height: 2.0)
        DayButton.titleLabel?.shadowColor = .darkText
        DayButton.titleLabel?.shadowOffset = CGSize(width: 2.0, height: 2.0)
        weekButton.titleLabel?.shadowColor = .darkText
        weekButton.titleLabel?.shadowOffset = CGSize(width: 2.0, height: 2.0)
        monthButton.titleLabel?.shadowColor = .darkText
        monthButton.titleLabel?.shadowOffset = CGSize(width: 2.0, height: 2.0)
        // Do any additional setup after loading the view.
        
    }

    @IBAction func unwindToHome(_ sender: UIStoryboardSegue) {}
}

