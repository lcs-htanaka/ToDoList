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
    
    
    //MARK: COMPUTED PROPERTIES
    var body: some View {
        NavigationView{
           
            
            
            VStack{
            
                
                List{
                
                    ItemView(
                        title: "study for Chemistry quiz",
                        done: false
                    )
                    
                    
                    ItemView(
                        title: "Finish Computer Science assignment",
                        done: true
                    )
                    
                    
                    ItemView(
                        title: "Go for a run round campus",
                        done: false
                    )
        
                   
                }
                .searchable(text: $searchText)
                
                HStack {
                    TextField("Enter a to-do item", text: $newItemDescription)
                    
                    Button("Add"){
                        //Add the new to-do item
                    }
                    .font(.caption)
                }
                .padding(20)
            }
            .navigationTitle("To do")
        }
    }
}


#Preview{
    LandingView()
}


