//
//  ContentView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/10/23.
//

import SwiftUI
import SwiftData

struct ContentView_OG: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @StateObject private var subViewModel1 = SubView1Model()
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            VStack{
                                Text(item.name)
                                Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                            }
                        } label: {
                            Text(item.name)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .sheet(isPresented: $subViewModel1.showingSheet) {
                AddNewCar(viewModel: subViewModel1)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: {
                        subViewModel1.showingSheet.toggle()
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}


class SubView1Model: ObservableObject {
    @Published var title: String = "Sub View 1"
    @Published var showingSheet: Bool = false
}

struct SubView1: View {
    @ObservedObject var viewModel: SubView1Model

    var body: some View {
        
        Text(viewModel.title)
        
        Button(action: {
            viewModel.showingSheet.toggle()
        }) {
            Text("Dismiss SubView1")
        }
    }
}

struct AddNewCar: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: SubView1Model
    @State private var name: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("New Item")) {
                
                DataInput(title: "Name", userInput: $name)
            }
            
            Button(action: addItem) {
                Text("Add Item")
                }
            }
    }
    

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), name: name)
            modelContext.insert(newItem)
            viewModel.showingSheet.toggle()
        }
    }
    
}

struct DataInput: View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

#Preview {
    ContentView_OG()
        .modelContainer(for: Item.self, inMemory: true)
}
