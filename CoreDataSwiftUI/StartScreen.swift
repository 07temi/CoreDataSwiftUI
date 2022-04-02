//
//  StartScreen.swift
//  CoreDataSwiftUI
//
//  Created by Артем Черненко on 02.04.2022.
//

import SwiftUI
import CoreData

struct StartScreen: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pets.name, ascending: true)],
        animation: .default)
    private var pets: FetchedResults<Pets>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(pets) { pet in
                    NavigationLink {
                        Text("Item at \(pet.name!)")
                    } label: {
                        Text(pet.name!)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
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
    
    private func deleteItems(offsets: IndexSet) {
        offsets.map { pets[$0] }.forEach(viewContext.delete)
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
    
}


struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()//.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
