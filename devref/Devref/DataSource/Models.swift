//
//  Models.swift
//  Devref
//
//  Created by Konstantin on 02/11/2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import Foundation

class Models {
    
}

class TextImage {
    var txt: String?
    var img: String?
    init(img: String?) {
        self.img = img
    }
    init(txt: String?) {
        self.txt = txt
    }
}

class TXT: ImageAndText {
    var text: String?
 
    init(text: String?) {
        self.text = text
    }
}

class IMG: ImageAndText {
    var image: String?
    //var id: Int?
    
    init(image: String?) {
        //self.id = id
        self.image = image
    }
}

class ImageAndText {
    
}

class Algorithms: Models {
    var id: Int?
    var title: String?
    var algorithmsModel: [AlgorithmsModel]? = [AlgorithmsModel]()
    var informationArray: [ImageAndText]? = [ImageAndText]()

    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
    
}

class AlgorithmsModel {
    var id: Int?
    var title: String?
    
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
}

class DataStructures: Models {
    var id: Int?
    var title: String?
    var dataStructuresModel: [DataStructuresModel]? = [DataStructuresModel]()
    var informationArray: [ImageAndText]? = [ImageAndText]()

    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
    
}
class DataStructuresModel {
    var id: Int?
    var title: String?

    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
}

class Patterns: Models {
    var id: Int?
    var title: String?
    var patternsModels: [PatternsModel]? = [PatternsModel]()
 
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
}

class PatternsModel {
    var id: Int
    var title: String
    var section: Int
   var informationArray: [ImageAndText]? = [ImageAndText]()
    init(id: Int, title: String, section: Int) {
        self.id = id
        self.title = title
        self.section = section
    }
}






















