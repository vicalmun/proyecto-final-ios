//
//  Habit2.swift
//  HabitTracker
//
//  Created by ChatGPT on 13/11/23.
//

import Foundation
import UIKit

enum Status: String, Codable {
    case active, completed, paused
}

struct Habito: Codable {
    var id: UUID
    var name: String
    var description: String
    var isFavourite: Bool
    var startDate: Date
    var duration: TimeInterval // Duración en segundos vs ¿la seteo con fecha?
    var reminder: Date? // Opcional, depende de si quieres recordatorios
    var process: Double
    var status: Status
    var category: String
    var timesPerDay: Int
    var completedDates: Set<Date>
    
    var endDate: Date {
        if duration == -1 {
            // Si no tiene fecha fin se establece en un año (por si al usuario se le olvida)
            return startDate.addingTimeInterval(3600 * 24 * 365)
        } else {
            return startDate.addingTimeInterval(duration)
        }

    }

    init(name: String, description: String, startDate: Date, duration: TimeInterval, category: String, timesPerDay: Int) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.isFavourite = false
        self.startDate = startDate  // TODO: pongo un date.now?
        self.duration = duration // -> la utilizo para definir la fecha final???
        self.process = 0
        self.status = .active
        self.category = category
        self.timesPerDay = timesPerDay
        // ¿puedo inicializar una variable computada en el constructor? o se computa cuando se crea la clase???
        self.completedDates  = []
        
    }
}
