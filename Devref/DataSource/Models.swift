//
//  Models.swift
//  Devref
//
//  Created by Konstantin on 02/11/2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import Foundation

class Models {
    // this class is parent of classes Pattern, Algorithm, DataStructure
}
class TXT: MediaContent {
    var text: String?
    
    init(text: String?) {
        self.text = text
    }
}

class IMG: MediaContent {
    var image: String?
   
    init(image: String?) {
        self.image = image
    }
}

class MediaContent {
    // this class is parent of IMG and TXT
}

class Algorithm: Models {
    var id: Int?
    var title: String?
    var algorithmsSection: [AlgorithmSection]? = [AlgorithmSection]()
    var informationArray: [MediaContent]? = [MediaContent]()
    
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
}

class AlgorithmSection { // this class need for keep section in ParseDataSource
    var id: Int?
    var title: String?
    
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
}

class DataStructure: Models {
    var id: Int?
    var title: String?
    var dataStructuresSection: [DataStructureSection]? = [DataStructureSection]()
    var informationArray: [MediaContent]? = [MediaContent]()
    
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
    
}
class DataStructureSection { // this class need for keep section in ParseDataSource
    var id: Int?
    var title: String?
    
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
}

class Pattern: Models {
    var id: Int?
    var title: String?
    var patternsSection: [PatternSection]? = [PatternSection]()
    
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
}

class PatternSection { // this class need for keep section in ParseDataSource
    var id: Int
    var title: String
    var section: Int
    var informationArray: [MediaContent]? = [MediaContent]()
    init(id: Int, title: String, section: Int) {
        self.id = id
        self.title = title
        self.section = section
    }
}






















