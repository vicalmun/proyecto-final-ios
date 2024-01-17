//
//  NewHabitView.swift
//  HabitTracker
//
//  Created by Víctor Alba on 13/11/23.
//

import SwiftUI

struct NewHabitView: View {
    
    @State private var name = ""
    @State private var description = ""
    @State private var timesPerDay = 1
    @State private var selectedCategory = 1
    @Environment(\.dismiss) var dismiss
    
    // Aqui le digo el tipo explicitamente, luego cuando tenga el coordinator
    // TODO: cambiar por servicio y pasarle la implementacion local a esta vista
    let localService: HabitLocalImpl

    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Nombre", text: $name)
                    TextField("Descripción", text: $description)
                    Stepper("Veces al día: \(timesPerDay)", value: $timesPerDay, in: 1...10)
                    
                    // Selection es donde se va a guardar lo que elijamos
                    // se guarda el .tag
                    //                    Picker("Categoría", selection: $selectedCategory) {
                    //                        ForEach(dataSource.foodCategories){ foodCategory in
                    //                            Text(foodCategory.name).tag(foodCategory.id)
                    //                        }
                    //                    }
                }
                
                Section {
                    HStack {
                        Spacer()
                        Button("Guardar") {
                            let habit = Habit(id: UUID(), name: name, description: description, process: 0, startDate: Date.now)
                            //                            dataSource.add(name: name, diners: numberOfDiners, foodCatId: selectedCategory)
                            localService.localSaving(habit: habit)
                            dismiss()
                            
                        }
                        .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
            }
            .navigationTitle("Nueva receta")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
            }
        }
    }
}

#Preview {
    NewHabitView( localService: HabitLocalImpl())
}
