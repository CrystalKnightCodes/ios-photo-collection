//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Christy Hicks on 10/10/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

private let reuseIdentifier = "photoCell"

class PhotosCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
            setTheme()
    }
    
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
            setTheme()
            collectionView?.reloadData()
      }
    
    
    func setTheme() {
        guard let themeHelper = themeHelper.themePreference else { return }
        
         if themeHelper == "Dark" {
            collectionView.backgroundColor = .darkGray
         } else {
            collectionView.backgroundColor = .purple
         }
    }

    // MARK: - Data Source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
// FIXME: Photos do not save properly, error "Failed to find cell"
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { fatalError("Failed to find cell") }
        
        let photo = photoController.photos[indexPath.item]

        cell.imageNameLabel.text = photo.title
        cell.imageView.image = UIImage(data: photo.imageData)
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showPhotoDetailSegue":
            guard let showPhotoVC = segue.destination as? PhotoDetailViewController,
                let cell = sender as? PhotosCollectionViewCell,
                let indexPath = collectionView.indexPath(for: cell) else { fatalError() }
            showPhotoVC.themeHelper = themeHelper
            showPhotoVC.photoController = photoController
            showPhotoVC.photo = photoController.photos[indexPath.item]
        case "addPhotoDetailSegue":
                   guard let createPhotoVC = segue.destination as? PhotoDetailViewController else { return }
                   createPhotoVC.themeHelper = themeHelper
                   createPhotoVC.photoController = photoController
        case "selectThemeSegue":
            guard let selectThemeVC = segue.destination as? ThemeSelectionViewController else { return }
            selectThemeVC.themeHelper = themeHelper
        default:
            fatalError("Did not find a segue")
        }
    }
}
