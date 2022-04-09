//
//  addView.swift
//  CoreDataSwiftUI
//
//  Created by Артем Черненко on 09.04.2022.
//

import SwiftUI

struct AddViewScreen: View {
    @State private var name = ""
    @State private var sname = ""
    @State private var type = ""
    private let genders = ["Dog", "Cat"]
    
    var body: some View {
        Form {
            Section {
                TextField("Enter first name", text: $name)
                    .disableAutocorrection(true)
                TextField("Enter last name", text: $sname)
                    .disableAutocorrection(true)
                Picker("Select gender", selection: $type) {
                    ForEach(genders, id: \.self) { gender in
                        Text(gender)
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddViewScreen()
    }
}
