//
//  Habit.swift
//  HabitTracker
//
//  Created by Víctor Alba on 9/11/23.
//

import Foundation

struct Habit3: Identifiable, Codable {
    let id: Int
    var name: String
    var description: String
    var isFavourite: Bool
    var isCompletedToday: Bool // -> meeeh mejor la lista de dias completados y añadir quitar la fecha actual
    var isOver: Bool
    var process: Double
    var startDate: Date
    var endDate: Date?
//    var trackData: [Date: Bool]       // Que tal el usar diccionarios en iOS?

    
    init(id: Int, name: String, description: String, isFavourite: Bool  = false, isCompletedToday: Bool = false, isOver: Bool = false, process: Double = 0, startDate: Date, endDate: Date? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.isFavourite = isFavourite
        self.isCompletedToday = isCompletedToday
        self.isOver = isOver
        self.process = process
        self.startDate = Date.now
        self.endDate = endDate
//        var trackData: [Date: Bool]       // Que tal el usar diccionarios en iOS?
    }
    
//    static var example: Habit {
//        .init(id: 1, name: "leer", description: "Leer 15 minutos al día", process: 0.35, startDate: Date(timeIntervalSince1970: 1699637554958))
//    }
    
    
    var period: DateInterval {
        if let endDateNoNull = endDate{
            return DateInterval(start: startDate, end: endDateNoNull)
        } else {
            var infinite = DateInterval()
            infinite.duration = -1
            return infinite
        }
    }
    
    func getFormatedDayDate() -> Int {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: startDate)
        return day
    }
}
