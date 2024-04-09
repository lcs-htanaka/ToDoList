//
//  ContentView.swift
//  ToDoList
//
//  Created by 田中宏貴 on 2024-04-05.
//

import SwiftUI

struct LandingView: View {
    
    //MARK: STORED PROPERTIES
   
    //The item currently being added
    @State var newItemDescription = ""
    
    //The search text
    @State var searchText = ""
    
    //the list of to-do items
    @State var todos: [TodoItem] = exampleItems
    
    //MARK: COMPUTED PROPERTIES
    var body: some View {
        NavigationView{
        
            VStack{
            
                
                List(todos) { todo in
                
                    ItemView(currentItem: todo)
                    //Delete a to-do item
                        .swipeActions {
                            Button(
                                "Delete", role: .destructive, action: {
                                    delete(todo)
                                }
                            )
                            
                        }

                    
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
        
        //Appened to the array
        todos.append(todo)
    }
    
    func delete(_ todo: TodoItem) {
        
        //Remove the provided to-do item from the array
        todos.removeAll { currentItem in currentItem.id == todo.id
            
        }
        
    }
    
}

#Preview{
    LandingView()
}


