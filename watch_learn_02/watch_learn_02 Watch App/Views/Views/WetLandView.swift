//
//  WetLandView.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 3/30/24.
//

import SwiftUI

struct WetLandView: View {
    @ObservedObject var viewRouter = ViewRouter.shared
    @State private var isSelectedRice:Bool = false
    @State private var isSelectedWheat:Bool = false
    @State private var isSelectedLeft:Bool = false
    @State private var isSelectedRight:Bool = false
    
//    @State private var isPlantedRight:Bool = false
//    @State private var isPlantedLeft:Bool = false
//    @State private var isPlantedRice:Bool = false
//    @State private var isPlantedWheat:Bool = false

    @State var leftLandState:plantState = .none
    @State var rightLandState:plantState = .none
    
    @State var WeathersArr:Array<Weathers> = Array()
    @State var InteractCount:Int = 0 //已经交互的次数。
    @State var WeatherImageName:String = "Weather_Rainy"
    
    //Next thing to do: if isSelectedRice && isSelectedLeft, then isPlantedRight = true;
    //Make the other bools immutable from now.
    
    
    enum plantState //
    {
        case none
        case wheat
        case rice
    }
    
    
    //setWeatherSeries() 根据Weathers类型数量修改 （数字5）
    enum Weathers
    {
        case Sunny
        case Rainy
        case Cloudy
        
        case Flood
        case HiT //Extreme High Temperature
    }
    
    
    init()
    {
        setWeatherSeries(100,false,2)
        debugPrint("Init run")
    }
    
    
    func setWeatherSeries(_ interactMaxCount:Int,_ allowRepeat:Bool,_ sames:Int) //sames: 重复几次交互是同样的天气; interactMaxCount: 交互多少次结束游戏。
    {
        for interact in 0...interactMaxCount-1 //<dayCount;day++)
        {
            var w = Int.random(in: 0..<5) //!!! 5=天气种类数，如有变动记得改。
            //可以0...100，按照天气概率来控制W的值。
            //这样switch需要改成多个if。
            
            var W = Weathers.Sunny
            switch w
            {
            case 0:
                W = Weathers.Sunny
                
            case 1:
                W = Weathers.Rainy
            case 2:
                W = Weathers.Cloudy
            case 3:
                W = Weathers.Flood
            case 4:
                W = Weathers.HiT
            default:
                W = Weathers.Sunny
            }
            
            for _ in 0..<sames
            {
                WeathersArr.append(W)
            }
            //WeathersArr.append(w)
        }
    }
    
    func getWeather(interactCount:Int)   //->Weathers
    {
        switch WeathersArr[interactCount]
        {
        case .Sunny:
            WeatherImageName = "Weather_Sunny"
        case .Cloudy:
            WeatherImageName = "Weather_Cloudy"
        case .Rainy:
            WeatherImageName = "Weather_Rainy"
        case .HiT:
            WeatherImageName = "Weather_HiT"
        case .Flood:
            WeatherImageName = "Weather_Flood"
        default:
            WeatherImageName = "Weather_Sunny"
        }
        
        WeatherImageName = "Weather_Sunny"
        //return WeathersArr[day]
    }
    
    var body: some View {
        
        
        ZStack
        {
            Image("Farm_Wet")
                .resizable()
                .ignoresSafeArea()
            Image(WeatherImageName)
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
                
                HStack
                {
                    ZStack
                    {
                        //The left part of farmland.
                        Button(action:
                        {
                            if(leftLandState == .none)
                            {
                                isSelectedLeft.toggle()
                                //isSelectedRight = !isSelectedLeft
                                
                                if(isSelectedRice)
                                {
                                    leftLandState = .rice
                                }
                                else if(isSelectedWheat)
                                {
                                    leftLandState = .wheat
                                }
                                debugPrint("Land Left: ")
                                debugPrint(isSelectedLeft)
                                debugPrint(" ")
                                
                            };
                            //isPlantedLeft = true
                            
                            

                            
                        }, label: {
                            Image("FarmLand0")
                                .resizable()
                                .frame(width:90,height:95)
                            
                        })
                        .frame(width:90,height:95)
                        .cornerRadius(10.0)
                        .position(x:50,y:0)
                        
                        
                        //Show planted seed.
                        if(leftLandState != .none) //Already planted.
                        {
                            if(leftLandState == .wheat)
                            {
                                Image("SeedWheatPlanted")
                                    .resizable()
                                    .frame(width:30, height:60)
                                    .position(x:50,y:0)
                            }
                            else if(leftLandState == .rice)
                            {
                                Image("SeedRicePlanted")
                                    .resizable()
                                    .frame(width:30, height:60)
                                    .position(x:50,y:0)
                            }
                    
                        }

                       
                        
                        
                        //Temp: watering notice
                        
                        
//                        Button(action: {viewRouter.currentView = .DryWateringView}, label: {
//                                Image("FarmNoticeWater")
//                                .resizable()
//                                .frame(width:100,height:70)
//                        })
//                        .frame(width:100,height:70)
//                        .position(x:60,y:-40)
                        
                    }
                    
                    
                    
                    //The right part of farmland.
                    ZStack
                    {
                        Button(action: 
                        {
                            if(rightLandState == .none)
                            {
                                isSelectedRight.toggle()
                                //isSelectedLeft = !isSelectedRight
                                
                                if(isSelectedRice)
                                {
                                    rightLandState = .rice
                                }
                                else if(isSelectedWheat)
                                {
                                    rightLandState = .wheat
                                }
                                debugPrint("Land Right: ")
                                debugPrint(isSelectedRight)
                                debugPrint(" ")
                                
                            };
                            //isPlantedRight = true
                            

                            
                        },
                            
                            label: {
                            Image("FarmLand1")
                                .resizable()
                                .frame(width:90,height:95)
                        })
                        .frame(width:90,height:95)
                        .cornerRadius(10.0)
                        .position(x:45,y:0)
                        
                        
                        //Show planted seed.
                        if(rightLandState != .none)
                        {
                            if(rightLandState == .wheat)
                            {
                                Image("SeedWheatPlanted")
                                    .resizable()
                                    .frame(width:30, height:60)
                                    .position(x:50,y:0)
                            }
                            else if(rightLandState == .rice)
                            {
                                Image("SeedRicePlanted")
                                    .resizable()
                                    .frame(width:30, height:60)
                                    .position(x:50,y:0)
                            }
                    
                        }

                    }
                }
                
                 
                 
                 //Two seed buttons.
                 HStack
                 {
                     
                     Button(action: {
                         isSelectedRice.toggle()
                         isSelectedWheat = !isSelectedRice
                         
                         debugPrint("Rice Selected: ")
                         debugPrint(isSelectedRice)
                         debugPrint(" ")
                     }, label: {
                         Image("SeedRiceButton")
                             .resizable()
                             .frame(width: 30, height:40)
                     })
                     .frame(width: 50, height:50)
                     .cornerRadius(3)
                     .position(CGPoint(x: 30.0, y: 50.0))
                     
                     
                     Button(action: {
                         
                         isSelectedWheat.toggle()
                         isSelectedRice = !isSelectedWheat
                         
                         debugPrint("Wheat Selected: ")
                         debugPrint(isSelectedWheat)
                         debugPrint(" ")
                     }, label: {
                         Image("SeedWheatButton")
                             .resizable()
                             .frame(width: 30, height:45)
                     })
                     .frame(width: 50, height:50)
                     .cornerRadius(3)
                     .position(CGPoint(x: -3.0, y: 49.0))
                     
//                     Button(action: {
//                         InteractCount+=1
//                         //getWeather(interactCount: InteractCount)
//                         
//                     },label: {
//                         
//                     })

                 }
       
            }
        }
    }
}





class PlantSeedsFarmlandsManager: ObservableObject
{
    public var isSelectedRice:Bool = false
    public var isSelectedWheat:Bool = false
    public var isSelectedLeft:Bool = false
    public var isSelectedRight:Bool = false
    
    public var isPlantedRight:Bool = false
    public var isPlantedLeft:Bool = false
    
    public func createGrowingSeed()
    {
        if(self.isPlantedLeft)
        {
            
        }
    }
}

#Preview {
    WetLandView()
}
