//
//  PetDetailScreen.swift
//  CoreDataSwiftUI
//
//  Created by Артем Черненко on 12.04.2022.
//

import SwiftUI

struct PetDetailScreen: View {
    let pet: Pets
    var body: some View {
        HStack {
            Image(pet.picture ?? "star.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            Text("\(pet.name!)")
        }
        Spacer()
    }
}

//struct PetDetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        PetDetailScreen()
//    }
//}
