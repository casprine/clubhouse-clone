//
//  ContentView.swift
//  Clubhouse
//
//  Created by Cas on 19/06/2021.
//

import SwiftUI



struct ITag {
    var id = UUID()
    var name :String
}


var tags : [ITag] = [
    ITag(name:"🕊 Twitter"),
    ITag(name:"👨🏼‍💻 SwiftUI"),
    ITag(name: "🎨 Design"),
    ITag(name: "🎯 Figma"),
    ITag(name: "👀 Clone")
]

struct ContentView: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment:.bottom){
                ScrollView(showsIndicators:false){
                    Header()
                    Tags()
                    UpcomingMeeting()
                    HappeningNow()
                }
                
                TabBar()
            }.background(Color("bg")).ignoresSafeArea()
        }
    }
}



struct Header: View{
    var body: some View {
        HStack{
            Text("Good Morning,\nCasprine")
                .font(.headline)
            
            Spacer()
            Image(systemName: "magnifyingglass").font(.title3)
            
            HStack{
                Image("1")
                    .resizable()
                    .scaledToFill()
                    .frame(width:30, height:30)
                    .padding(2)
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color("indigo")))
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 50)
    }
}



struct Tags: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:-13.0){
                ForEach(tags, id:\.id) { tag in
                    Tag(name: tag.name)
                }
                .padding()
            }
        }
    }
}




struct Tag: View {
    var name : String
    var body: some View {
        Text(name)
            .font(.footnote)
            .padding(.vertical, 12)
            .padding(.horizontal, 15)
            .background(RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color.random)
                            .opacity(0.4)
            )
    }
}


struct UpcomingMeeting:View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Upcoming").font(.headline)
            
            HStack{
                Rectangle()
                    .frame(width:3, height:40)
                    .padding(.leading, 20)
                    .foregroundColor(Color("barcolor"))
                
                VStack(alignment: .leading){
                    Text("10:00 - 12:00").foregroundColor(Color.white).padding(.bottom,0.5).padding(.top, 30)
                    Text("Design talks and chill").foregroundColor(Color.white).bold().padding(.bottom,30)
                }
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .padding()
                    .font(.headline)
                    .foregroundColor(Color.white)
                
                
            }
            .background(Color("indigo"))
            .cornerRadius(30)
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
    }
}



struct HappeningNow : View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Happening now").font(.headline).padding(.bottom , 5)
            HappendingNowCard()
            HappendingNowCard()
            HappendingNowCard()
        }.padding()
    }
}



struct HappendingNowCard: View{
    var body: some View{
        HStack{
            HStack{
                VStack(alignment:.leading){
                    VStack(alignment:.leading){
                        Text("Startup club")
                            .bold()
                            .textCase(.uppercase)
                            .frame(maxWidth:.infinity, alignment:.leading)
                        Text("Pitch your startup ideas to VS & top\nEntrepreneus")
                            .foregroundColor(Color.gray)
                            .font(.subheadline)
                            .padding(.top,1)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top,25)
                    
                    HStack{
                        Image("1")
                            .resizable()
                            .scaledToFill()
                            .frame(width:30, height:30)
                            .padding(2)
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.random))
                        
                        Image("2")
                            .resizable()
                            .scaledToFill()
                            .frame(width:30, height:30)
                            .padding(2)
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.random))
                        
                        
                        Image("3")
                            .resizable()
                            .scaledToFill()
                            .frame(width:30, height:30)
                            .padding(2)
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.random))
                        
                        
                        Spacer()
                        
                        HStack{
                            Image(systemName: "person.fill")
                                .font(.subheadline)
                            Text("354")
                                .font(.subheadline)
                            Image(systemName: "mic.fill")
                                .font(.subheadline)
                            Text("354")
                                .font(.subheadline)
                        }
                        .padding(.horizontal,10)
                        .frame(height:35)
                        .background(Color("bg"))
                        .cornerRadius(12, antialiased: true)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 15)
                    .padding(.bottom, 25)
                    
                }
            }
            .background(Color("gray.100"))
            .cornerRadius(30)
        }
        .padding(.bottom, 20)
    }
}



struct TabBar: View {
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "calendar")
                    .font(.headline)
                    .padding(10)
            }
            .background(Color("tabBarIconBg"))
            .cornerRadius(12)
            
            
            Spacer()
            
            
            HStack{
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(Color.white)
                
                Text("Start room").foregroundColor(Color.white)
            }
            .padding(10)
            .padding(.horizontal, 5)
            .background(Color("indigo"))
            .cornerRadius(15, antialiased:true)
            
            
            Spacer()
            
            HStack{
                Image(systemName: "person")
                    .padding(10)
            }
            .background(Color("tabBarIconBg"))
            .cornerRadius(12)
            
        }
        .padding()
        .padding(.bottom, 10)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("bg").opacity(0.5), .white, .white , .white, .white]), startPoint: .top, endPoint: .bottom)

        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1))
    }
}
