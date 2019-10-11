//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Christy Hicks on 10/10/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import Foundation

class PhotoController {
    //MARK: Properties
    var photos: [Photo] = []
    
    func addPhoto(data: Data, title: String) {
        let photoAdded = Photo(imageData: data, title: title)
        photos.append(photoAdded)
    }
    
    func updatePhoto(photoToUpdate: Photo, newData: Data, newTitle: String) {
       //this is creating an index path. An index path is the spot that is chosen. first index is grabbing the first index that the user tries to use, then changes the properties accordingly.
        guard let index = photos.firstIndex(of: photoToUpdate) else { return }
        
        photos[index].title = newTitle
        photos[index].imageData = newData
        
        
    }
}
