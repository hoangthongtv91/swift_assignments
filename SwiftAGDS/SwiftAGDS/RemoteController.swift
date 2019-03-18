//
//  RemoteController.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-15.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func remoteControllerHelper(_ desiredChannel: Int,_ numberOfDigits: Int,_ functionalButtonArray: [Int],_ min: inout Int,_ buttonCount: inout Int,_ soFar: String = "0"){
    if numberOfDigits == 0{
    }else{
        if abs(desiredChannel - Int(soFar)!) < min{
            min = abs(desiredChannel - Int(soFar)!)
            buttonCount = soFar.count + min - 1
        }
        for i in functionalButtonArray{
            remoteControllerHelper(desiredChannel, numberOfDigits - 1, functionalButtonArray, &min, &buttonCount, soFar + "\(i)")
        }
    }
}

func printRemoteController(){
    var functionalButtonArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    print("Input the channel you want to get to?")
    let channel = readLine()
    let numberOfDigits = channel!.count
    let desiredChannel: Int = Int(channel!)!
    
    print("Input number of broken button")
    let numberOfBroken = readLine()
    
    print("Input brokens button, separated by space")
    var brokenArray = readLine()!.split(separator: " ").map{Int($0)}
    while brokenArray.count != Int(numberOfBroken!){
        print("The number of broken buttons is \(numberOfBroken!), input again")
        brokenArray = readLine()!.split(separator: " ").map{Int($0)}
    }
    functionalButtonArray.removeAll(where: {brokenArray.contains($0)})
    var min: Int = desiredChannel
    var buttonCount: Int = 0
    remoteControllerHelper(desiredChannel, numberOfDigits + 1, functionalButtonArray, &min, &buttonCount)
    if buttonCount < abs(desiredChannel - 100){
        print(buttonCount)
    }else{
        print(abs(desiredChannel - 100))
    }
    
}
