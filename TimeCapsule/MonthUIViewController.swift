//
//  YearUIViewController.swift
//  TimeCapsule
//
//  Created by Andrew Johnson on 3/20/24.
//

import UIKit

class MonthUIViewController: UIViewController {
    
    
    @IBOutlet weak var monthUIImageView: UIImageView!
    @IBOutlet weak var monthCameraButton: UIButton!
    @IBOutlet weak var MonthLockButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground(imageName: "yearBG.svg", contentMode: .scaleAspectFit)
        // Do any additional setup after loading the view.
        
        // Set the border width
        monthUIImageView.layer.borderWidth = 1.2
        
        // Set the border color
        monthUIImageView.layer.borderColor = UIColor.black.cgColor
        
        // Optional: Set the corner radius
        monthUIImageView.layer.cornerRadius = 10
        
        // Optional: If you use cornerRadius, you might want to clip the image
        monthUIImageView.clipsToBounds = true
        
        MonthLockButton.layer.cornerRadius = 10
        MonthLockButton.layer.borderWidth = 1.2
        MonthLockButton.layer.borderColor = UIColor.black.cgColor
        
        monthCameraButton.layer.cornerRadius = 10
        monthCameraButton.layer.borderWidth = 1.2
        monthCameraButton.layer.borderColor = UIColor.black.cgColor
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
