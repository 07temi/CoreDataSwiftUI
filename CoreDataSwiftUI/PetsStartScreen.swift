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
    
    //@State private var isActive = true
    
    var body: some View {
        NavigationView {
        TabView {
            ForEach(Array(zip(pets.indices, pets)), id: \.0) { index, pet in
                VStack {
                    Text(pet.name!)
                    NavigationLink(destination: PetDetailScreen(pet: pet)) {
                        Image(pet.picture ?? "star.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(15)
                    }
                    
                    Button("Delete", action: {
                        let deleteItem = IndexSet([index])
                        deleteUser(at: deleteItem)
                        print(index) } )
                    Spacer()
                }
            }
            VStack {
                NavigationLink("Add new") {
                    AddViewScreen()
                }
                Text("add")
                //Button("add", action: {addItem()} )
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    }
    
//    private func addItem() {
//        let newItem = Pets(context: viewContext)
//        newItem.name = "1"//String()
//        newItem.type = "2"
//        
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
//        }
//    }
//    
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
