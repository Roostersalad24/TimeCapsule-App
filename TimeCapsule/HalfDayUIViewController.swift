//
//  WeekUIViewController.swift
//  TimeCapsule
//
//  Created by Andrew Johnson on 3/20/24.
//

import UIKit

class HalfDayUIViewController: UIViewController {

    
    
    
    @IBOutlet weak var halfDayUIImageView: UIImageView!
    @IBOutlet weak var halfDayLockButton: UIButton!
    @IBOutlet weak var halfDayCameraButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground(imageName: "halfdayBG.svg", contentMode: .scaleAspectFit)
        // Do any additional setup after loading the view.
        
        // Set the border width
        halfDayUIImageView.layer.borderWidth = 1.2
        
        // Set the border color
        halfDayUIImageView.layer.borderColor = UIColor.black.cgColor
        
        // Optional: Set the corner radius
        halfDayUIImageView.layer.cornerRadius = 10
        
        // Optional: If you use cornerRadius, you might want to clip the image
        halfDayUIImageView.clipsToBounds = true
        
        halfDayLockButton.layer.cornerRadius = 10
        halfDayLockButton.layer.borderWidth = 1.2
        halfDayLockButton.layer.borderColor = UIColor.black.cgColor
        
        halfDayCameraButton.layer.cornerRadius = 10
        halfDayCameraButton.layer.borderWidth = 1.2
        halfDayCameraButton.layer.borderColor = UIColor.black.cgColor
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
