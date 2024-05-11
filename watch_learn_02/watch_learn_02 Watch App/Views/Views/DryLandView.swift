//
//  DryLandView.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 3/30/24.
//

import SwiftUI

struct DryLandView: View {
    @ObservedObject var viewRouter = ViewRouter.shared
    
    @State private var isSelectedRice:Bool = false
    @State private var isSelectedWheat:Bool = false
    @State private var isPlantedRice:Bool = false
    @State private var isPlantedWheat:Bool = false
    
    
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
                       viewRouter.currentView = .DryLandRice0View
//                       if(isSelectedRice)
//                       {
//                           isPlantedRice = true
//                       }
//                       
//                       if(isPlantedRice)
//                       {
//                           Image("SeedRicePlanted")
//                               .resizable()
//                               .frame(width:50,height:50)
//                       }
                       
                   }, label: {
                       Image("FarmLand0")
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
                    
                    Button(action: {isSelectedRice.toggle()
                        debugPrint(isSelectedRice)
                    }, label: {
                        Image("SeedRiceButton")
                            .resizable()
                            .frame(width: 30, height:40)
                    })
                    .frame(width: 50, height:50)
                    .cornerRadius(3)
                    .position(CGPoint(x: 30.0, y: 50.0))
                    
                    
                    Button(action: {isSelectedWheat.toggle()
                        debugPrint(isSelectedWheat)
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

//class seeSelectionManager:ObservableObject
//{
//    var isSelectedRice:Bool = false
//    var isSelectedWheat:Bool = false
//}


#Preview {
    DryLandView()
}
