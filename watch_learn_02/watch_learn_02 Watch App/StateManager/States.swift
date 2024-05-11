//
//  States.swift
//  watch_learn_02 Watch App
//
//  Created by 王佳馨 on 4/10/24.
//

import Foundation

enum seedType
{
    case seedType_wheat
    case seedType_rice
}

class FarmManager
{
//    public var seedArr: [SeedStates] = [SeedStates(), SeedStates()]
//    public func Init()
//    {
//        seedArr[0].Init(type: seedType.seedType_rice)
//        seedArr[1].Init(type: seedType.seedType_wheat)
//    }
    
    public var RiceObject:SeedStates = SeedStates()
    public var WheatObject:SeedStates = SeedStates()
    
    public func Init()
    {
        RiceObject.Init(type: seedType.seedType_rice, farmType: 0)
        WheatObject.Init(type: seedType.seedType_wheat, farmType: 0)
    }
    
}

class SeedStates: ObservableObject
{
    public var farmType:Int = 0 //0: 湿地， 1:干地
    
    public var name:String = ""
    public var type:seedType = seedType.seedType_rice //Initialize
    public var age:Int = -1    //成熟度。
    public let maxAge:Int = 60 //单位：秒（每秒代表一周）。成熟度达到本数值时已经完全成熟。
    //public var growQuality:Double = 1 //施肥浇水等可以增加质量，长期不浇水可能降低。质量高，成熟度增加更快。<0 种子枯萎。
    public var landNum:Int = 0 //0:第一块地，1:第二块地。
    
    public var heat = 0 //
    public var moisture = 0
    public var light = 0
    public var farmQuality = 0
    
    public func Init(type:seedType, farmType:Int)
    {
        self.type = type
        self.farmType = farmType
        
        if(type == seedType.seedType_rice)
        {
            self.name = "Rice"
        }
        else if(type == seedType.seedType_wheat)
        {
            self.name = "Wheat"
        }
        else
        {
            self.name = "Unspecified"
        }
        
        if(farmType == 0)
        {
            self.heat = 50
            self.moisture = 50
            self.light = 30
            self.farmQuality = 20
        }
        else
        {
            self.heat = 20
            self.moisture = 20
            self.light = 30
            self.farmQuality = 50
        }
            
    }
    
    public func Sunshine()
    {
        self.heat += 10
        self.moisture = self.moisture - 10
        
    }
    
    public func Rain()
    {
        self.heat = self.heat - 10
        self.moisture += 10
    }
    
    public func Water()
    {
        self.moisture += 10
    }
    
    public func Fertilize()
    {
        self.farmQuality += 10
    }
    
    public func ParasiteExpel()
    {
        self.farmQuality += 10
    }
    
}
