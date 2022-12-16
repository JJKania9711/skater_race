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
