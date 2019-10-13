//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Christy Hicks on 10/10/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions
    // Pick a photo from the library
    @IBAction func addPhoto(_ sender: UIButton) {
        presentImagePickerController()
    }
    
    // Save the photo to the array
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
        guard let title = textField.text,
            let image = imageView.image,
            let imageData = image.pngData() else { return }
                   
                if let photo = photo {
                    photoController?.updatePhoto(photoToUpdate: photo, newData: imageData, newTitle: title)
                } else {
                    photoController?.addPhoto(data: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - View
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
      }
}
