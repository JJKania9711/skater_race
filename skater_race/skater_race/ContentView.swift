//
//  ContentView.swift
//  skater_race
//
//  Created by James on 12/15/22.
//

import SwiftUI

struct ContentView: View {
    
    // State variables to store the dice rolls and skater positions
    @State var skaterSelectedText: String = "Skater"
    @State var skaterStridesText: String = ""
    @State var skaterSelected: Int = 0
    @State var skaterStrides: Int = 0
    @State var skater1Ypos: CGFloat = -550
    @State var skater2Ypos: CGFloat = -550
    @State var skater3Ypos: CGFloat = -550
    @State var skater4Ypos: CGFloat = -550
    @State var skater5Ypos: CGFloat = -550
    
    
    var body: some View {
        VStack{
                    HStack {
                        VStack(alignment: .center) {
                            Text("START")
                                .font(.headline)
                        }
                    }
                    ZStack(alignment: .bottom) {
                        Image("ice")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        HStack(){
                            Image("skater1")
                                .position(x:10, y:skater1Ypos)
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            Image("skater2")
                                .position(x:20, y:skater2Ypos)
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            Image("skater3")
                                .position(x:30, y:skater3Ypos)
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            Image("skater4")
                                .position(x:40, y:skater4Ypos)
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            Image("skater5")
                                .position(x:50, y:skater5Ypos)
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                        
                        VStack {
                            Text("FINISH")
                            .font(.headline)
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text(skaterSelectedText)
                                    .font(.headline)
                                Text(skaterStridesText)
                                    .font(.subheadline)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Button(
                                 "Roll",
                                 action: {
                                   //roll the dice to see which skater moves and how far
                                   skaterSelected = randomDiceRoll()
                                   skaterStrides = randomDiceRoll()
                                   skaterSelectedText = "Skater " + String(skaterSelected)
                                   skaterStridesText  = "Moves " + String(skaterStrides) + " Strides"
                                   
                                   //this code block moves the skater
                                   var skaterPosChange = CGFloat(skaterStrides * 10)
                                     switch skaterSelected {
                                     case 1:
                                         skater1Ypos = skater1Ypos + skaterPosChange
                                     case 2:
                                         skater2Ypos = skater2Ypos + skaterPosChange
                                     case 3:
                                         skater3Ypos = skater3Ypos + skaterPosChange
                                     case 4:
                                         skater4Ypos = skater4Ypos + skaterPosChange
                                     case 5:
                                         skater5Ypos = skater5Ypos + skaterPosChange
                         
                                     default:
                                         // same as case 6 = move all skaters
                                             skater1Ypos = skater1Ypos + skaterPosChange
                                             skater2Ypos = skater2Ypos + skaterPosChange
                                             skater3Ypos = skater3Ypos + skaterPosChange
                                             skater4Ypos = skater4Ypos + skaterPosChange
                                             skater5Ypos = skater5Ypos + skaterPosChange
                                     }
                               })
                               .padding()
                               .background(Color(red: 0, green: 0, blue: 0.5))
                               .foregroundColor(.white)
                               .cornerRadius(15)
                                   
            
                            } //  VStack
                            
                        } //  HStack
                        .padding()
                        .foregroundColor(.primary)
                        .background(Color.primary
                            .colorInvert()
                            .opacity(0.75))
                    } // ZStack
                }
                


            }
        }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func randomDiceRoll() -> Int {
    // This function returns a random number between 1 and 6
    return Int(arc4random_uniform(6) + 1)
}
