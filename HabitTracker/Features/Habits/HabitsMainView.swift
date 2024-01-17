//
//  HabitsMainView.swift
//  HabitTracker
//
//  Created by Víctor Alba on 8/11/23.
//

import SwiftUI

struct HabitsMainView: View {
    
    private let arrayHabitos = [
        Habit(id: 1, name: "leer", description: "15 minutos al día", process: 0.2),
        Habit(id: 2, name: "entrenar", description: "1 al día", process: 1),
        Habit(id: 3, name: "estudiar", description: "2 horas cada día", process: 0.1)
    ]
    
    var body: some View {
        NavigationStack {
            List(arrayHabitos){ habit in
                createHabitRow(habit: habit)
            }
            .navigationTitle("Mis hábitos")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        print("Crear nuevo hábito")
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
    
    func createHabitRow(habit: Habit) -> some View {
        NavigationLink {
            Text("Aquí va la vista detalle del hábito")
        } label: {
            HabitRowView(habit: habit)
        }
    }
}

#Preview {
    let coordinator = Coordinator()
    return coordinator.makeHabitMainView()
        .environmentObject(coordinator)
}
