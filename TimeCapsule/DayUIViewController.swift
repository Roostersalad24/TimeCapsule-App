//
//  DayUIViewController.swift
//  TimeCapsule
//
//  Created by Andrew Johnson on 3/20/24.
//

import UIKit
import UserNotifications
import BackgroundTasks

class DayUIViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let buttonPressTimeKey = "ButtonPressTime"
    
    @IBOutlet weak var dayUIImageView: UIImageView!
    @IBOutlet weak var dayCameraButton: UIButton!
    @IBOutlet weak var dayLockButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        updateImageView()
        
        updateButtonImage()
        configureButtonStates()
        dayLockButton.isEnabled = false
        dayUIImageView.image = loadImage(withFilename: "uploadedImage1.jpg")
        
        NotificationCenter.default.addObserver(forName: .removeBlurEffectNotification, object: nil, queue: .main) { [weak self] _ in
            self?.removeBlurEffect()
        }
        
       
        

        
        
        // Set the border width
        dayUIImageView.layer.borderWidth = 1.2
        
        // Set the border color
        dayUIImageView.layer.borderColor = UIColor.black.cgColor
        
        // Optional: Set the corner radius
        dayUIImageView.layer.cornerRadius = 10
        
        // Optional: If you use cornerRadius, you might want to clip the image
        dayUIImageView.clipsToBounds = true
        
        dayLockButton.layer.cornerRadius = 10
        dayLockButton.layer.borderWidth = 1.2
        dayLockButton.layer.borderColor = UIColor.black.cgColor
        
        dayCameraButton.layer.cornerRadius = 10
        dayCameraButton.layer.borderColor = UIColor.black.cgColor
        dayCameraButton.layer.borderWidth = 1.2
        
        view.addBackground(imageName: "weekBGG.svg", contentMode: .scaleAspectFit)
        // Do any additional setup after loading the view.
        
        
    }
    
    
    
    
    func configureButtonStates() {
        let isButtonDayCameraEnabled = UserDefaults.standard.bool(forKey: "isButtonDayCameraEnabled", defaultValue: true)
        dayCameraButton.isEnabled = isButtonDayCameraEnabled
    }
    
    
    
    // Save the blur state for a specific image view
    func saveBlurState(isBlurred: Bool, forIndex index: Int) {
        var blurStates = UserDefaults.standard.array(forKey: "blurStates") as? [Bool] ?? [false, false, false, false]
        if blurStates.indices.contains(index) {
            blurStates[index] = isBlurred
        }
        UserDefaults.standard.set(blurStates, forKey: "blurStates")
    }
    
    // Retrieve the blur state for a specific image view
    func loadBlurState(forIndex index: Int) -> Bool {
        let blurStates = UserDefaults.standard.array(forKey: "blurStates") as? [Bool] ?? [false, false, false, false]
        return blurStates.indices.contains(index) ? blurStates[index] : false
    }
    
    func updateImageView() {
        if loadBlurState(forIndex: 0) {
            applyBlurEffect()
        } else {
            removeBlurEffect()
        }
    }
    
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = dayUIImageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dayUIImageView.addSubview(blurEffectView)
    }

    func removeBlurEffect() {
        dayUIImageView.subviews.filter { $0 is UIVisualEffectView }.forEach { $0.removeFromSuperview() }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }


    func scheduleNotification() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = "Notification Title"
                content.body = "It's time to remove the blur effect."
                content.sound = UNNotificationSound.default

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: "removeBlurEffect", content: content, trigger: trigger)
                
                notificationCenter.add(request) { error in
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                    }
                }
            }
        }
    }

    
    
    
    func saveImage(_ image: UIImage, withFilename filename: String) {
        if let data = image.jpegData(compressionQuality: 1.0) { // Adjust compression quality as needed
            do {
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let filePath = documentsDirectory.appendingPathComponent(filename)
                try data.write(to: filePath)
                print("Image saved to \(filePath)")
            } catch {
                print("Error saving image: \(error)")
            }
        }
    }
    
    func loadImage(withFilename filename: String) -> UIImage? {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = documentsDirectory.appendingPathComponent(filename)
        return UIImage(contentsOfFile: filePath.path)
    }
    
    
    @IBAction func dayCameraButtonTapped(_ sender: UIButton) {
        
        UserDefaults.standard.set(Date(), forKey: buttonPressTimeKey)
        
        dayLockButton.isEnabled = true
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        dayUIImageView.image = selectedImage
        saveImage(selectedImage, withFilename: "uploadedImage1.jpg")
        dismiss(animated: true, completion: nil)
        
        
    
        
    }
    
    func updateButtonImage() {
        let isLock = UserDefaults.standard.bool(forKey: "isLock")
        let imageName = isLock ? "lock.fill" : "lock"
        dayLockButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    
    
   
    
    @IBAction func dayLockButtonTapped(_ sender: UIButton) {
       
        
        
        dayCameraButton.isEnabled = false
        UserDefaults.standard.set(false, forKey: "isButtonDayCameraEnabled")
        let currentBlurState = loadBlurState(forIndex: 0)
        saveBlurState(isBlurred: !currentBlurState, forIndex: 0)
        updateImageView()
        dayLockButton.setImage(UIImage(systemName: "lock.fill"), for: .normal)
        sender.isEnabled = false
        UserDefaults.standard.set(false, forKey: "isButtonEnabled")
        
        let isLock = UserDefaults.standard.bool(forKey: "isLock")
                UserDefaults.standard.set(!isLock, forKey: "isLock")
                updateButtonImage()
       
        
        
        UserDefaults.standard.set(Date(), forKey: "lastPressedTime")
         scheduleNotification()
     }
    
    
        
        
       
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    


extension UserDefaults {
    func bool(forKey key: String, defaultValue: Bool) -> Bool {
        if object(forKey: key) == nil {
            return defaultValue
        }
        return bool(forKey: key)
    }
}

extension Notification.Name {
    static let removeBlurEffectNotification = Notification.Name("removeBlurEffectNotification")
}
