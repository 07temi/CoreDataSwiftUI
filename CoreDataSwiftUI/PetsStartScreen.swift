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
            ForEach(Array(zip(pets.indices, pets)), id: \.0) { index, pet in
                VStack {
                    Text(pet.name!)
                    Button("Delete", action: {
                        let deleteItem = IndexSet([index])
                        deleteUser(at: deleteItem)
                        print(index) } )
                }
            }
            VStack {
                Text("add")
                Button("add", action: {addItem()} )
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    
    private func addItem() {
        let newItem = Pets(context: viewContext)
        newItem.name = "1"//String()
        newItem.type = "2"
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteUser(at offsets: IndexSet) {
        for index in offsets {
            let user = pets[index]
            viewContext.delete(user)
        }
        try? viewContext.save()
    }
    
//    private func deleteItems(offsets: IndexSet) {
//        offsets.map { pets[$0] }.forEach(viewContext.delete)
//        
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
//        }
//    }
}

struct PetsStartScreen_Previews: PreviewProvider {
    static var previews: some View {
        PetsStartScreen()
    }
}
