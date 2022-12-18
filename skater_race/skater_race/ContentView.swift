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
    
    @State private var showSheet = false
    @State private var strWhoWon: String = ""
    
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
                                   let skaterPosChange = CGFloat(skaterStrides * 10)
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
                                     
                                     
                                     // Check to see if any skater crossed the finish line
                                      var haveWinner: Bool = false
                                      strWhoWon = ""
                                      haveWinner = checkForWinner(skater1Distance: skater1Ypos, skater2Distance: skater2Ypos, skater3Distance: skater3Ypos, skater4Distance: skater4Ypos, skater5Distance: skater5Ypos, strWinners: &strWhoWon )
                                     if haveWinner {
                                         showSheet = true
                                         //reset the game
                                         skater1Ypos = -550
                                         skater2Ypos = -550
                                         skater3Ypos = -550
                                         skater4Ypos = -550
                                         skater5Ypos = -550
                                     }
                               })
                               .padding()
                               .background(Color(red: 0, green: 0, blue: 0.5))
                               .foregroundColor(.white)
                               .cornerRadius(15)
                               .sheet(isPresented: $showSheet) {
                                   SheetContentView(strWinnerText: strWhoWon)
                               }
            
                            } // :- VStack
                            
                        } //  :- HStack
                        .padding()
                        .foregroundColor(.primary)
                        .background(Color.primary
                            .colorInvert()
                            .opacity(0.75))
                    } // :- ZStack
                }
                


            }
        }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SheetContentView: View {
      let strWinnerText: String
      @Environment(\.dismiss) var dismiss

      var body: some View {
          VStack(alignment: .center) {
              Image("winner")
                  .frame(width: 100, height: 100, alignment: .center)
          }
          VStack(alignment: .center) {
              Text(strWinnerText)
                  .font(.headline)
              Button(
                  "Press to Play Again",
                  action: {
                      dismiss()
                     
                  })
              .font(.title)
              .padding()
              
          }
      }
  }






func randomDiceRoll() -> Int {
    // This function returns a random number between 1 and 6
    return Int(arc4random_uniform(6) + 1)
}

func checkForWinner(skater1Distance: CGFloat, skater2Distance: CGFloat, skater3Distance: CGFloat, skater4Distance: CGFloat, skater5Distance: CGFloat, strWinners: inout String) -> Bool {
    
    let finishLineYPos: CGFloat = 0
    var nbrWinners: Int = 0
    
    if skater1Distance > finishLineYPos {
        nbrWinners+=1
        strWinners = "1"
        
    }
    if skater2Distance > finishLineYPos {
        if nbrWinners > 0{
            strWinners = strWinners + ",2"
        }
        else {strWinners = strWinners + "2"}
        nbrWinners+=1
    }
    if skater3Distance > finishLineYPos {
        if nbrWinners > 0{
            strWinners = strWinners + ",3"
        }
        else {strWinners = strWinners + "3"}
        nbrWinners+=1
    }
    if skater4Distance > finishLineYPos {
        if nbrWinners > 0{
            strWinners = strWinners + ",4"
        }
        else{strWinners = strWinners + "4"}
        nbrWinners+=1
    }
    if skater5Distance > finishLineYPos {
        if nbrWinners > 0{
            strWinners = strWinners + ",5"
        }
        else {strWinners = strWinners + "5"}
        nbrWinners+=1
    }
    
    if nbrWinners > 0 {
        strWinners = "Skater" + strWinners + "won the race"
        return true
    }
    else if nbrWinners > 1 {
        strWinners = "Skaters" + strWinners + "all won the race"
        return true
    }
    else {
        return false
    }
}
    

