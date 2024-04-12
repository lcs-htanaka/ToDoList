//
//  ContentView.swift
//  ToDoList
//
//  Created by 田中宏貴 on 2024-04-05.
//

import SwiftData
import SwiftUI

struct LandingView: View {
    
    //MARK: STORED PROPERTIES
   
    //The item currently being added
    @State var newItemDescription = ""
    
    //The search text
    @State var searchText = ""
    
    //Access the model context (required to do additions, deletions, updates, et cetra)
    @Environment(\.modelContext) var modelContext
    
    //the list of to-do items
    @Query var todos: [TodoItem]
    
    //MARK: COMPUTED PROPERTIES
    var body: some View {
        NavigationView{
        
            VStack{
            
                
                List {
                    ForEach(todos) { todo in
                        
                        ItemView(currentItem: todo)

                    }
                    .onDelete(perform: removeRows)
                }
                .searchable(text: $searchText)
                
                
                
                HStack {
                    TextField("Enter a to-do item", text: $newItemDescription)
                    
                    Button("Add"){
                        //Add the new to-do item
                    }
                    .font(.caption)
                    .disabled(newItemDescription.isEmpty == true)
                }
                .padding(20)
            }
            .navigationTitle("To do")
        }
    }
    
    
    
    
    //MARK: FUNCTIONS
    func createToDo(withTitle title: String) {
        
        //Create the new to-do iitem instance
        let todo = TodoItem(title: title, done: false)
        
        //Ude the model context to insert the new to-do
        modelContext.insert(todo)
    }
    
    
    func removeRows(at offsets: IndexSet) {
        
        // Accept the offset within the list
        // (the position of the item being deleted)
        //
        // Then ask the model context to delete this
        // for us, from the 'todos' array
        for offset in offsets {
            modelContext.delete(todos[offset])
        }
    }
    
}

//#Preview{
//    LandingView()
//}


