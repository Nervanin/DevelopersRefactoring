//
//  ParseMethod.swift
//  Devref
//
//  Created by Konstantin on 30.07.2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import Foundation


class ParseDataSourse {
    
    class func allModels() -> [Models] {
        
        var allModels = [Models]()
        allModels.append(contentsOf: ParseDataSourse.getPatterns())
        allModels.append(contentsOf: ParseDataSourse.getDataStructure())
        allModels.append(contentsOf: ParseDataSourse.getAlgorithms())
        return allModels
    }
    
    class func getPatterns() -> [Patterns] {
        let path = Bundle.main.path(forResource: "Models", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        guard
            let data = try? Data(contentsOf: url),
            let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                return []
        }
        var sections = [Int: Patterns]()
        let headPatternObject = json?["patterns"] as? [String: Any]
        
        let jsonSection = headPatternObject!["sections"] as? [[String: Any]]
        for item in jsonSection! {
            
            let id = item["id"] as? Int
            let title = item["title"] as? String
            let instancePatternSection = Patterns(id: id!, title: title!)
            sections[instancePatternSection.id!] = instancePatternSection
        }
        let items = headPatternObject!["items"] as? [[String: Any]]
        for item in items! {
            guard
                let id = item["id"] as? Int,
                let title = item["title"] as? String,
                let section = item["section"] as? Int else {
                    continue
            }
            let instanceItems = PatternsModel(id: id, title: title, section: section)
            sections[section]?.patternsModels?.append(instanceItems)
            guard
                let info = item["info"] as? [[String: Any]] else {
                    continue
            }
            for item in info {
                if let image = item["image"] as? String {
                    let instanceImage = IMG(image: image)
                    sections[section]?.patternsModels?[id].informationArray?.append(instanceImage)
                } else if let text = item["text"] as? String {
                    let instanceText = TXT(text: text)
                    sections[section]?.patternsModels?[id].informationArray?.append(instanceText)
                }
            }
        }
        
        return sections.values.sorted{($0.id! < $1.id!)}
        
    }
    
    class func getDataStructure() -> [DataStructures] {
        let path = Bundle.main.path(forResource: "Models", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        guard
            let data = try? Data(contentsOf: url),
            let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                return []
        }
        var dataStructuresArray = [Int: DataStructures]()
        let dataStructuresJson = json?["data_structures"] as? [String: Any]
        guard
            let items = dataStructuresJson?["items"] as? [[String: Any]] else {
                return []
        }
        for item in items {
            guard
                let id = item["id"] as? Int,
                let title = item["title"] as? String else {
                    continue
            }
            let instanceId = DataStructures(id: id, title: title)
            dataStructuresArray[instanceId.id!] = instanceId
            let instanceModel = DataStructuresModel(id: id, title: title)
            dataStructuresArray[id]?.dataStructuresModel?.append(instanceModel)
            let info = item["info"] as? [[String: Any]]
            for infoItem in info! {
                guard
                    let image = infoItem["image"] as? String else {
                        continue
                }
                let instanceImg = IMG(image: image)
                dataStructuresArray[id]?.informationArray?.append(instanceImg)
            }
            for textItem in info! {
                guard
                    let text = textItem["text"] as? String else {
                        continue
                }
                let instaceTxt = TXT(text: text)
                dataStructuresArray[id]?.informationArray?.append(instaceTxt)
            }
        }
        return dataStructuresArray.values.sorted{($0.id! < $1.id!)}
    }
    
    class func getAlgorithms() -> [Algorithms] {
        let path = Bundle.main.path(forResource: "Models", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        guard
            let data = try? Data(contentsOf: url),
            let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                return []
        }
        var algorithmsArray = [Int: Algorithms]()
        let dataStructuresJson = json?["algorithms"] as? [String: Any]
        guard
            let items = dataStructuresJson?["items"] as? [[String: Any]] else {
                return []
        }
        for item in items {
            guard
                let id = item["id"] as? Int,
                let title = item["title"] as? String else {
                    continue
            }
            let instanceId = Algorithms(id: id, title: title)
            algorithmsArray[instanceId.id!] = instanceId
            let instanceModel = AlgorithmsModel(id: id, title: title)
            algorithmsArray[id]?.algorithmsModel?.append(instanceModel)
            let info = item["info"] as? [[String: Any]]
            for infoItem in info! {
                guard
                    let image = infoItem["image"] as? String else {
                        continue
                }
                let instanceImg = IMG(image: image)
                algorithmsArray[id]?.informationArray?.append(instanceImg)
            }
            for textItem in info! {
                guard
                    let text = textItem["text"] as? String else {
                        continue
                }
                let instaceTxt = TXT(text: text)
                algorithmsArray[id]?.informationArray?.append(instaceTxt)
            }
            
        }
        
        return algorithmsArray.values.sorted{($0.id! < $1.id!)}
    }
}













