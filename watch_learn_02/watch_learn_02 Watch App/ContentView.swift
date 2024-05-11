//
//  ContentView.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 3/23/24.
//

import SwiftUI
import Combine

//@main
//struct FarmtoTable: App {
//    var body: some Scene {
//        WindowGroup {
//
//            ViewManager()
//        }
//    }
//}

var viewManager:ViewManager = ViewManager()

struct ContentView: View {
    
   // @State private var showKitchenFarmView = false
    
    var body: some View {
        
        viewManager
        
//        ZStack {
//            Image("Welcome_Page")
//                .resizable()
//                .ignoresSafeArea()
//            
//            
//            VStack {
//                Spacer()
//                Spacer()
//                HStack
//                {
//                    Button(action: {showKitchenFarmView.toggle()}, label: {
//                        Image("StartButton")
//                            .resizable()
//                            .frame(width:120,height:50)
//                        
//                    })
//                    .frame(width:120, height:50)
//                    .cornerRadius(25)
//                    
//                    
//                }
//                Spacer()
//                
//            }
//        }
//        .sheet(isPresented: $showKitchenFarmView, content: {KitchenFarmView()})
    }
}

#Preview {
    ContentView()
}
