//
//  ContentView.swift
//  CoreDataCamp
//
//  Created by Rogerio Pires on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20) {
                TextField("Add Fruit here...", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button (action: {
                    guard !textFieldText.isEmpty else { return }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Sace")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(10)
                })
                .padding(.horizontal)

                
                List {
                    ForEach(vm.saveEntities) { entity in
                        Text(entity.name ?? "No Name")
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Fuits")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
