//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Christy Hicks on 10/10/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
        presentImagePickerController()
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        if photo == nil {
             
                   guard let title = textField.text,
                       let image = imageView.image,
                       let imageData = image.pngData() else { return }
                   
                   if let photo = photo {
                    photoController?.updatePhoto(photoToUpdate: photo, newData: imageData, newTitle: title)
                   } else {
                       photoController?.addPhoto(data: imageData, title: title)
                   }
                   navigationController?.popViewController(animated: true)        }
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo {
            navigationItem.title = "Edit Photo"
            textField.text = photo.title
            imageView.image = UIImage(data: photo.imageData)
        } else {
            navigationItem.title = "Save Photo"
        }
        
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper?.themePreference else { return }

        if themeHelper == "Dark" {
        view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.purple
        }
    }
    
    func presentImagePickerController() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          
          picker.dismiss(animated: true, completion: nil)
          
          guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
          imageView.image = image
      }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
