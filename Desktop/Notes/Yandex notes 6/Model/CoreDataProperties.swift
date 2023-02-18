//
//  CoreDataProperties.swift
//  Yandex notes 6
//
//  Created by дэвид Кихтенко on 12.12.2022.
//

import Foundation
import CoreData


extension Text {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Text> {
        return NSFetchRequest<Text>(entityName: "Text")
    }

    @NSManaged public var text: String?

}

extension Text : Identifiable {

}
