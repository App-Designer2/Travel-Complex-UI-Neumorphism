//
//  ContentView.swift
//  Travel
//
//  Created by App Designer2 on 07.06.20.
//  Copyright © 2020 App Designer2. All rights reserved.
//

import SwiftUI
struct Info : Identifiable {
    let id : Int
    var names, details,prices,image,from,to: String
}

struct ContentView: View {
    var infos : [Info] = [
    .init(id: 0, names: "Dom Rep", details: "Enjoy the best places from dom Rep, Beaches, Hotels, etc.", prices: "$350", image: "rd",from: "5:00 am", to: "6:00 am"),
    .init(id: 1, names: "Germany", details: "Enjoy the best places from dom Rep, Beaches, Hotels, etc.", prices: "$100", image: "alemania",from: "6:00 am", to: "7:00 am"),
    .init(id: 2, names: "Brazil", details: "Enjoy the best places from dom Rep, Beaches, Hotels, etc.", prices: "$100", image: "brazil",from: "7:00 am", to: "8:00 am"),
    .init(id: 3, names: "Africa", details: "Enjoy the best places from dom Rep, Beaches, Hotels, etc.", prices: "$200", image: "africa",from: "8:00 am", to: "9:00 am"),
    .init(id: 4, names: "Rusia", details: "Enjoy the best places from dom Rep, Beaches, Hotels, etc.", prices: "$200", image: "rusia",from: "10:00 am", to: "11:00 am"),
    .init(id: 5, names: "Colombia", details: "Enjoy the best places from dom Rep, Beaches, Hotels, etc.", prices: "$300", image: "Colombia",from: "11:00 am", to: "12:00 am")]
    
    @State var rating = UserDefaults.standard.integer(forKey: "rating")
    var body: some View {
        ZStack {
        Rectangle()
            .fill(Color("back"))
            .edgesIgnoringSafeArea(.all)
        //VStack {
            
                
                
            ScrollView(.vertical,showsIndicators: false) {
                ZStack {
                    Image("ucrania")
                    .resizable()
                        .frame(width: UIScreen.main.bounds.width - 0, height: 260)
                    
                    VStack(alignment: .leading) {
                    HStack/*(alignment: .top)*/ {
                        Button(action: {}) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title)
                                .foregroundColor(.white)
                            
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 28) {
                        Button(action: {}) {
                            Image(systemName: "phone")
                            .font(.title)
                            .foregroundColor(.white)
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "line.horizontal.3.decrease")
                            .font(.title)
                            .foregroundColor(.white)
                        }
                        }//HStack child
                    }.padding()
                    .offset(y: 35)
                        
                        VStack(alignment: .leading, spacing: 5) {
                        Spacer()
                            Text("Ucraina").bold()
                            .padding(6)
                        .font(.title)
                        .foregroundColor(.white)
                                .background(Color.black.opacity(0.45))
                            .cornerRadius(5)
                            HStack {
                                Group {
                                Image(systemName: "paperplane.fill")
                                
                            Text("Kiev")
                                    
                                }.padding(2)
                                .font(.caption)
                                .foregroundColor(.white)
                                        .background(Color.black.opacity(0.75))
                                    .cornerRadius(5)//Group
                                Spacer()
                                
                                Text("$300").bold()
                                    .foregroundColor(.white)
                            }
                            
                        }.padding()
                    }//Main VStack
                    
                }//.padding(.top)
                .edgesIgnoringSafeArea(.top)
                
                ForEach(infos, id: \.id) { info in
                    ZStack {
                        Rectangle()
                            .fill(Color("back"))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 210)
                        .cornerRadius(16)
                            .shadow(color: Color("light"),radius: 6,x: -6, y: -6)
                        .shadow(color: Color("dark"),radius: 6,x: 6, y: 6)
                        
                        HStack(alignment: .top) {
                    Image(info.image)
                        .renderingMode(.original)
                    .resizable()
                        .frame(width: 160, height: 200)
                        .cornerRadius(16)
                            
                            VStack(alignment: .leading, spacing: 10) {
                        
                            Text(info.names)
                                .bold()
                                .font(.headline)
                                
                                
                                Text(info.details)
                                .lineLimit(9)
                                
                                //Start rating
                                VStack(alignment: .leading,spacing: 10) {
                                HStack {
                                    ForEach(0..<5 , id: \.self) { star in
                                        HStack {
                                            Button(action: {
                                                self.rating = star
                                                UserDefaults.standard.set(self.rating > star, forKey: "rating")
                                            }) {
                                                Image(systemName: self.rating >= star ? "star.fill": "star")
                                                    .foregroundColor(self.rating >= star ? .yellow : .gray)
                                            }//Btn Star
                                            }.padding(1)
                                        .background(Color("back"))
                                        
                                        .shadow(color: Color("light"),radius: 6,x: -6, y: -6)
                                        .shadow(color: Color("dark"),radius: 6,x: 6, y: 6)//HStack child
                                    }//ForEach Star
                                } //Main HStack Star
                                //End rating
                                
                                //Start from
                                HStack {
                                    Text(info.from)
                                        .font(.caption)
                                        .padding(4)
                                        //.foregroundColor(.white)
                                        .background(Color("back"))
                                        .cornerRadius(5)
                                    .shadow(color: Color("light"),radius: 6,x: -6, y: -6)
                                    .shadow(color: Color("dark"),radius: 6,x: 6, y: 6)
                                    
                                    Text(info.to)
                                    .font(.caption)
                                    .padding(4)
                                    //.foregroundColor(.black)
                                    .background(Color("back"))
                                    .cornerRadius(5)
                                    .shadow(color: Color("light"),radius: 6,x: -6, y: -6)
                                    .shadow(color: Color("dark"),radius: 6,x: 6, y: 6)
                                }//End to
                            }//
                            }//VStack Img,names,details, etc
                            
                            VStack (alignment: .leading) {
                            Text(info.prices)
                            .bold()
                            .font(.headline)
                            
                                Text("per week")
                            }//.foregroundColor(.black)//VStack prices
                        }.offset(x: -2,y: 4)//HStack Main
                    }//ZStack
                }.padding()
            }
        //}//ZStack rectangle
        }.edgesIgnoringSafeArea(.top)
    }
}

//You could find the source code on the description, i will leave the GitHub Link on it.
//I hope you like it.

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
