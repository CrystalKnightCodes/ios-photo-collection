//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Christy Hicks on 10/10/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
      guard let photo = photo else { return }
               
               imageNameLabel.text = photo.title
               imageView.image = UIImage(data: photo.imageData)
           }
    }
    
    
 

