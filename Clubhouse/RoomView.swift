//
//  RoomView.swift
//  Clubhouse
//
//  Created by Cas on 20/06/2021.
//

import SwiftUI

let columns = [
    GridItem(.adaptive(minimum: 100))
]


struct Person {
    var id = UUID()
    var name: String
    var showEmoji: Bool? = false
}


var  people :  [Person] = [
    Person(name:"Ruth"),
    Person(name:"Mercy"),
    Person(name :"Rich"),
    Person(name:"Manor"),
    Person(name:"Leslie", showEmoji: true),
    Person(name: "Daniel" , showEmoji: true),
    Person(name:"Ed", showEmoji: true),
    Person(name:"Lauret", showEmoji: true),
    Person(name:"John", showEmoji: true),
    Person(name:"Tim"),
    Person(name:"Sarah"),
    Person(name:"Samantha")
]



struct RoomView: View {
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                ZStack (alignment:.bottom){
                    ScrollView( showsIndicators: false){
                        Navbar()
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(Array(zip(people.indices, people)), id: \.0) { index, person in
                                PersonView(name: person.name, showEmoji:person.showEmoji ?? true , image:index + 1 )
                            }
                            
                        }.padding()
                    }
                    
                    Footer()
                }
                .background(Color("bg")).ignoresSafeArea()
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}




struct Navbar: View {
    var body: some View {
        HStack{
            NavigationLink(destination:ContentView()){
                Image(systemName: "chevron.down").font(.title3).foregroundColor(Color.black)
            }
            Spacer()
            Text("Getting started with SwiftUI")
                .font(.headline)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 60)
    }
}




struct Footer: View {
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Spacer()
                RoundedRectangle(cornerRadius: 30)
                    .frame(width:100, height:5)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.top, 20)
            
            HStack{
                HStack{
                    Text("Type a thought here...")
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(.vertical, 18)
                        .padding(.horizontal, 20)
                        .foregroundColor(Color("bg"))
                    
                }
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .frame(maxWidth:.infinity)
                        .opacity(0.5)
                        .foregroundColor(Color("bg"))
                )
                
                Spacer()
                
                HStack{
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(Color("indigo"))
                        .padding(15)
                        .font(.title3)
                }
                .frame(width:50, height:50)
                .background(Color.white)
                .cornerRadius(29)
                .padding(.leading, 10)
                
            }
            .padding(.vertical,10)
            .padding(.horizontal,20)
            
            HStack{
                Text("✌🏽 Leave quitely")
                    .font(.headline)
                    .foregroundColor(Color("indigo"))
                    .padding()
                    .background(Color("bg"))
                    .cornerRadius(50)
                
                Spacer()
                
                
                HStack {
                    Text("✋🏼")
                        .font(.headline)
                        .padding(15)
                        .background(Color("bg"))
                        .background(Color("bg"))
                        .cornerRadius(50)
                    
                    
                    HStack{
                        Image("2")
                            .resizable()
                            .scaledToFill()
                            .frame(width:25, height:25)
                            .padding(2)
                            .background(RoundedRectangle(cornerRadius: 30).foregroundColor(Color("bg")).frame(width:50 , height: 50))
                    }
                    .padding()
                    
                }
                
            }
            .padding()
            .padding(.bottom, 15)
            .background(Color.white)
            .cornerRadius(30)
            
            
            
        }
        .background(Color("indigo"))
        .cornerRadius(30)
    }
}


struct PersonView : View {
    var name: String
    var showEmoji: Bool
    var image: Int
    
    
    var body: some View {
        VStack{
            ZStack{
                Image("\(image)")
                    .resizable()
                    .padding(.top, 8)
                    .frame(width:100, height:100)
                    .background(
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width:100, height:100)
                            .foregroundColor(Color.random)
                            .opacity(0.5)
                    )
                
                
                HStack{
                    Text("🎉")
                        .font(.footnote)
                    
                }
                .frame(width:30, height:30)
                .background(Color.white)
                .cornerRadius(30)
                .padding(.top, 65)
                .padding(.leading, -55)
                .zIndex(1)
                
                
                
                HStack{
                    Image(systemName: "mic.slash").font(.footnote)
                    
                }
                .frame(width:30, height:30)
                .background(Color.white)
                .cornerRadius(30)
                .padding(.top, 65)
                .padding(.leading, 80)
                .hidden(!showEmoji)
            }
            HStack{
                Image(systemName: "staroflife.fill")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .background(RoundedRectangle(cornerRadius: 30)
                                    .frame(width:20, height:20)
                                    .foregroundColor(Color("indigo"))
                    ).hidden(showEmoji)
                
                
                Text(name)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.bottom, 20)
        }
    }
}


extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}




struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
    }
}
