//
//  Models.swift
//  Devref
//
//  Created by Konstantin on 02/11/2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import Foundation

protocol Model {
    // this protocol is parent of classes Pattern, Algorithm, DataStructure
    var title: String? { get set }
    var id: Int? { get set }
}

class H1: MediaContent {
    var content: String
    
    init(content: String) {
        self.content = content
    }
}

class H2: MediaContent {
    var content: String
    
    init(content: String) {
        self.content = content
    }
}

class TXT: MediaContent {
    var content: String
    
    init(content: String) {
        self.content = content
    }
}

class IMG: MediaContent {
    var content: String
   
    init(content: String) {
        self.content = content
    }
}

@objc protocol MediaContent {
    // this protocol is parent of IMG and TXT
    var content: String { get set }
}

class Algorithm: Model {
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

class DataStructure: Model {
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

class Pattern: Model {
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






















