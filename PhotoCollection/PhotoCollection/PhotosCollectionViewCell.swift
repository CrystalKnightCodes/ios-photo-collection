//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Christy Hicks on 10/10/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
   // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    
    // MARK: - Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View
    func updateViews() {
      guard let photo = photo else { return }
               
               imageNameLabel.text = photo.title
               imageView.image = UIImage(data: photo.imageData)
           }
    }
    
    
 

