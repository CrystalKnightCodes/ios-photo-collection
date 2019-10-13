//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Christy Hicks on 10/10/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import Foundation

class PhotoController {
    //MARK: - Properties
    var photos: [Photo] = []
    
    // MARK: - Methods
    // Add photo to array
    func addPhoto(data: Data, title: String) {
        let photoAdded = Photo(imageData: data, title: title)
        photos.append(photoAdded)
    }
    
    // Edit photo
    func updatePhoto(photoToUpdate: Photo, newData: Data, newTitle: String) {
        guard let index = photos.firstIndex(of: photoToUpdate) else { return }
        
        photos[index].title = newTitle
        photos[index].imageData = newData
    }
}
