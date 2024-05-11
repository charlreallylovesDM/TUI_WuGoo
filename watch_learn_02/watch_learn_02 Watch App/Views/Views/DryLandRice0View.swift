//
//  DryLandRice0View.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 3/30/24.
//

import SwiftUI

struct DryLandRice0View: View {
    @ObservedObject var viewRouter = ViewRouter.shared
    var body: some View {
        ZStack
        {
            Image("Farm_Dry")
                .resizable()
                .ignoresSafeArea()
            VStack
            {
                Button(action: {viewRouter.currentView = .FarmView}, label: {
                   Image("FarmButtonBack")
                        .resizable()
                        .frame(width:40,height:40)
                })
                .frame(width:40,height:40)
                .cornerRadius(10.0)
                .ignoresSafeArea()
                .position(CGPoint(x: 40.0, y: 10.0))
                
                
            //The two farm lands
               HStack
               {
                   Button(action:
                   {
                       
                       
                   }, label: {
                       Image("FarmLandRice0")
                           .resizable()
                           .frame(width:90,height:95)
                       
                   })
                   .frame(width:90,height:95)
                   .cornerRadius(10.0)
                   .position(x:50,y:0)
                   
                   
                   Button(action: {}, label: {
                       Image("FarmLand1")
                           .resizable()
                           .frame(width:90,height:95)
                   })
                   .frame(width:90,height:95)
                   .cornerRadius(10.0)
                   .position(x:45,y:0)
               }
               
                
                
                //Two seed buttons.
                HStack
                {
                    
                    Button(action: {
                        
                    }, label: {
                        Image("SeedRiceButton")
                            .resizable()
                            .frame(width: 30, height:40)
                    })
                    .frame(width: 50, height:50)
                    .cornerRadius(3)
                    .position(CGPoint(x: 30.0, y: 50.0))
                    
                    
                    Button(action: {
                    }, label: {
                        Image("SeedWheatButton")
                            .resizable()
                            .frame(width: 30, height:45)
                    })
                    .frame(width: 50, height:50)
                    .cornerRadius(3)
                    .position(CGPoint(x: -3.0, y: 49.0))
                }
            }
        }
    }
}

#Preview {
    DryLandRice0View()
}
