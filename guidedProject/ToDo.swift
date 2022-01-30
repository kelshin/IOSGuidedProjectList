//
//  ToDo.swift
//  guidedProject
//
//  Created by Kelbin David on 2022-01-28.
//

import Foundation

struct ToDo: Equatable, Codable{
    
    var id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    static let dueDateFormatter: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        dateFormat.timeStyle = DateFormatter.Style.short
        return dateFormat
    }()
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "one", isComplete: false, dueDate: Date(), notes: "do me")
        let todo2 = ToDo(title: "2", isComplete: false, dueDate: Date(), notes: "do me")
        let todo3 = ToDo(title: "3", isComplete: false, dueDate: Date(), notes: "do me")
        let todo4 = ToDo(title: "4", isComplete: false, dueDate: Date(), notes: "do me")
        let todo5 = ToDo(title: "5", isComplete: false, dueDate: Date(), notes: "do me")
        return [todo1, todo2, todo3, todo4, todo5]
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    static func saveToDos(_ todos: [ToDo]){
        let propertlyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertlyListEncoder.encode(todos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
}


