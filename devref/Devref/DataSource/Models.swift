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
//class AllModels: Models {
//    
//}

//class PatternsArray: AllModels {
//    final var patterns: [Patterns]? = [Patterns]()
//
//    required init?(patterns: [Patterns]? = [Patterns]()) {
//        self.patterns = patterns
//    }
//}
//
//class DataStructuresArray: AllModels {
//    final var dataStructures: [DataStructures]? = [DataStructures]()
//    required init?(dataStructures: [DataStructures]? = [DataStructures]()) {
//        self.dataStructures = dataStructures
//    }
//}
//
//class AlgorithmsArray: AllModels {
//     final var algorithms: [Algorithms]? = [Algorithms]()
//     required init?(algorithms: [Algorithms]? = [Algorithms]()) {
//        self.algorithms = algorithms
//    }
//}

class TextImage {
    var txt: String?
    var img: String?
    init(img: String?) {
        self.img = img
    }
    init(txt: String?) {
        self.txt = txt
    }
//    init(text: String?) {
//        self.text = text
//    }
//    init(image: String?) {
//        self.image = image
//    }
//    var text: String?
//    var image: String?
//    init(image: String?, text: String?) {
//        self.image = image
//        self.text = text
//    }
}

class TXT: ImageAndText {
    var text: String?
   // var id: Int?
    
    init(text: String?) {
       // self.id = id
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
//    var txtAlgorithms: [TXT]? = [TXT]()
//    var imgAlgorithms: [IMG]? = [IMG]()
//    init(imgAlgorithms: [IMG]?) {
//        self.imgAlgorithms = imgAlgorithms
//    }
//    init(txtAlgorithms: [TXT]?) {
//        self.txtAlgorithms = txtAlgorithms
//    }
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
    
}

class AlgorithmsModel {
    var id: Int?
    var title: String?
   // var informationArray: [ImageAndText]? = [ImageAndText]()
    
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
//    var txtDataStructure: [TXT]? = [TXT]()
//    var imgDataStructure: [IMG]? = [IMG]()
//    init(imgDataStructure: [IMG]?) {
//        self.imgDataStructure = imgDataStructure
//    }
//    init(txtDataStructure: [TXT]?) {
//        self.txtDataStructure = txtDataStructure
//    }
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
    
}
class DataStructuresModel {
    var id: Int?
    var title: String?
    //var informationArray: [ImageAndText]? = [ImageAndText]()
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
}

class Patterns: Models {
    var id: Int?
    var title: String?
    var patternsModels: [PatternsModel]? = [PatternsModel]()
    //var informationArray: [SomeClass]? = [SomeClass]()
//    var txtPattern: [TXT]? = [TXT]()
//    var imgPattern: [IMG]? = [IMG]()
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




@objc protocol someProtocol {
    @objc optional var text: String { get set }
    @objc optional var image: String { get set }
}





















