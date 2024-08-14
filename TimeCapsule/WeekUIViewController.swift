//
//  MonthUIViewController.swift
//  TimeCapsule
//
//  Created by Andrew Johnson on 3/20/24.
//

import UIKit

class WeekUIViewController: UIViewController {

    
    
    @IBOutlet weak var weekUIImageView: UIImageView!
    @IBOutlet weak var weekCameraButton: UIButton!
    @IBOutlet weak var weekLockButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground(imageName: "monthBG", contentMode: .scaleAspectFit)
        // Do any additional setup after loading the view.
        
        
        
        // Set the border width
        weekUIImageView.layer.borderWidth = 1.2
        
        // Set the border color
        weekUIImageView.layer.borderColor = UIColor.black.cgColor
        
        // Optional: Set the corner radius
        weekUIImageView.layer.cornerRadius = 10
        
        // Optional: If you use cornerRadius, you might want to clip the image
        weekUIImageView.clipsToBounds = true
        
        weekCameraButton.layer.borderWidth = 1.2
        weekCameraButton.layer.borderColor = UIColor.black.cgColor
        weekCameraButton.layer.cornerRadius = 10
        
        weekLockButton.layer.borderWidth = 1.2
        weekLockButton.layer.borderColor = UIColor.black.cgColor
        weekLockButton.layer.cornerRadius = 10
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
