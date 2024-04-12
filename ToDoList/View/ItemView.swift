//
//  ItemView.swift
//  ToDoList
//
//  Created by 田中宏貴 on 2024-04-08.
//

import SwiftUI

struct ItemView: View {
    
   @Bindable var currentItem: TodoItem
    
    
    
    var body: some View {
        Label(
            title: {
                TextField("Enter a to-do item", text: $currentItem.title, axis: .vertical)
            }, icon: {
                Image(systemName: currentItem.done == true ? "checkmark.circle" : "circle")
                //Tap to mark as done
                    .onTapGesture {
                        currentItem.done.toggle()
                    }
            }
        )
    }
}

//#Preview {
//    List{
//        ItemView(currentItem: Binding.constant(firstItem))
//        ItemView(currentItem: Binding.constant(secondItem))
//        ItemView(currentItem: Binding.constant(thirdItem))

//    }
    
//}
