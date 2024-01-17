//
//  HabitLocalImpl.swift
//  HabitTracker
//
//  Created by Víctor Alba on 13/11/23.
//
// Esta implementación de UserDefaults sí me la he copiado del curso, concretamente del proyecto de Rick Y Morty de Javi Torné

import Foundation

struct HabitLocalImpl: HabitLocalService {
    
    private let habitsUDKey = "habits"
    
    func save (habits: [Habit]) throws {
        let data = try JSONEncoder().encode(habits)
        UserDefaults.standard.set(data, forKey: habitsUDKey)
    }
    
    func getHabits() throws -> [Habit] {
        guard let data = UserDefaults.standard.data(forKey: habitsUDKey) else {
            return []
        }
        return try JSONDecoder().decode([Habit].self, from: data)
    }
    
    // TODO: rehacer esta funcion, porque debería hacer throws
    func localSaving (habit: Habit) {
        do {
            var habits = try getHabits()
            habits.append(habit)
            try save(habits: habits)
        } catch {
            print("Ha petao")
        }
        
    }
}
