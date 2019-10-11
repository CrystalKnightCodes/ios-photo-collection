//
//  Photo.swift
//  PhotoCollection
//
//  Created by Christy Hicks on 10/10/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
        self.imageData = imageData
        self.title = title
    }
}
