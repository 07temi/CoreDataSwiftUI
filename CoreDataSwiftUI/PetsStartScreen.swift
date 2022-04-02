//
//  PetsStartScreen.swift
//  CoreDataSwiftUI
//
//  Created by Артем Черненко on 02.04.2022.
//

import SwiftUI

struct PetsStartScreen: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pets.name, ascending: true)],
        animation: .default)
    private var pets: FetchedResults<Pets>
    
    var body: some View {
        TabView {
            ForEach(pets) { pet in
                Text(pet.name!)
            }
            Text("add")
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct PetsStartScreen_Previews: PreviewProvider {
    static var previews: some View {
        PetsStartScreen()
    }
}
